---
name: project-notes-query
description: Search and summarize project-specific note and TODO markdown files in the current workspace. Use when the user asks about old notes for one project, wants TODOs due within a date range, needs milestone or open-question lookup, needs a recap from a project's notes, or explicitly asks for `@All` or all-project search across every project notes and TODO file.
---

# Project Notes Query

Query project notes and TODO trackers without widening scope unnecessarily. Treat this skill as the read-focused companion to `project-notes-capture`.

## Shared Profile

Read [Andrew Carroll profile](../../profile/andrew-carroll-profile.md) first when the task depends on Andrew's preferences, tone, people, priorities, company context, or escalation rules.

## Resolve the search scope first

Default to project-specific search.

If the user specifies `@[project name]`, search only:

- `[project name]_notes.md`
- `[project name]_todos.md`

If the user explicitly asks for `@All`, `all projects`, or equivalent cross-project wording, search every `*_notes.md` and `*_todos.md` file in the current workspace.

If the user asks about old notes within a project and the project is clear from context, do not search unrelated projects.

If project scope is ambiguous, ask one short question before searching.

Read [query rules](references/query-rules.md) when the request mixes note search, TODO listing, and cross-project scope.
Read [name aliases](references/name-aliases.md) when a person is referenced by shorthand, nickname, or partial name.

## Search rules

Use only project note and TODO files for historical note queries.

Do not pull in Outlook or Teams context during a read-only search unless the user explicitly asks you to refresh or enrich today's notes. Historical lookup should be based on saved markdown files, not live mailbox or chat data.

Prefer direct file inspection and targeted text search over broad workspace search when a specific project is named.
Normalize known shorthand names through the alias map before searching.
When helpful, search both the shorthand and the canonical full name in the scoped files.

## Answering note questions

When the user asks for information from old notes:

1. Search the scoped project file set.
2. Find the relevant domain, date, and cluster sections.
3. Answer from those notes only.
4. Cite the project file and the relevant domain/date/cluster when helpful.

If the answer is not present in the scoped files, say that clearly instead of guessing.

## Listing TODOs, milestones, open questions, decisions, and delegated actions

Interpret TODO due dates from the `TODO_YYYY-MM-DD` tag captured in the notes and mirrored into the TODO file.
Interpret recurring TODOs from the `## Recurring TODOs` section, using each item's `Next due` date as the active due date.
Interpret milestone dates from the `MS_YYYY-MM-DD` tag captured in the notes and mirrored into the TODO file.
Interpret open-question ownership from the `OQ_Name` tag captured in the notes and mirrored into the TODO file.
Interpret decisions from `[DEC]` entries captured in the notes and mirrored into the TODO file.
Interpret delegated actions from `## Actions for Others` entries captured from `[Action - Name - Date]` or `[Action - Name]` tags.

When the user asks for TODOs due within a specific range:

1. Search the scoped TODO file or files first.
2. Use inclusive date filtering unless the user specifies otherwise.
3. Default to open TODOs and active recurring TODOs.
4. Mention closed TODOs only when the user explicitly asks for completed items or when that status materially changes the answer.

Return each matching TODO with:

- ID
- project name
- due date
- task text
- status
- source location when practical

When the user asks for milestones, search the `## Milestones` section first and return each match with:

- ID
- project name
- milestone date
- milestone text
- source location when practical

When the user references a milestone by ID such as `MS 0006`, search all scoped TODO files for that exact milestone ID first and prefer that over text matching.

When the user asks for open questions, search the `## Open Questions` section first and return each match with:

- project name
- person name
- question text
- status
- source location when practical

When the user asks for decisions, search the `## Decisions` section first and return each match with:

- project name
- decision text
- capture date when present
- source location when practical

When the user asks for delegated actions, actions for another person, or reminders tied to a named person, search the `## Actions for Others` section first and return each match with:

- ID
- project name
- owner name
- action text
- due date when present
- status
- source location when practical

When the user asks for recurring TODOs, search the `## Recurring TODOs` section first and return each match with:

- ID
- project name
- cadence
- next due date
- task text
- last-completed date when present
- source location when practical

## Cross-project queries

For `@All` or all-project queries:

- search all project note files and all project TODO files
- group the answer by project unless the user asks for a merged timeline
- keep project names explicit to avoid mixing details across programs

If a cross-project query produces overlapping or conflicting notes, report that plainly instead of merging them into one claim.

## Output expectations

Keep answers concise and scoped to the requested files.

When useful, mention:

- which project or projects were searched
- whether the result came from notes, TODOs, or both
- the relevant domain and date
