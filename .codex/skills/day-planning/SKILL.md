---
name: day-planning
description: Organize a workday using Outlook calendar/email, Microsoft Teams signals, project notes/TODOs, and `profiles.md` relationship context, with concise meeting triage, attendee/topic-aware pre-meeting briefs, follow-up identification, suggested new TODOs, open-task prioritization, and short reply drafts. Use when the user asks to plan today, triage a calendar, prepare for meetings, review unread or flagged email, scan Teams for follow-ups, identify what needs attention next, draft quick responses, or capture action items after a meeting.
---

# Day Planning

Turn calendar, email, chat, notes, and open requests into the smallest useful action plan. Optimize for a senior R&D leader with limited attention, broad oversight, and too many meetings.

## Shared Profile

Read [Andrew Carroll profile](../../profile/andrew-carroll-profile.md) first when the task depends on Andrew's preferences, tone, people, priorities, company context, or escalation rules.

## Contract with project notes

Treat `day-planning` and `project-notes-capture` as a paired system with different responsibilities:

- `day-planning` owns short-horizon prioritization, triage, and creation of the daily raw-notes file in `Raw_Notes\`
- `project-notes-capture` owns long-horizon project memory in `[project]_notes.md` and `[project]_todos.md`

Treat the project markdown files as the system of record for:

- open TODOs
- recurring TODOs
- milestones
- open questions
- decisions
- actions for other people
- saved project history and meeting outcomes

Treat the `# Day Plan` portion of `Raw_Notes\YYYY-MM-DD.md` as planning-only working material, not archival project memory.

Treat TODO, recurring TODO, milestone, open-question, and action lists already written into `Raw_Notes\` day-plan files as stale snapshots. Never use those snapshots to determine current due dates or open/closed status. If a `Raw_Notes\` snapshot conflicts with a project `*_todos.md` file, the project `*_todos.md` file wins.

When `day-planning` needs commitments, milestones, decisions, or unresolved questions, read them from the project markdown files instead of reconstructing them from email or chat.

Use the same alias normalization, tag interpretations, and closure semantics as `project-notes-capture`.

When the user reports that a tracked item is complete during a day-planning workflow, update the matching project TODO file directly when the project and item match are clear. If the match is ambiguous, ask one short question.

When TODOs, recurring TODOs, milestones, open questions, or actions are surfaced from project TODO files, include their stable ID in the output so the user can later reference the item by ID.

When referencing a TODO in the day-plan summary, format it as `[TODO 0001] Description` and include due timing inline, for example `due today`, `due Friday`, or `overdue from Tuesday`.

When referencing an action-for-others item in the day-plan summary, format it as `[ACTION 0001] Description` and include due timing inline, for example `due today`, `due Friday`, or `overdue from Monday`.

When referencing a milestone in the day-plan summary, format it as `[MS 0001] Description` and include milestone timing inline, for example `due today`, `in 8 days`, or `overdue from Tuesday`.

When referencing an open question in the day-plan summary, format it as `[OQ 0001] Owner or Unassigned - Question`.

Apply that timing and ID rule to all tracked TODO, milestone, open-question, and action references in the `# Day Plan` summary, not just the `Upcoming milestones`, `This week's due TODOs`, `Open questions`, or `Upcoming/past due actions` subsections.

Do not rewrite or reorganize historical project notes while doing day planning unless the user explicitly asks for note capture or note cleanup.

## Gather only decision-useful context

Start with the next few hours, not the whole day.

Prefer these sources when connected and available:

- Outlook calendar for today's meetings and prep needs
- Outlook email for unread, flagged, and aging asks
- Teams chats and messages for unresolved follow-ups and unblock requests
- SharePoint files linked from invites, email, or chats when they are likely to contain agendas, pre-reads, decision decks, study materials, or other meeting inputs
- workspace notes and TODO files when they add context for meetings, 1:1s, or follow-ups
- `profiles.md` as the primary relationship-memory source for attendee context, personal reminders, contact details, interaction style, and 1:1 personal background/questions

For workspace context, prefer targeted reads such as:

- `*_todos.md`
- `*_notes.md`
- `profiles.md`
- files clearly tied to today's meetings or requests

Read [name aliases](references/name-aliases.md) when a meeting attendee, 1:1 target, or note reference uses shorthand or a partial person name.

