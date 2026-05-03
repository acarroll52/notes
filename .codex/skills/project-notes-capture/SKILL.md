---
name: project-notes-capture
description: Capture and organize project notes in workspace markdown files keyed by `@[project name]`. Use when the user is adding or pasting notes, wants notes grouped by domain then date, wants same-day Outlook email/calendar or Teams context added in italics with a source, or needs `TODO_YYYY-MM-DD`, `MS_YYYY-MM-DD`, or `OQ_Name` items tracked in a per-project TODO file.
---

# Project Notes Capture

Capture project notes into workspace markdown files and keep project TODOs synchronized. Treat this skill as the default workflow whenever the user is actively taking notes.

## Shared Profile

Read [Andrew Carroll profile](../../profile/andrew-carroll-profile.md) first when the task depends on Andrew's preferences, tone, people, priorities, company context, or escalation rules.

## Contract with day planning

Treat `project-notes-capture` and `day-planning` as a paired system with different responsibilities:

- `day-planning` owns `# Day Plan` content, short-horizon prioritization, and creation of daily files in `Raw_Notes\`
- `project-notes-capture` owns ingestion of `# Meeting Notes`, project-memory organization, and synchronization of project TODO files

Treat `[project]_notes.md` and `[project]_todos.md` as the system of record for:

- project history
- open TODOs
- recurring TODOs
- milestones
- open questions
- decisions
- actions for other people

## ID rules

Assign a stable 4-digit numeric ID to every tracked entry that the user may need to reference by number:

- open TODOs
- recurring TODOs
- milestones
- actions for others
- closed TODOs and closed actions when those items were originally actionable

Do not assign IDs to open questions or decisions unless the user explicitly asks later.

Use a workspace-global ID sequence, not a per-project sequence. Scan existing `*_todos.md` files and continue from the highest existing numeric ID.

Formatting rules:

- standard TODOs and recurring TODOs should use `TODO 0005`
- milestones should use `MS 0006`
- actions for others should use `ACTION 0012`
- keep the ID with the item forever, including after it moves to `## Closed TODOs`
- never reuse an old ID

Do not ingest or preserve `# Day Plan` task triage as project notes unless the user explicitly asks for that. The normal contract is that only `# Meeting Notes` moves from the daily raw file into project memory.

Use the same alias normalization, tag interpretations, and close/answered-item handling as `day-planning` so items can move cleanly between the two workflows.

## Resolve the project

Require an explicit `@[project name]` marker when the user starts note capture.

If the marker is missing but the intended project is obvious from the current request, infer it once and continue. If the project is still ambiguous, ask one short question before writing anything.

If an explicit project marker appears to conflict with a very strong project cue in the meeting title or note content, prefer the clearly intended project instead of preserving an obvious miscoding.

Known routing hint:

- FEI / wireless-connectivity / connectivity tech-feasibility notes belong to `Cor_2.0` unless the user says otherwise.
- Digital Auscultatory BP Feasibility Study notes belong to `Cor_2.0` unless the user says otherwise.
- Riva-related technical-feasibility notes belong to `Cor_2.0` unless the user says otherwise.

Create or update these files in the current workspace:

- `[project name]_notes.md`
- `[project name]_todos.md`

When a project notes file exists, also treat its `## Raw Notes Capture Status` section as part of the system of record for raw-notes ingestion state.
Read both:

- the `Captured through Raw_Notes` marker
- the `### Capture Ledger` entries

