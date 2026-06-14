# Format Examples

Use these examples when creating a new project note file or TODO file.

## Notes file example

File name: `Cor 1.0_notes.md`

```md
# Cor 1.0 Notes

## electrical

### 2026-03-31
#### Isolation Tester for Zone
- Submitted updated labeling language for review.
- Waiting on confirmation that the verification memo still matches the current build.
- TODO_2026-04-15 Confirm the final list of required regulatory attachments.
- MS_2026-04-22 Cor 1.0 verification package approved for release.
- *Context added from Outlook email: "Cor 1.0 labeling update" from Alex Carroll at 10:14 AM on 2026-03-31.*

## manufacturing

### 2026-03-31
#### Roll Through Yield
- Need to verify whether the watchdog reset change is included in the latest package.
- [OQ] Jeff Bargemann: Does the launch build still need the additional service log export?
- Failure categories under discussion:
  - Prosim8 failures should not count because this was an EOLT issue.
  - RRP timeout should not count because the EOLT was updated to account for it.
- *Context added from Teams message in Cor 1.0 Firmware at 3:27 PM on 2026-03-31.*

## misc

### 2026-03-31
#### General Notes
- Need to ask whether service documentation should move with the release package.
```

## TODO file example

File name: `Cor 1.0_todos.md`

```md
# Cor 1.0 TODOs

## Open TODOs
- [ ] TODO 0001 - Due 2026-04-15 - Confirm the final list of required regulatory attachments. Captured 2026-03-31. Source: regulatory / 2026-03-31.
- [ ] TODO 0002 - Due 2026-04-18 - Verify watchdog reset change is included in the latest package. Captured 2026-03-31. Source: firmware / 2026-03-31.

## Recurring TODOs
- [ ] TODO 0003 - Recurring weekly - Next due 2026-04-15 - Send staff update. Started 2026-04-15. Captured 2026-04-13. Source: business / 2026-04-13.
- [ ] TODO 0004 - Recurring monthly (last day) - Next due 2026-04-30 - Review open project risks. Captured 2026-04-13. Source: business / 2026-04-13.

## Milestones
- [ ] Milestone 2026-04-22 - Cor 1.0 verification package approved for release. Captured 2026-03-31. Source: regulatory / 2026-03-31.

## Open Questions
- [ ] OQ 0005 - Jeff Bargemann - Does the launch build still need the additional service log export? Captured 2026-03-31. Source: manufacturing / 2026-03-31.

## Decisions
- [x] Cor 1.0 will submit the NIBP PR change in version 1.2.0 instead of going back to 1.1.3. Captured 2026-04-01. Source: regulatory / 2026-04-01.

## Actions for Others
- [ ] ACTION 0006 - Nick Ross - Follow up with validation on the fixture issue. Due 2026-04-10. Captured 2026-04-06. Source: manufacturing / 2026-04-06.

## Closed TODOs
- [x] ~~TODO 0006 - Due 2026-03-28 - Send draft business case to finance. Captured 2026-03-24. Closed 2026-03-27. Source: business / 2026-03-24.~~
```

## Standalone tag example

If the user sends only a standalone tag prompt such as:

```text
@Cor 1.0 [OQ] Jeff Bargemann: Does the launch build still need the additional service log export?
```

or

```text
@Cor 1.0 MS_2026-04-22 Cor 1.0 verification package approved for release.
```

update only `Cor 1.0_todos.md`.

Shorthand date tags should be normalized before writing:

```text
@Cor 1.0 TODO_04-15 Review updated deficiency response package.
@Cor 1.0 MS_09-17 Commercialization target.
```

If today is `2026-04-02`, treat those as:

- `TODO_2026-04-15 Review updated deficiency response package.`
- `MS_2026-09-17 Commercialization target.`

If the month/day has already passed this year, use the next year instead.

Bracketed tags should also be normalized before writing:

```text
@Cor 1.0 [TODO 4/15] Review updated deficiency response package.
@Cor 1.0 [MS 9/17] Commercialization target.
@Cor 1.0 [DEC] Cor 1.0 will submit the NIBP PR change in version 1.2.0.
@Cor 1.0 [Action - Nick - 4/10] Follow up with validation on the fixture issue.
@Cor 1.0 [RTODO weekly 4/15] Send staff update.
@Cor 1.0 [RTODO end monthly] Review open project risks.
```

If today is `2026-04-02`, treat those as:

- `TODO_2026-04-15 Review updated deficiency response package.`
- `MS_2026-09-17 Commercialization target.`
- a decision entry under `## Decisions` with the decision text unchanged
- an action-for-others entry under `## Actions for Others`
- a recurring TODO under `## Recurring TODOs` with weekly cadence and `Next due 2026-04-15`
- a recurring TODO under `## Recurring TODOs` with monthly last-day cadence and the next month-end due date

Do not create a new dated cluster in `Cor 1.0_notes.md` for that standalone prompt.

Recurring TODO completion example:

```md
## Recurring TODOs
- [ ] TODO 0003 - Recurring weekly - Next due 2026-04-15 - Send staff update. Started 2026-04-15. Captured 2026-04-13. Source: business / 2026-04-13.
```

If the user later says that recurring TODO is complete on `2026-04-15`, update it like this:

```md
## Recurring TODOs
- [ ] TODO 0003 - Recurring weekly - Next due 2026-04-22 - Send staff update. Started 2026-04-15. Last completed 2026-04-15. Captured 2026-04-13. Source: business / 2026-04-13.
```

## Answered open-question example