Stop gathering once there is enough information to rank the next actions. Do not produce mailbox, chat, or calendar summaries for their own sake.

If Outlook, Teams, or another source is not connected or not exposed through available tools, say so plainly and continue with the sources you do have.

## Calendar completeness

Before writing a day plan, build a complete meeting inventory for the target date.

- query the full local day window from 00:00 through 23:59:59 in Andrew's timezone
- request enough Outlook calendar results for a dense executive calendar; use at least `top=100` when the connector supports it
- if the connector returns pagination metadata such as `has_more` or `next_from_index`, continue paging until the full day window is exhausted
- include accepted, tentative, no-response, and organizer-owned meetings unless they are explicitly cancelled
- do not drop a meeting because it overlaps another meeting, overlaps focus time, or looks lower priority; keep it in the meeting-notes template and mark it `optional`, `request notes`, `delegate`, or `decline`
- omit only pure non-meeting calendar noise such as focus blocks, travel holds, PTO/off-work blocks, room/resource holds, or personal placeholders unless the user asks for everything
- when the calendar is unusually dense, run a quick sanity check before finalizing: compare the meeting-notes template against the full Outlook inventory and verify every non-noise event appears exactly once
- if a meeting appears in Outlook but has too little detail to triage, still include the title, time, attendees if available, and a short `Recommendation: unclear; check invite/body`
- if the user reports a missing meeting, treat that as a planner defect: update the skill or workflow so similar meetings are included next time

For meetings that often get missed because they are theme-based rather than exact recurring titles:

- treat Cor1 software, SW timeline, firmware timeline, scrum/status/update, FW, plugin, and execution-sync titles as Cor1 firmware/software lane meetings when the attendees, organizer, body, or adjacent notes point that way
- treat TI, ECG, SpO2, auscultatory BP, Riva, feasibility, sensors, or roadmap titles as Cor2 technical/roadmap lane meetings unless the invite clearly belongs elsewhere
- include these lane meetings in the meeting-notes template even when they look narrowly technical; then recommend `attend`, `delegate`, or `request notes` based on decision value
- for similarly themed meetings, add recent lane reminders from project notes/TODOs even when the exact prior title does not match

## Build meeting context like an embedded assistant

For meaningful meetings, prepare Andrew from the meeting's topic, attendees, recent messages, and relevant project memory, not only from the exact recurring meeting history. Search by meeting title keywords, project/workstream aliases, organizer, and key attendees. Pull from Outlook email, Teams messages, recent notes, TODOs, actions assigned to others, milestones, open questions, and decisions when they plausibly connect to the meeting.

Prefer context that lets Andrew walk in ready to steer: unresolved asks, decisions likely needed, promises made by or to attendees, recent changes since the last discussion, interpersonal context from 1:1 notes, and risks that should be surfaced early. Include suggested questions, talking points, or proposed next steps when useful.

For 1:1s and relationship-heavy meetings, treat `profiles.md` as the first relationship-memory source before broader notes search. Resolve the attendee through aliases and profile headings, then use the matching entry for durable private prep: role/function, working relationship, personal context, family or life details, interests, last known interaction, and interaction style. Convert this into concise personal background and optional personal questions that would feel natural for Andrew to ask. Keep questions specific enough to be useful, but non-invasive and grounded only in captured facts. Never imply the question came from a profile or assistant memory, and do not include sensitive personal details in any external-facing draft unless Andrew explicitly asks.

Keep this concise. Do not summarize every related email or chat. Extract only what changes meeting readiness, and cite the source when you include specific external context.

Treat unread email as a likely action queue unless the user says otherwise. The user prefers a clean inbox with no unread mail.

When scanning unread mail:

- review all accessible unread items first, not just the newest few
- separate true action items from meeting noise, automated notifications, approvals, receipts, room accepts, travel confirmations, and bulk GitHub or system mail
- remind the user only about unread items that imply a decision, reply, approval, deadline, escalation, or blocked work
- collapse low-value unread items into one short cleanup note instead of listing them individually

If a mail item is unread but clearly informational or stale, say that it is likely safe to mark read or archive rather than presenting it as a must-do.

Use the Microsoft app connectors efficiently:

- prefer Outlook list/search actions for calendar windows and inbox triage before doing broader mailbox exploration
- prefer Teams search plus targeted chat or message fetches over broad message sweeps
- use Teams unread or recent-chat surfaces when they can narrow likely follow-up threads quickly
- when a meeting invite, email, or Teams message references a SharePoint file that is likely decision-relevant, fetch the document directly instead of inferring from the link text alone
- prefer SharePoint direct fetch from a known link first; use broader site or folder search only when the user clearly needs document discovery
- stop after you have enough context to improve the recommendation; do not exhaust every connector just because it is available

## Prioritize like an executive calendar gatekeeper

Protect the user's time.

Treat any meeting involving Jeff Bargemann, Rob Sackett, or Josh Shenk as top priority by default.

Among the remaining items, favor:

- executive visibility
- customer or external impact
- major decisions
- budget or staffing implications
- cross-functional alignment
- blocker, escalation, or major risk review

Question attendance for lower-leverage meetings such as:

- narrowly scoped firmware discussions
- standups
- scrum ceremonies
- sprint mechanics
- detailed execution syncs

For lower-value meetings, explicitly recommend one of:

- `delegate`
- `decline`
- `optional`
- `shorten`
- `request notes`

Upgrade a low-level meeting to `attend` only when there is a clear decision, escalation, leadership visibility, customer impact, cross-functional dependency, or blocker that needs director-level input.

## Format the output tersely

Lead with the next action.

Default to `must-do`, `should-do`, and `can-wait`.

Keep the whole response to 3 to 5 bullets maximum unless the user asks for more.

Keep each bullet to one line when possible. Prefer fragments over paragraphs.

Avoid restating background the user likely remembers. Group similar items instead of repeating the same pattern item by item.

When unread email is part of the answer, put true open actions ahead of informational unread items.

## Build daily plans

When the user asks to plan the day or triage work:

1. Surface only the highest-value actions.
2. Put imminent high-priority meeting prep ahead of passive review.
3. Call out reply obligations only when a response is clearly owed.
4. Label meetings as `attend`, `delegate`, `optional`, or `decline` when there is enough evidence.
5. Highlight deadlines, blocked work, decisions needed, and aging asks.

If information is incomplete, add one short line saying what would be helpful, then still make a best-effort recommendation.

If unread email exists, explicitly call out the few messages most likely to deserve action.

When the user asks to plan the day, also provide:

- a short summary subsection for `Suggested TODOs`
- a short summary subsection for `Control Tower`
- on Mondays, a short summary subsection for `Week ahead`
- a short summary subsection for `Upcoming milestones`
- a short summary subsection for `This week's due TODOs`
- a short summary subsection for `Open questions`
- a short summary subsection for `Upcoming/past due actions`
- a dated Markdown file for the plan
- a paste-ready meeting-notes template unless they clearly ask not to

Put those subsections in the summary portion of the answer, before the meeting-notes template.

For `Suggested TODOs`:

- infer candidate tasks from email, Teams, meetings, notes, and open loops that are not already captured in project TODO files
- include the likely project and due date when obvious
- keep it to 1 to 5 high-value suggestions
- treat these as suggestions only; do not add them to project TODO files unless the user explicitly asks or confirms
- omit the section when there are no useful new candidate tasks

For `Control Tower`:

- keep it compact and decision-oriented, not a second digest
- include only items that may change how the user spends time today
- prefer cross-project risks, fragile dependencies, stale items, recent decisions, and ownership gaps over generic status
- cap it at 3 to 5 bullets total
- omit anything already obvious from the calendar or due-TODO sections unless the connection adds value
- use project markdown files plus connected systems as inputs, but treat the project markdown files as the source of truth for tracked commitments and decisions

Good Control Tower categories include:

- top risks
- cross-project dependencies to watch
- stale open questions or aging TODOs
- decisions or changes since yesterday

Only include a category when it contains something worth acting on today.

For `Week ahead` on Mondays:

- look across the current workweek after today, not just Monday
- include only items that may require early preparation or calendar protection
- prioritize long meetings, executive-visible reviews, external/customer-facing sessions, major decisions, interviews, and deadlines or due TODOs that are not obvious from Monday alone
- call out prep needs, pre-reads, owners to align with, or materials likely needed when that is clear
- keep it compact, ideally 1 to 3 bullets total
- omit routine recurring ceremonies unless one appears unusually long, unusually visible, or decision-heavy
- if nothing stands out, say that plainly in one short line