Preserve the user-facing project name in headings and file names. Only sanitize characters that are illegal in Windows file names: `<`, `>`, `:`, `"`, `/`, `\`, `|`, `?`, `*`. Replace illegal characters with `-`.

Read [format examples](references/format-examples.md) before creating a new project file or when the existing file layout seems inconsistent.
Read [name aliases](references/name-aliases.md) whenever a person name, shorthand, attendee list, or open-question owner needs to be resolved.

## Raw notes ingestion

If the user says `parse today's notes`, `process today's notes`, or equivalent wording, treat that as a special ingestion workflow:

1. Read the markdown file in `Raw_Notes` named after today's date in ISO format: `Raw_Notes\YYYY-MM-DD.md`.
2. Ignore everything under the top `# Day Plan - YYYY-MM-DD` heading.
3. Parse only the content under the `# Meeting Notes` heading.
4. Treat each `## ...` subheading under `# Meeting Notes` as a separate meeting cluster.
5. Each meeting subheading is expected to include an explicit `@[project name]` marker. Route that meeting's notes to that project's files using the normal capture rules.
6. Use the meeting title text, with the `@[project name]` marker removed, as the cluster heading or a light-cleanup version of it.
7. Do not merge separate meeting sections together just because they came from the same raw-notes file.
8. Determine domain, same-day context, TODOs, milestones, and open questions separately for each meeting section.
9. For each meeting section, explicitly attempt same-day enrichment using the meeting title, attendees, and project as search anchors across Outlook and Teams before deciding that no context should be added.

If the explicit `@[project name]` marker in a raw-notes meeting heading is clearly wrong based on strong known routing cues, correct it before ingesting.

This raw-notes ingestion path is the intended handoff from `day-planning`: the daily file may include both `# Day Plan` and `# Meeting Notes`, but only `# Meeting Notes` should be promoted into project memory by default.

If a meeting subheading under `# Meeting Notes` is missing a project marker and the project is not obvious from the meeting content, ask one short clarifying question before writing anything for that meeting.

If the user instead asks to process yesterday's notes, the previous business day's notes, or the latest pending raw notes overnight, use the same workflow against the specified `Raw_Notes\YYYY-MM-DD.md` file rather than today's date.

For overnight automation or next-morning cleanup:

1. Prefer the immediately preceding weekday's raw-notes file.
2. If that file does not exist, stop without guessing a different date.
3. Before writing anything, check whether that raw-notes file appears to have already been captured into the target project notes.
4. First read each target project's `## Raw Notes Capture Status` section when present.
5. Treat a meeting section as already captured when either:
   - the target project's `Captured through Raw_Notes` marker is on or after that raw-notes date and the `### Capture Ledger` shows that date or a matching meeting heading, or
   - the target project's notes already contain the same raw-notes date and a matching or near-matching cluster heading for that meeting.
6. If every meeting section in the raw-notes file appears already captured, stop without making changes and tell the user the file was likely already processed.
7. If only some meeting sections appear already captured, skip those sections and ingest only the remaining ones.
8. Use the same rule set for any uncaptured sections: ignore `# Day Plan`, process only `# Meeting Notes`, and route each meeting separately by `@[project name]`.

## Maintain the notes file

Keep notes grouped as `domain -> date -> note cluster`.

Treat domains primarily as a retrieval aid for future queries, not as a rigid human-authored filing system.
Optimize domain organization for fast, accurate recall first. Human readability and manual browsing matter, but they are secondary to retrieval quality.

Treat each user-provided grouped note block as a cluster. Examples of cluster signals:

- a pasted heading followed by bullets
- a screenshot or pasted outline with one heading and many child bullets
- a user saying "these notes are from the same meeting" or similar

Preserve those clusters. If bullets were originally grouped together, keep them together under one cluster heading even when the bullets touch multiple subjects.

Infer domain names from the full cluster, not from each individual bullet. Use concise practical domains such as:

- `electrical`
- `manufacturing`
- `regulatory`
- `firmware`
- `mechanical`
- `business`
- `misc`

Do not force a fixed taxonomy. Re-evaluate domains every time new notes are added.

You have full permission to reorganize older notes across domains whenever doing so will improve future retrieval, query accuracy, and cross-note consistency.

If a better domain model becomes clear later, you may:

- move an entire cluster to a different domain
- merge thin or redundant domains
- rename domains for clarity
- create a new domain when that makes retrieval cleaner

