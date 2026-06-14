param(
  [string]$WorkspaceRoot
)

$ErrorActionPreference = "Stop"

$PythonScript = Join-Path $PSScriptRoot "refresh_data.py"
if ($WorkspaceRoot) {
  & python $PythonScript --workspace "$WorkspaceRoot"
} else {
  & python $PythonScript
}
exit $LASTEXITCODE

if (-not $WorkspaceRoot) {
  $WorkspaceRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..\..")).Path
}

$AppRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$OutFile = Join-Path $AppRoot "data\planner-data.js"
$Today = Get-Date

function Get-ProjectName([string]$fileName) {
  return ([System.IO.Path]::GetFileNameWithoutExtension($fileName) -replace "_todos$", "" -replace "_notes$", "")
}

function Get-DateText($text) {
  $match = [regex]::Match($text, "\d{4}-\d{2}-\d{2}")
  if ($match.Success) { return $match.Value }
  return $null
}

function Get-CleanText([string]$text) {
  if (-not $text) { return "" }
  $value = $text -replace "^- \[[ x]\]\s*", ""
  $value = $value -replace "^~~|~~$", ""
  $value = $value -replace "\s+", " "
  return $value.Trim()
}

function Get-AgeDays([string]$dateText) {
  if (-not $dateText) { return $null }
  try {
    return [int](New-TimeSpan -Start ([datetime]::Parse($dateText)) -End $Today.Date).TotalDays
  } catch {
    return $null
  }
}

function Add-Item($list, $kind, $project, $section, $id, $title, $date, $owner, $source, $raw) {
  $ageDays = Get-AgeDays $date
  $urgency = "normal"
  if ($date) {
    if ($ageDays -gt 0) { $urgency = "overdue" }
    elseif ($ageDays -eq 0) { $urgency = "today" }
    elseif ($ageDays -le -7) { $urgency = "upcoming" }
  }
  $list.Add([pscustomobject]@{
    kind = $kind
    project = $project
    section = $section
    id = $id
    title = $title
    date = $date
    owner = $owner
    source = $source
    raw = $raw
    ageDays = $ageDays
    urgency = $urgency
  }) | Out-Null
}

function Read-TodoFiles {
  $items = [System.Collections.Generic.List[object]]::new()
  $files = Get-ChildItem -Path $WorkspaceRoot -Filter "*_todos.md" -File

  foreach ($file in $files) {
    $project = Get-ProjectName $file.Name
    $section = ""
    $lines = Get-Content -LiteralPath $file.FullName

    foreach ($line in $lines) {
      if ($line -match "^##\s+(.+)$") {
        $section = $matches[1]
        continue
      }

      if ($line -notmatch "^- \[ \]") { continue }
      $clean = Get-CleanText $line
      $captured = $null
      $capMatch = [regex]::Match($line, "Captured (\d{4}-\d{2}-\d{2})")
      if ($capMatch.Success) { $captured = $capMatch.Groups[1].Value }

      if ($section -eq "Open TODOs") {
        $m = [regex]::Match($line, "(TODO \d+) - Due (\d{4}-\d{2}-\d{2}) - (.*?)(?: Captured| Source:|$)")
        if ($m.Success) {
          Add-Item $items "todo" $project $section $m.Groups[1].Value $m.Groups[3].Value $m.Groups[2].Value $null $captured $line
        }
      } elseif ($section -eq "Recurring TODOs") {
        $m = [regex]::Match($line, "(TODO \d+) - Recurring (.*?) - Next due (\d{4}-\d{2}-\d{2}) - (.*?)(?: Last completed| Captured| Source:|$)")
        if ($m.Success) {
          Add-Item $items "recurring" $project $section $m.Groups[1].Value $m.Groups[4].Value $m.Groups[3].Value $null $captured $line
        }
      } elseif ($section -eq "Milestones") {
        $m = [regex]::Match($line, "(MS \d+) - Milestone (\d{4}-\d{2}-\d{2}) - (.*?)(?: Captured| Source:| Rescheduled| Reconfirmed|$)")
        if ($m.Success) {
          Add-Item $items "milestone" $project $section $m.Groups[1].Value $m.Groups[3].Value $m.Groups[2].Value $null $captured $line
        }
      } elseif ($section -eq "Open Questions") {
        $m = [regex]::Match($line, "(OQ \d+) - (?:(.*?) - )?(.*?)(?: Captured| Source:|$)")
        if ($m.Success) {
          $owner = $m.Groups[2].Value
          if (-not $owner) { $owner = "Unassigned" }
          Add-Item $items "question" $project $section $m.Groups[1].Value $m.Groups[3].Value $captured $owner $captured $line
        }
      } elseif ($section -eq "Actions for Others") {
        $m = [regex]::Match($line, "(ACTION \d+) - (.*?) - (.*?)(?: Due (\d{4}-\d{2}-\d{2})\.| Captured| Source:|$)")
        if ($m.Success) {
          $due = $m.Groups[4].Value
          if (-not $due) { $due = $captured }
          Add-Item $items "action" $project $section $m.Groups[1].Value $m.Groups[3].Value $due $m.Groups[2].Value $captured $line
        }
      } elseif ($section -eq "Decisions") {
        $title = $clean -replace "^~~", "" -replace "~~.*$", ""
        Add-Item $items "decision" $project $section $null $title $captured $null $captured $line
      }
    }
  }

  return $items
}