For the dated Markdown file:

- create a new file under `Raw_Notes\YYYY\MM-Month\Week_of_YYYY-MM-DD\YYYY-MM-DD.md` using the user's local date
- choose `Week_of_YYYY-MM-DD` from the Monday that starts the target date's workweek
- save the same day-plan content you are presenting, including the short summary and meeting-notes template
- never edit or overwrite an existing file inside `Raw_Notes`
- before creating the file, check whether the exact dated file already exists for the intended planning date
- if that exact dated file already exists, treat the planning work as already done for that date, stop without creating a suffixed copy, and tell the user the existing file path
- do not create `YYYY-MM-DD-2.md` or other suffixed variants for normal day-planning or overnight automation runs
- if you need to inspect whether the dated file already exists, limit that check to file existence and path discovery; do not read or rewrite the file contents unless the user explicitly asks
- mention the file path in the answer

The intended handoff is:

- `day-planning` creates the raw daily file
- the user takes notes under `# Meeting Notes`
- `project-notes-capture` later ingests only `# Meeting Notes` and ignores `# Day Plan`

When the request is clearly for an overnight or next-day plan, create the raw-notes file for the next applicable weekday instead of today. If the next calendar day is Saturday or Sunday, roll forward to Monday.

For `Upcoming milestones`:

- scan available `*_todos.md` files for milestone entries with due dates in the next 30 calendar days
- include open overdue milestones only when they are 7 calendar days overdue or less
- do not show milestones that are more than 7 calendar days overdue unless the user explicitly asks for older overdue milestones
- do not scan `Raw_Notes\` day-plan files for milestone due dates because those entries are historical snapshots
- include only open milestone entries by default; skip `[x]` completed milestones unless the user explicitly asks for completed milestones
- prefer milestone items in `## Milestones` sections and milestone-style entries such as `MS_...`
- show the milestone ID, milestone due date, and calendar days until due, for example `[MS 0006] 2026-04-27 - 21 days until Commercial Build #1`
- include the stable ID for each surfaced milestone when present, formatted as `[MS 0006] Description`
- sort soonest due first
- when there is more than one milestone, print `Upcoming milestones:` as its own line and list each milestone as a sub-bullet on its own line
- if there are no milestone due dates within 30 days, say that plainly in one short line
- do not repeat milestone background unless needed for clarity

For `This week's due TODOs`:

- scan available `*_todos.md` files for non-milestone TODO items with due dates in the same calendar week as today
- also include any open overdue TODOs from prior dates, even if they are outside the current calendar week
- also scan `## Recurring TODOs` for entries whose `Next due` date falls in the same calendar week as today
- use the project TODO files as the authoritative source for open versus closed status
- show only the task name and due timing unless a little more context is needed
- include the stable ID for each surfaced TODO or recurring TODO when present, formatted as `[TODO 0001] Description`
- keep carrying overdue TODOs forward in every day plan until they are explicitly closed in the source TODO file
- keep this list short and high-signal
- if there are no same-week due or overdue TODOs, say that plainly in one short line

For `Open questions`:

- scan available `*_todos.md` files for open entries under `## Open Questions`
- always include this top-level section in every full day plan, even when no open questions exist
- include each stable open-question ID when present, formatted as `[OQ 0007]`
- show the project, owner or `Unassigned`, question text, and captured date/source when present
- prioritize questions tied to today's meeting attendees, aging questions, and questions blocking decisions
- include all open questions when the list is short; when the list is long, show the highest-signal items and note how many additional open questions exist
- if there are no open questions, say that plainly in one short line

For `Upcoming/past due actions`:

- scan available `*_todos.md` files for open entries under `## Actions for Others`
- include overdue actions plus actions due today or later in the current calendar week
- show the stable ID when present, formatted as `[ACTION 0001] Owner - Description`
- keep this list short and high-signal
- if there are no relevant actions, say that plainly in one short line
- surface action urgency here instead of putting dated actions into the meeting-notes `Misc` section

Default that template to raw Markdown:

# Day Plan - YYYY-MM-DD

- `Suggested TODOs:`
- `Must-do:`
- `Should-do:`
- `Can-wait:`