Do not split one cluster across multiple domains unless the user explicitly asks for that.

Append new notes under the matching domain and the current date in ISO format `YYYY-MM-DD`. Reuse an existing date section for the same day instead of creating duplicates.

Within the date section, keep a cluster subheading that stays close to the user's wording. When the user supplies a heading like `Isolation Tester for Zone`, keep that wording or a very light cleanup of it.

For bulk imports from exported notes, PDFs, screenshots, or copied notebook pages:

- prefer an explicit in-note date such as `3/31/26` or `March 31, 2026` over the file export timestamp
- fall back to the page timestamp only when the note content does not provide a clearer date
- if the source is genuinely undated, keep the cluster and mark the date as best-effort rather than inventing one
- if an exported page preserves only a title or partial text, keep that fact in the notes instead of pretending the missing content was available
- preserve the imported note content at high fidelity; do not summarize or condense the user's notes just to make them shorter
- preserve the original bullet hierarchy whenever it can be inferred from the source
- keep parent bullets, child bullets, numbered substeps, and question/answer indentation structure instead of flattening everything into a single list
- only flatten indentation when the source extraction truly does not preserve enough structure to recover it reliably, and note that uncertainty when needed
- if a page contains interview notes, candidate feedback, question prompts, or evaluation details, preserve those details rather than collapsing them into a short recap
- if OCR or extraction is imperfect, keep the ambiguous wording or note the uncertainty instead of replacing it with a broad summary
- for PDF imports, do not stop at text extraction if the PDF contains embedded or rendered visuals that carry meaning
- for image-bearing PDF pages, render the page or extract the relevant embedded images into the workspace and link them from the matching note cluster using markdown image syntax with absolute filesystem paths
- ignore tiny decorative icons, but preserve diagrams, screenshots, plots, schematics, schedules, and other substantive visuals

Preserve the substance of the user's raw notes. You may:

- fix spelling
- expand fragments into complete sentences
- clarify shorthand

Only do that when you are confident in the intended meaning. If confidence is low, keep the original wording.

Do not delete uncertainty, caveats, or open questions from the user's notes.
Do not rewrite detailed notes into executive-summary form unless the user explicitly asks for a summary.

## Add same-day context carefully

After capturing the user's notes, check same-day Outlook emails, Outlook calendar events, and Teams messages for clearly associated context.

Also check directly linked SharePoint files when the same-day meeting, email, or Teams thread clearly points to a document that would improve fidelity, such as an agenda, deck, report-out, study packet, or decision memo.

Use a two-pass enrichment workflow instead of stopping at the first matching message:

1. Find strong same-day anchors such as a matching meeting, email, or Teams search hit.
2. If a Teams hit belongs to a chat or channel thread that is clearly related, inspect that chat or thread for adjacent messages from the same discussion before deciding what to add.

Treat enrichment as useful but non-urgent. Favor reliability over exhaustiveness when connector throttling is a risk.

Use a throttle-aware enrichment sequence:

1. Start with the lightest, highest-signal anchor available, usually the meeting title, attendee list, or one distinctive phrase.
2. Query one source at a time instead of blasting Outlook calendar, Outlook email, and Teams in parallel.
3. Prefer reusing a strong email or meeting anchor before doing broader Teams searching.
4. Only search Teams after Outlook results suggest that more context is likely to exist and would add value.
5. Stop once you have enough non-redundant context to strengthen the notes; do not keep searching just because more sources exist.

If Microsoft returns a throttling or `429 Too Many Requests` response:

1. Do not keep hammering the same connector with repeated retries.
2. Fall back to whatever strong context you already captured from other sources.
3. Skip weaker enrichment rather than delaying the note update.
4. Briefly note in the final user-facing response that enrichment was partial because Outlook or Teams throttled.

When throttling risk is high, prefer this source order:

1. Outlook email threads tied to the meeting or topic
2. Outlook calendar event details
3. SharePoint direct document fetch from a known link
4. Teams search
5. Teams chat or thread fetches

Avoid parallel connector bursts during `process today's notes`. Work through the meeting sections steadily, reusing anchors and minimizing duplicate searches.

Only add context when the same-day association is strong. Examples:

- the same project name appears
- the same topic, part, issue, or meeting is clearly referenced
- the same people or meeting from the day obviously match the note

When a matched event or email gives you participant names, meeting titles, or specific request language, use those as follow-up search terms for Teams. Do not rely on one broad Teams search term alone.

Before searching Outlook or Teams by person name, normalize known shorthand names through the alias map. Use the canonical name in the search when it improves match quality.

When a matched Teams result exposes a `chat_id`, `channel_id`, or thread path, prefer fetching that conversation context. This helps catch follow-up messages that may not rank highly in search but are still part of the same discussion.

If the match is weak or speculative, skip enrichment.

Write every added context line in italics and include the source inline. Use source wording like:

- `*Context added from Outlook email: "Subject" from Sender at 10:14 AM on 2026-03-31.*`
- `*Context added from Outlook meeting: "Meeting title" at 2:00 PM on 2026-03-31.*`
- `*Context added from Teams message in Chat/Channel name at 3:27 PM on 2026-03-31.*`

Add context near the relevant cluster, not in a detached summary block.

## Track TODOs, milestones, and open questions separately

Detect TODO tags in the form `TODO_YYYY-MM-DD`.
Also accept TODO tags in the shorthand form `TODO_MM-DD`.
Also accept bracketed TODO tags such as `[TODO 4/15]`, `[TODO_04-15]`, or `[TODO 2026-04-15]`.
Detect milestone tags in the form `MS_YYYY-MM-DD`.
Also accept milestone tags in the shorthand form `MS_MM-DD`.
Also accept bracketed milestone tags such as `[MS 9/17]`, `[MS_09-17]`, or `[MS 2026-09-17]`.
Detect open-question tags in the form `OQ_Name`.
Detect decision tags in the form `[DEC]`.
Detect delegated-action tags in the form `[Action - Name - Date]` or `[Action - Name]`.
Detect recurring-TODO tags in the form `[RTODO ...]`.

When a TODO or milestone tag omits the year and only provides month/day, assume the next upcoming occurrence of that month/day relative to the current local date, then normalize it to `YYYY-MM-DD` before writing anything to notes or TODO files.

For bracketed TODO and milestone tags:

- the surrounding square brackets must be present
- the prefix must be exact uppercase `TODO` or `MS`
- separators inside the brackets may vary
- accept spaces, underscores, slashes, or hyphens between the prefix and date
- accept date forms such as `M/D`, `MM/DD`, `M-D`, `MM-DD`, `YYYY-MM-DD`, or `YYYY/M/D`
- normalize all accepted forms to the standard internal forms `TODO_YYYY-MM-DD` and `MS_YYYY-MM-DD` before writing anything

For recurring-TODO tags:

- the surrounding square brackets must be present
- the prefix must be exact uppercase `RTODO`
- separators after `RTODO` may vary
- accept spaces, underscores, or hyphens between the prefix and the recurrence wording
- treat slightly off human-entered recurrence text as acceptable when the intent is clear
- correct the tag automatically when the intended cadence is clear; ask only when the cadence or anchor date is genuinely ambiguous

Supported recurring patterns:

- `[RTODO weekly 4/15]`
- `[RTODO biweekly 4/18]`
- `[RTODO monthly 5/1]`
- `[RTODO quarterly 7/1]`
- `[RTODO end monthly]`
- `[RTODO first monthly]`
- `[RTODO begin monthly]`

Normalization rules:

- for weekly, biweekly, monthly, and quarterly recurring TODOs with an explicit month/day or full date, normalize the anchor to `YYYY-MM-DD` using the same next-upcoming rule as TODO and milestone tags when the year is omitted
- treat `begin monthly`, `first monthly`, and `start monthly` as the same cadence, meaning the first day of each month
- treat `end monthly` and `last monthly` as the same cadence, meaning the last day of each month
- preserve the user's original bracketed tag text in notes when embedded inside broader notes
- mirror the recurring TODO into the project TODO file under a dedicated `## Recurring TODOs` section

For decision tags:

- accept `[DEC]` as the decision marker
- treat the text that follows `[DEC]` as the decision statement
- keep the original `[DEC]` text in the notes when it is embedded in broader notes
- mirror the decision into the project TODO file under a dedicated `## Decisions` section

For delegated-action tags:

- the surrounding square brackets must be present
- the prefix must be exact `Action`
- the general shape is `[Action - Name - Date]` or `[Action - Name]`
- treat `Name` as the person who owns the action, not the person entering the note
- the date is optional
- if a date is present, accept forms such as `M/D`, `MM/DD`, `M-D`, `MM-DD`, `YYYY-MM-DD`, or `YYYY/M/D`
- if a delegated-action date omits the year and only provides month/day, normalize it to the next upcoming `YYYY-MM-DD` using the same rule as TODO and milestone tags
- keep the original `[Action - ...]` text in the notes when it is embedded in broader notes
- mirror the delegated action into the project TODO file under a dedicated `## Actions for Others` section

Examples:

- On 2026-04-02, `TODO_04-15` becomes `TODO_2026-04-15`.
- On 2026-04-02, `TODO_03-15` becomes `TODO_2027-03-15`.
- On 2026-04-02, `MS_09-17` becomes `MS_2026-09-17`.
- On 2026-04-02, `[TODO 4/15]` becomes `TODO_2026-04-15`.
- On 2026-04-02, `[MS 9/17]` becomes `MS_2026-09-17`.
- On 2026-04-06, `[Action - Nick - 4/10]` becomes an action-for-others entry for `Nick Ross` due `2026-04-10`.
- On 2026-04-13, `[RTODO weekly 4/15]` becomes a weekly recurring TODO anchored on `2026-04-15`.
- On 2026-04-13, `[RTODO end monthly]` becomes a monthly recurring TODO due on the last day of each month, with the next due date set to the next month-end on or after `2026-04-13`.

If a tagged item is embedded inside a larger set of project notes, keep the original tagged text in the notes file where it was captured and also mirror it into `[project name]_todos.md`.

If the user's prompt is only a standalone milestone or open-question entry, such as just `MS_YYYY-MM-DD ...` or just `OQ_Name ...`, do not create or append a notes cluster for that prompt. In that case, update only `[project name]_todos.md`.

If the user's prompt is only a standalone delegated-action entry such as just `[Action - Nick - 2026-04-10] Follow up with validation on the fixture issue.`, update only `[project name]_todos.md` unless the user explicitly says to keep it in the notes too.

If the user's prompt is only a standalone recurring-TODO entry such as just `[RTODO weekly 4/15] Send staff update.`, update only `[project name]_todos.md` unless the user explicitly says to keep it in the notes too.

Treat `TODO_YYYY-MM-DD` as normal note content unless the user later asks for a different standalone-only behavior for TODOs.

When a tracked item was surfaced earlier by `day-planning` and the user later says it was completed, resolved, or answered, use the project TODO file as the authoritative item list and update that file without requiring the user to repeat the exact stored wording when the intended match is clear.

Use this TODO file structure:

- `## Open TODOs`
- `## Recurring TODOs`
- `## Milestones`
- `## Open Questions`
- `## Decisions`
- `## Actions for Others`
- `## Closed TODOs`

Store open TODOs and milestones in date order when practical. Keep closed TODOs at the bottom of the file under `## Closed TODOs`.

For each TODO entry, keep:

- the stable ID
- due date from the tag
- task text
- capture date
- a pointer to the notes date/domain when practical

For each recurring-TODO entry, keep:

- the stable ID
- cadence
- the normalized anchor rule or anchor date
- the current next-due date
- the task text
- capture date
- last-completed date when one exists
- a pointer to the notes date/domain when practical

For each milestone entry, keep:

- the stable ID
- milestone date from the tag
- milestone text
- capture date
- a pointer to the notes date/domain when practical

When the user references a milestone by ID such as `MS 0006`, search all project TODO files for that exact milestone ID first and prefer that over text matching.

When the user says a milestone is complete or closed:

1. If the user gives an ID such as `MS 0006`, search all project TODO files for that exact milestone ID first.
2. If no ID is supplied, match by milestone text and project context when clear.
3. Preserve the original milestone text and ID.
4. Mark the milestone checkbox complete with `[x]`.
5. Keep the milestone in `## Milestones` rather than moving it to `## Closed TODOs`.
6. Add `Completed YYYY-MM-DD` using the current local date unless another completion date is clearly provided.
7. If multiple milestones could match, ask one short clarifying question instead of guessing.

For each open-question entry, keep:

- the person name from the tag
- the open-question text
- capture date
- status as open unless the user later closes it
- a pointer to the notes date/domain when practical

For each decision entry, keep:

- the decision text
- capture date
- a pointer to the notes date/domain when practical

For each delegated-action entry, keep:

- the stable ID
- the owner name
- the action text
- the optional due date when present
- capture date
- status as open unless the user later closes it
- a pointer to the notes date/domain when practical

When a user supplies `OQ_Name`, treat the provided name as a candidate display name, not automatically as the canonical name.

Before adding or updating an open-question entry:

1. Read the existing `## Open Questions` section if it exists.
2. Normalize the provided `Name` through the alias map when possible.
3. Compare the normalized name with any already-tracked names.
4. If the new tag is not an exact or alias-normalized match but looks like an abbreviation, partial name, or otherwise plausible reference to an existing person, ask one short clarifying question before changing the file.
5. This includes cases like `OQ_Jeff` or `OQ_Jeff B` when an existing entry already uses a fuller name such as `Jeff Bargemann`.
6. Only proceed without asking when the name is either an exact existing match, a clear alias-map match, or clearly a new distinct person.

When processing new notes, always check whether any existing open question has now been answered or materially resolved in the new note content.

Treat an open question as answered when the new notes clearly provide a direct response, decision, disposition, or concrete factual answer tied to that question.

When an open question has been answered:

1. Keep the note content that contains the answer.
2. Find the matching open-question entry in `[project name]_todos.md`.
3. Remove it from `## Open Questions`.
4. Move it to `## Closed TODOs` with markdown strikethrough, a close date, and a short `Answered ...` note when the answer can be summarized safely.
5. Preserve the original question text rather than rewriting it.

When the user says a specific TODO is closed:

1. If the user gives an ID such as `close TODO 0005`, `close ACTION 0012`, or `close 0005`, search all project TODO files for that ID first.
2. If an ID was supplied and exactly one matching actionable item is found, use that match without asking the user to restate the item text.
3. Otherwise, find the matching open TODO in `[project name]_todos.md`.
4. Preserve the full original TODO text and ID.
5. Apply markdown strikethrough to the entire TODO entry.
6. Move the struck-through entry to the end of `## Closed TODOs`.
7. Add the close date if it is known from context; otherwise use the current date.

Never delete closed TODOs.

If multiple TODOs could match the closure request, ask a short clarifying question instead of guessing.

If the user later asks to close an open question, preserve the original open-question entry and mark it closed in a way that matches the existing TODO file style. Keep closed items rather than deleting them.

If the user later says an action-for-others item is complete, find the matching entry in `## Actions for Others`, preserve the original wording, strike it through, and move it to `## Closed TODOs` with the close date when the intended match is clear.

