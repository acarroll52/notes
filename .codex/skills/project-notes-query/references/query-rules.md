# Query Rules

Use this reference when the request blends project lookup, TODO reporting, and all-project search.

## Scope examples

- `Use $project-notes-query to summarize open issues for @Cor 1.0 from last week.`
  Search only `Cor 1.0_notes.md` and `Cor 1.0_todos.md`.

- `Use $project-notes-query to list TODOs due between 2026-04-01 and 2026-04-15 for @Cor 2.0.`
  Search only `Cor 2.0_todos.md`, then consult `Cor 2.0_notes.md` if source context is needed.

- `Use $project-notes-query to list milestones in @Cor 1.0 through 2026-06-30.`
  Search `Cor 1.0_todos.md` for the `## Milestones` section first.

- `Use $project-notes-query to show open questions for Jeff Bargemann in @Cor 1.0.`
  Search `Cor 1.0_todos.md` for the `## Open Questions` section first.

- `Use $project-notes-query to list decisions for @Cor 1.0 about FDA resubmission.`
  Search `Cor 1.0_todos.md` for the `## Decisions` section first.

- `Use $project-notes-query to search @All for every mention of labeling verification.`
  Search all `*_notes.md` and `*_todos.md` files in the workspace.

## TODO interpretation

- Treat `TODO_YYYY-MM-DD` as the authoritative due-date marker.
- Treat IDs such as `TODO 0005` or `ACTION 0012` as the primary shortcut for lookup and closure when present.
- Treat `MS_YYYY-MM-DD` as the authoritative milestone-date marker.
- Treat `OQ_Name` as the note-time marker for a tracked open question tied to a named person.
- Treat `## Decisions` as the primary store for decision records mirrored from `[DEC]` note tags.
- Use the mirrored TODO file as the primary source for status.
- Treat entries under `## Closed TODOs` as completed even if the original note still shows the raw TODO line.

## Note-cluster interpretation

- Treat user-grouped headings inside a date section as meaningful clusters.
- When summarizing historical notes, preserve those clusters instead of mixing bullets from different clusters just because they share a date.

## Response style

- Keep single-project answers tightly scoped.
- For `@All`, separate findings by project.
- If nothing matches in the scoped files, say so directly.