- `Control Tower:`
- `Week ahead:`
- `Upcoming milestones:`
- `This week's due TODOs:`
- `Open questions:`
- `Upcoming/past due actions:`

If `Upcoming milestones` contains one or more items, format it like:

- `Upcoming milestones:`
  - `[MS 0006] 8 days until ...`
  - `[MS 0007] 11 days until ...`

If `Open questions` contains one or more items, format it like:

- `Open questions:`
  - `[OQ 0007] Cor_1.0 / Jeff Bargemann - Does the launch build still need the additional service log export?`
  - `[OQ 0008] Admin / Unassigned - What is the approval path for the invoice?`

# Meeting Notes

## Meeting Title - 8:00am (@Cor_1.0)
- Attendees: Name, Name

## Misc

Rules for the meeting-notes template:

- prefer one blank line between meetings
- insert a first-level `# Meeting Notes` heading between the day-plan summary and the first meeting title
- add a trailing `## Misc` section at the bottom of `# Meeting Notes`
- leave `## Misc` empty unless the user explicitly asks to add freeform content there
- include local time in the user's timezone
- choose the most likely notes project in parentheses using best judgment such as `@Cor_1.0`, `@Admin`, or another existing project label
- use stable routing judgment when a meeting topic clearly belongs to an existing project; for example, FEI / wireless-connectivity / connectivity tech-feasibility meetings should default to `@Cor_2.0` unless the user says otherwise
- use the same stable routing judgment for Digital Auscultatory BP Feasibility Study and Riva-related technical-feasibility meetings; they should default to `@Cor_2.0` unless the user says otherwise
- include attendee names only, excluding rooms and resource mailboxes
- use a level-2 Markdown heading for each meeting title
- put attendee and note lines under the heading as bullets
- if attendee count is greater than 10, write `- Attendees: Many`
- omit pure room holds, travel placeholders, and similar non-meeting calendar noise unless the user explicitly wants everything
- do not wrap the template in a fenced code block
- use plain Markdown bullets and sub-bullets for readability
- when the user asks for raw Markdown, return literal Markdown text that is easy to paste into an editor
- if the chat UI would otherwise render the Markdown, escape it or place it in a fenced block only when needed to preserve the raw text view
- if the user explicitly asks for a OneNote-friendly plain-text outline instead, switch formats for that reply

For 1:1 meetings, extend the template with:

  - Personal background: concise human reminders from `profiles.md` first, then notes
  - Potential personal questions: 1-2 optional, natural questions grounded in known context
  - Follow ups from last meeting
    - Were you able to...
  - Open Questions
    - How is...
  - Actions for Them
    - Did you get a chance to...

Under `Follow ups from last meeting`, list only concrete follow-up questions suggested by the latest notes for that person.

Under `Open Questions`, include matching open questions or TODO items from associated TODO markdown files when present.
Under `Actions for Them`, include matching open entries from `## Actions for Others` assigned to that person.

When useful, also include matching decisions from `## Decisions` and milestone pressure from `## Milestones`, but keep the prep short.

When an open question comes from a TODO file, preserve the full TODO text unless the user explicitly asks for a shortened version. Keep captured dates and source notes when they are present in the item.
Include the open-question ID when present, formatted as `[OQ 0007]`, so Andrew can close or reference it directly.

When an action-for-others entry comes from a TODO file, preserve the original action text and due date when present.
Include the action ID when present.

If there are no useful personal notes, no follow-ups, or no open questions, say that plainly instead of inventing content.

## Prepare meetings

For meeting prep, use this compact shape:

- `Purpose:`
- `Decisions:`
- `Risks:`
- `Talking points:` only when useful

Include attendees, related emails or chats, and 1:1 personal background from `profiles.md` and notes only when they materially help. Keep each line very short.

Do not limit prep to prior notes from the same recurring meeting. Use attendees, organizer, project labels, topic keywords, and nearby email/Teams activity to find adjacent context and likely open loops.

When enough context exists, include one or two specific suggestions for what Andrew should ask, decide, delegate, or clarify in the meeting.

When preparing a meeting, check for linked pre-read material in the invite, related emails, or Teams discussion.

If a clearly relevant SharePoint file is available, fetch it and use it to tighten `Purpose`, `Decisions`, `Risks`, or the top-of-plan recommendation.