If the user supplies an action ID, prefer that over text matching.

If the user later says a recurring TODO is complete:

1. If the user gives an ID, find that exact recurring TODO by ID first.
2. Otherwise find the matching open entry in `## Recurring TODOs`.
3. Preserve the original task wording, cadence, and ID.
4. Update `Last completed` to the current date unless another close date is clearly provided.
5. Recalculate `Next due` from the stored cadence.
6. Keep the recurring TODO in `## Recurring TODOs` rather than moving it to `## Closed TODOs`.

## Editing workflow

When the user pastes multiple notes at once:

1. Parse them into domains.
2. Append them to the correct date sections.
3. Add any high-confidence same-day context.
4. Update the TODO file for any new or closed TODOs, milestones, and open questions.

When the user asks to parse or process today's raw notes:

1. Open `Raw_Notes\YYYY-MM-DD.md` for the current date.
2. Ignore the `Day Plan` section entirely.
3. Parse only `Meeting Notes`.
4. Split the file by `##` meeting subheadings.
5. For each meeting section, resolve the `@[project name]` marker from that meeting heading and process that meeting independently.
6. Before writing each meeting section, read the target project's `## Raw Notes Capture Status` section when present and compare it with the raw-notes date and meeting heading.
7. If the target project's marker or ledger indicates the raw-notes date has already been captured for that meeting, tell the user that the notes appear already captured and ask one short question whether to re-process anyway.
8. If the user does not want re-processing, stop without making changes for that already-captured scope.
9. If a meeting section is not already captured, update each affected project's notes and TODO files separately for only the uncaptured meeting sections.
10. While processing each uncaptured meeting, check whether the meeting notes answer any already-open question for that project and close those questions automatically when the answer is clear.
11. For each uncaptured meeting section, do a deliberate same-day enrichment pass:
   - search Outlook calendar for the meeting title or close variants
   - use attendee names and distinctive phrases from the notes to search Teams
   - when a promising Teams hit is found, inspect the related chat or thread for adjacent messages
   - add only non-redundant, high-confidence context that materially helps the note
   - if the notes already include the core meeting facts, prefer adding only extra context such as clarified requests, decisions, owners, dates, or linked side discussions rather than repeating the invite

When using duplicate detection for raw-notes ingestion:

- use the `## Raw Notes Capture Status` marker and `### Capture Ledger` as the primary identity check when available
- otherwise use project plus raw-notes date plus normalized meeting heading as the primary identity check
- accept light heading cleanup differences such as removed time stamps, removed `@[project]` markers, or minor punctuation changes
- if the match is ambiguous, prefer asking one short question over writing a likely duplicate
- if all sections are skipped as already captured, say so plainly in the final response

After a successful raw-notes capture into a project file:

1. Update that project's `Captured through Raw_Notes` marker to at least the raw-notes date just processed.
2. Add or extend a `### Capture Ledger` entry for that raw-notes date with the captured meeting headings.
3. Preserve existing ledger history; append rather than rewrite unless cleanup is needed for clarity.

When the user sends only a standalone `MS_YYYY-MM-DD ...` or `OQ_Name ...` line:

1. Resolve the project.
2. Update only the TODO file.
3. Do not add a new notes section just for that standalone item.
4. Still run the open-question ambiguity check before editing when applicable.

When the project files do not exist, create them using the examples in [format examples](references/format-examples.md).

When the files already exist, preserve the existing content and extend it without rewriting older sections unless the user asks for cleanup.

You may re-arrange older note clusters when needed to improve retrieval quality, but preserve:

- the original cluster grouping
- the original note substance
- any `TODO_YYYY-MM-DD`, `MS_YYYY-MM-DD`, or `OQ_Name` tags

## Output expectations

After updating files, briefly tell the user:

- which project file was updated
- whether a new file was created
- whether TODOs were added or closed
- whether same-day Outlook or Teams context was added