function Read-DayPlans {
  $plans = [System.Collections.Generic.List[object]]::new()
  $rawRoot = Join-Path $WorkspaceRoot "Raw_Notes"
  if (-not (Test-Path $rawRoot)) { return $plans }

  $files = Get-ChildItem -Path $rawRoot -Filter "*.md" -File -Recurse |
    Where-Object { $_.BaseName -match "^\d{4}-\d{2}-\d{2}$" } |
    Sort-Object BaseName

  foreach ($file in $files) {
    $date = $file.BaseName
    $lines = Get-Content -LiteralPath $file.FullName
    $sections = @{}
    $meetings = [System.Collections.Generic.List[object]]::new()
    $currentSection = $null
    $inMeetings = $false
    $meeting = $null

    function Add-MeetingSnapshot {
      param($meetings, $meeting)
      if ($meeting) {
        $meetings.Add([pscustomobject]@{
          title = $meeting.title
          time = $meeting.time
          project = $meeting.project
          recommendation = $meeting.recommendation
          bullets = @($meeting.bullets)
        }) | Out-Null
      }
    }

    foreach ($line in $lines) {
      if ($line -match "^# Meeting Notes") {
        $inMeetings = $true
        $currentSection = $null
        continue
      }

      if (-not $inMeetings -and $line -match "^##\s+(.+)$") {
        $currentSection = $matches[1]
        if (-not $sections.ContainsKey($currentSection)) { $sections[$currentSection] = [System.Collections.Generic.List[string]]::new() }
        continue
      }

      if ($inMeetings -and $line -match "^##\s+(.+)$") {
        Add-MeetingSnapshot $meetings $meeting
        $title = $matches[1].Trim()
        $projectMatch = [regex]::Match($title, "\(@([^)]+)\)")
        $timeMatch = [regex]::Match($title, " - ([0-9]{1,2}:[0-9]{2}[ap]m)")
        $meeting = [pscustomobject]@{
          title = $title
          time = $(if ($timeMatch.Success) { $timeMatch.Groups[1].Value } else { "" })
          project = $(if ($projectMatch.Success) { $projectMatch.Groups[1].Value } else { "" })
          recommendation = ""
          bullets = [System.Collections.Generic.List[string]]::new()
        }
        continue
      }

      if (-not $inMeetings -and $currentSection -and $line.Trim()) {
        $sections[$currentSection].Add($line.Trim()) | Out-Null
      }

      if ($inMeetings -and $meeting -and $line.Trim()) {
        $trimmed = $line.Trim()
        if ($trimmed -match "Recommendation:\s*(.+)$") {
          $meeting.recommendation = $matches[1]
        }
        if ($trimmed -match "^- ") {
          $meeting.bullets.Add(($trimmed -replace "^- ", "")) | Out-Null
        }
      }
    }
    Add-MeetingSnapshot $meetings $meeting

    $sectionObjects = @{}
    foreach ($key in $sections.Keys) {
      $sectionObjects[$key] = @($sections[$key] | Select-Object -First 8)
    }

    $plans.Add([pscustomobject]@{
      date = $date
      path = $file.FullName
      sections = $sectionObjects
      meetings = @($meetings)
    }) | Out-Null
  }

  return $plans
}