If an existing open question is later answered in a meeting note, keep the answer in the notes and close the matching entry in the TODO file.

Example note content:

```md
#### Andrew/Rig 1:1 - 4:00pm
- Open Questions
  - ask about software pricing model. What updates require a maintenance plan vs come for free?
    - License is $1k-3k per seat. License is perpetual, but there is a yearly maintenance plan you need to keep up on to get any updates.
```

Example TODO update:

```md
## Open Questions

## Closed TODOs
- [x] ~~OQ 0007 - Rigved Dubhashi - ask about software pricing model. What updates require a maintenance plan vs come for free? Captured 2026-04-01. Closed 2026-04-01. Source: business / 2026-04-01.~~ Answered 2026-04-01: license is perpetual, and updates require an active yearly maintenance plan.
```

## Raw notes example

If the user says `process today's notes`, read `Raw_Notes\YYYY-MM-DD.md` and ignore everything under `# Day Plan - YYYY-MM-DD`.

Parse only `# Meeting Notes`.

For example:

```md
# Day Plan - 2026-04-01

- Ignore this whole section during note capture.

# Meeting Notes

## Touch Base on FDA Resubmission - 8:00am (@Cor_1.0)
- Attendees: Maggie Stahl, Leslie Gaier Brown
- We will put the NIBP PR change into 1.2.0 (not go back to 1.1.3)
- New commercialization date is MS_2026-09-17 (2 weeks ahead of previous worst case date)
  - 510k pushes customer evals

## Vendor Budget Review - 2:00pm (@Admin)
- Need to confirm whether the cost model includes service renewals.
- [OQ] Rig: ask about software pricing model. What updates require a maintenance plan vs come for free?
```

Process those as two separate meeting clusters:

- send `Touch Base on FDA Resubmission - 8:00am` to `Cor_1.0_notes.md` and `Cor_1.0_todos.md`
- send `Vendor Budget Review - 2:00pm` to `Admin_notes.md` and `Admin_todos.md`

Do not combine them just because they came from the same raw-notes file.

## Matching and cleanup rules

- Reuse the existing heading capitalization when a project file already exists.
- Keep one `### YYYY-MM-DD` section per date inside each domain.
- Keep grouped bullets together under a `####` cluster heading.
- Prefer appending new bullets to the bottom of the relevant cluster.
- Keep user-authored note text ahead of any italicized context that you add.
- Treat domains as a retrieval index first and a human-browsing aid second.
- Re-evaluate domains over time, and move whole clusters when that improves future retrieval.
- You may merge, rename, or create domains when that makes query results cleaner and more consistent.
- Move whole clusters instead of separating bullets that were originally grouped together.
- Preserve nested bullet levels and numbered substeps whenever the source provides enough structure to do that reliably.
- Track `TODO_YYYY-MM-DD`, `TODO_MM-DD`, bracketed `TODO` tags, `MS_YYYY-MM-DD`, `MS_MM-DD`, bracketed `MS` tags, `[OQ]`, `[DEC]`, and `[Action - Name - Date]` or `[Action - Name]` in the TODO file.
- Track bracketed recurring TODO tags such as `[RTODO weekly 4/15]` and `[RTODO end monthly]` in `## Recurring TODOs`.
- Assign every TODO, recurring TODO, milestone, open-question, and action-for-others entry a stable 4-digit ID and preserve that ID when the item is closed.
- Normalize shorthand `TODO_MM-DD` and `MS_MM-DD` tags to the next upcoming `YYYY-MM-DD` before writing them.
- Normalize bracketed `TODO` and `MS` tags to the standard `TODO_YYYY-MM-DD` and `MS_YYYY-MM-DD` forms before writing them.
- Normalize bracketed recurring TODO tags to a stored cadence plus `Next due` date before writing them.
- Store decisions from `[DEC]` under `## Decisions`.
- Store delegated actions from `[Action - Name - Date]` or `[Action - Name]` under `## Actions for Others`.
- Store recurring TODOs from `[RTODO ...]` under `## Recurring TODOs`.
- If `MS_YYYY-MM-DD` or `[OQ]` is embedded inside broader notes, keep the original tagged note text in the notes file too.
- If `MS_YYYY-MM-DD` or `[OQ]` is the entire prompt by itself, update only the TODO file and do not add a note cluster.
- If an owner inferred from `[OQ]` looks like a shorthand or partial match for an existing open-question person, stop and ask the user to clarify before editing the TODO file.
- When newly captured notes clearly answer an existing open question, close that question automatically in the TODO file and keep the answer in the notes.
- If the user asks to process today's notes, ignore the `Day Plan` section and parse only `Meeting Notes` from `Raw_Notes\YYYY-MM-DD.md`.
- In raw-notes processing, treat each `##` meeting heading as its own project-targeted capture unit.
- In raw-notes processing, run a real same-day enrichment pass for each meeting using the meeting title, attendees, and distinctive note phrases across Outlook and Teams before deciding that there is no context to add.
- Prefer adding non-redundant enrichment such as clarified requests, decisions, owners, dates, or related side-thread details instead of repeating facts already present in the raw notes.
- After finding one strong Teams hit, inspect the related chat or thread for nearby follow-up messages before deciding the context capture is complete.
- In raw-notes processing, do enrichment in a staged way instead of firing many connector calls at once: prefer one strong Outlook email or calendar anchor first, then search Teams only if it is likely to add value.
- If Outlook or Teams returns `429 Too Many Requests`, stop broad enrichment retries, keep the notes update moving, and use the strongest context already captured.