Do not summarize whole documents. Pull only the few details that affect whether the user should attend, what they need to decide, or what to ask.

For calendar triage, prefer explicit attendance recommendations over neutral summaries.

For non-1:1 recurring meetings, or meetings whose titles are very similar to a recent prior meeting:

- look for the most recent previous occurrence using calendar title matches, close title variants, meeting recap emails, or notes tied to that meeting
- do not rely on exact title matches alone; also group meetings by likely theme, category, or functional lane when the title changes but the workstream is clearly the same
- infer that grouping from the title, body/description, attendees, organizer, routing tag, and repeated terms such as `scrum`, `status`, `status update`, `firmware`, `FW`, `plugin`, `quality`, `regulatory`, `marketing`, `sourcing`, `mounting`, `mechanical`, `supply chain`, `customer`, `clinical`, or similar lane markers
- when several meetings appear to belong to the same workstream, prefer the most recent notes from that functional lane even if the exact meeting name is different
- for Cor1 firmware/status meetings in particular, treat differently named syncs, scrums, status meetings, and status updates as related when they clearly point to the same firmware or plugin workstream
- when exact prior-meeting notes are missing, still include a short recap or reminder drawn from the closest relevant workstream notes, open TODOs, decisions, blockers, or actions
- use the most helpful label for that recap, such as `Previous meeting:`, `Recent lane notes:`, `Relevant reminders:`, or `Open items:` depending on the source
- include a very short `Previous meeting:` line in the day plan or meeting-notes template when useful
- summarize only the last meeting's key outcome, blockers, and any decisions that were made
- if documented decisions exist, include them explicitly as `Decisions:` on the same short recap line or the next bullet
- do not invent decisions; if the prior meeting only had status or action items, say that instead
- skip this recap for 1:1 meetings, which already use the dedicated follow-up format
- keep the recap to one or two bullets maximum

For any meeting, also check `## Actions for Others` across the relevant project TODO files.

Use those actions to influence the top-of-plan summary, especially `Must-do`, `Should-do`, `Control Tower`, or `Upcoming/past due actions`.

Do not auto-populate the meeting-notes `## Misc` section with actions or reminders.

Only surface an action inside an individual meeting block when the user explicitly asks for meeting-specific action reminders or when the action is essential to make the meeting recommendation understandable.

For 1:1 meetings, always check `profiles.md` first for the attendee's profile before answering, then check workspace notes and TODO files for fresh or project-specific context. Search likely profile sections in notes files before giving up.
Normalize shorthand names through the alias map before searching `profiles.md`, notes, and TODO files for 1:1 context.

When personal details or relationship guidance exist, add a very short `Personal:` block with at most 4 bullets total covering:

- family member names or family structure
- likes, dislikes, hobbies, travel, or other human context
- role/function, working relationship, or interaction style when it affects how Andrew should approach the conversation
- one or two possible personal questions, phrased as optional and natural

Prefer concrete details from `profiles.md` over generic small talk prompts, then supplement with more recent notes when they add meaningful context.

If only one or two personal details are available, use those and do not pad.

If only role or interaction-style context exists, offer a work-framed check-in instead of pretending there is personal background.

If no reliable personal notes are found, say `Personal: no useful notes found` rather than inventing one.

Avoid sensitive, medical, family-stress, or private-life prompts unless Andrew explicitly asks to discuss them. Phrase personal questions as possibilities Andrew can choose from, not as scripted lines.

When looking for last-1:1 follow-ups:

- prefer the most recent dated note block for that person
- convert status notes into brief follow-up questions only when a question would naturally help close the loop
- do not fabricate follow-ups from generic biography notes

## Capture follow-ups

After meetings or after communication triage:

- list action items as `owner - next step - due` when known
- call out blocked or aging requests
- note decisions the user still needs to make
- draft the shortest usable email or Teams reply when it would save time

If the user confirms that a tracked TODO or open question is resolved, carry that update into the matching `[project]_todos.md` file using the same close-and-preserve conventions as `project-notes-capture`.

Do not invent commitments, owners, or source access.

## Stay grounded

Assume the user already knows the surrounding context of their work. Omit background unless it changes the recommendation.

Use Outlook and Teams as core working sources when available. For Planner-style tasks, use available task capabilities only when exposed and be explicit about limitations.

Stay practical, calm, and non-repetitive.
