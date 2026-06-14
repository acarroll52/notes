# Andrew Control Tower

A local planning cockpit generated from the Markdown notes in this workspace. It does not modify skills, project notes, TODO files, or raw notes.

## Refresh The Snapshot

From `C:\Users\ACarroll\OneDrive - Midmark Corporation\Documents\ChatGPT\Notes`:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\tmp\day-command-center\scripts\refresh-data.ps1
```

The script writes `tmp\day-command-center\data\planner-data.js`, which the browser app reads directly.

## Run Locally

```powershell
cd .\tmp\day-command-center
python -m http.server 5177
```

Then open `http://localhost:5177`.

## Design Intent

- Put the next action, launch-risk milestones, overdue work, delegated actions, and open questions above the fold.
- Keep Cor 1.0, Cor 2.0, Admin, and Zone context filterable instead of forcing one long Markdown scroll.
- Make relationship context and 1:1 prep searchable without mixing it into external-facing drafts.
- Preserve project TODO files as the source of truth while giving the planner a fast visual layer.