function Read-RecentNotes {
  $notes = [System.Collections.Generic.List[object]]::new()
  $files = Get-ChildItem -Path $WorkspaceRoot -Filter "*_notes.md" -File

  foreach ($file in $files) {
    $project = Get-ProjectName $file.Name
    $lines = Get-Content -LiteralPath $file.FullName
    $date = ""
    $topic = ""
    $buffer = [System.Collections.Generic.List[string]]::new()

    function Flush-Note {
      param($project, $date, $topic, $buffer, $notes)
      if ($date -and $topic -and $buffer.Count -gt 0) {
        $notes.Add([pscustomobject]@{
          project = $project
          date = $date
          topic = $topic
          bullets = @($buffer | Where-Object { $_ -match "^- " } | Select-Object -First 4)
        }) | Out-Null
      }
      $buffer.Clear()
    }

    foreach ($line in $lines) {
      if ($line -match "^###\s+(\d{4}-\d{2}-\d{2})") {
        Flush-Note $project $date $topic $buffer $notes
        $date = $matches[1]
        $topic = ""
      } elseif ($line -match "^####\s+(.+)$") {
        Flush-Note $project $date $topic $buffer $notes
        $topic = $matches[1].Trim()
      } elseif ($topic -and $line.Trim()) {
        $buffer.Add($line.Trim()) | Out-Null
      }
    }
    Flush-Note $project $date $topic $buffer $notes
  }

  return @($notes | Sort-Object date -Descending | Select-Object -First 36)
}

function Read-PeopleProfiles {
  $profilesFile = Join-Path $WorkspaceRoot "profiles.md"
  $people = [System.Collections.Generic.List[object]]::new()
  if (-not (Test-Path $profilesFile)) { return $people }

  $lines = Get-Content -LiteralPath $profilesFile
  $person = $null
  foreach ($line in $lines) {
    if ($line -match "^###\s+(.+)$") {
      if ($person) { $people.Add($person) | Out-Null }
      $person = [ordered]@{
        name = $matches[1].Trim()
        role = ""
        personal = ""
        lastInteraction = ""
        style = ""
      }
    } elseif ($person) {
      if ($line -match "^- Role/function:\s*(.+)$") { $person.role = $matches[1].Trim() }
      elseif ($line -match "^- Personal information:\s*(.+)$") { $person.personal = $matches[1].Trim() }
      elseif ($line -match "^- Last known interaction:\s*(.+)$") { $person.lastInteraction = $matches[1].Trim() }
      elseif ($line -match "^- Interaction description:\s*(.+)$") { $person.style = $matches[1].Trim() }
    }
  }
  if ($person) { $people.Add($person) | Out-Null }
  return @($people | Select-Object -First 80)
}

$items = Read-TodoFiles
Write-Host "Read $($items.Count) tracker items"
$plans = Read-DayPlans
Write-Host "Read $($plans.Count) day plans"
$itemsArray = @($items)
$plansArray = @($plans)
$latestPlan = $plansArray | Sort-Object date -Descending | Select-Object -First 1
$recentNotes = @(Read-RecentNotes)
$people = @(Read-PeopleProfiles)
$data = [pscustomobject]@{
  generatedAt = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
  today = (Get-Date).ToString("yyyy-MM-dd")
  workspaceRoot = $WorkspaceRoot
  role = "Director, Engineering for Digital Diagnostics at Midmark"
  principles = @("Protect attention", "Surface decisions", "Track launch risk", "Keep people context close", "Make the next action obvious")
  items = $itemsArray
  dayPlans = @($plansArray | Sort-Object date -Descending | Select-Object -First 18)
  latestPlan = $latestPlan
  recentNotes = $recentNotes
  people = $people
}
Write-Host "Prepared snapshot object"

$json = $data | ConvertTo-Json -Depth 12
Write-Host "Converted snapshot to JSON"
"window.PLANNER_DATA = $json;" | Set-Content -LiteralPath $OutFile -Encoding UTF8
Write-Host "Wrote $OutFile"
