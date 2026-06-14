import argparse
import json
import re
from datetime import date, datetime
from pathlib import Path


def clean_text(text):
    text = re.sub(r"^- \[[ x]\]\s*", "", text or "")
    text = text.strip().strip("~")
    return re.sub(r"\s+", " ", text).strip()


def age_days(date_text, today):
    if not date_text:
        return None
    try:
        return (today - datetime.strptime(date_text, "%Y-%m-%d").date()).days
    except ValueError:
        return None


def urgency_for(age):
    if age is None:
        return "normal"
    if age > 0:
        return "overdue"
    if age == 0:
        return "today"
    if age >= -7:
        return "upcoming"
    return "normal"


def add_item(items, kind, project, section, item_id, title, due, owner, source, raw, today):
    age = age_days(due, today)
    items.append(
        {
            "kind": kind,
            "project": project,
            "section": section,
            "id": item_id,
            "title": title.strip(),
            "date": due,
            "owner": owner,
            "source": source,
            "raw": raw.strip(),
            "ageDays": age,
            "urgency": urgency_for(age),
        }
    )


def project_name(path, suffix):
    return path.stem[: -len(suffix)] if path.stem.endswith(suffix) else path.stem


def read_todos(root, today):
    items = []
    for path in sorted(root.glob("*_todos.md")):
        project = project_name(path, "_todos")
        section = ""
        for line in path.read_text(encoding="utf-8-sig").splitlines():
            heading = re.match(r"^##\s+(.+)$", line)
            if heading:
                section = heading.group(1)
                continue
            if not line.startswith("- [ ]"):
                continue

            captured_match = re.search(r"Captured (\d{4}-\d{2}-\d{2})", line)
            captured = captured_match.group(1) if captured_match else None

            if section == "Open TODOs":
                match = re.search(r"(TODO \d+) - Due (\d{4}-\d{2}-\d{2}) - (.*?)(?: Captured| Source:|$)", line)
                if match:
                    add_item(items, "todo", project, section, match.group(1), match.group(3), match.group(2), None, captured, line, today)
            elif section == "Recurring TODOs":
                match = re.search(r"(TODO \d+) - Recurring (.*?) - Next due (\d{4}-\d{2}-\d{2}) - (.*?)(?: Last completed| Captured| Source:|$)", line)
                if match:
                    add_item(items, "recurring", project, section, match.group(1), match.group(4), match.group(3), None, captured, line, today)
            elif section == "Milestones":
                match = re.search(r"(MS \d+) - Milestone (\d{4}-\d{2}-\d{2}) - (.*?)(?: Captured| Source:| Rescheduled| Reconfirmed|$)", line)
                if match:
                    add_item(items, "milestone", project, section, match.group(1), match.group(3), match.group(2), None, captured, line, today)
            elif section == "Open Questions":
                match = re.search(r"(OQ \d+) - (?:(.*?) - )?(.*?)(?: Captured| Source:|$)", line)
                if match:
                    owner = match.group(2) or "Unassigned"
                    add_item(items, "question", project, section, match.group(1), match.group(3), captured, owner, captured, line, today)
            elif section == "Actions for Others":
                match = re.search(r"(ACTION \d+) - (.*?) - (.*?)(?: Due (\d{4}-\d{2}-\d{2})\.| Captured| Source:|$)", line)
                if match:
                    due = match.group(4) or captured
                    add_item(items, "action", project, section, match.group(1), match.group(3), due, match.group(2), captured, line, today)
            elif section == "Decisions":
                add_item(items, "decision", project, section, None, clean_text(line), captured, None, captured, line, today)
    return items


def read_day_plans(root):
    raw_root = root / "Raw_Notes"
    if not raw_root.exists():
        return []
    paths = sorted([p for p in raw_root.rglob("*.md") if re.match(r"\d{4}-\d{2}-\d{2}$", p.stem)])
    plans = []
    for path in paths:
        sections = {}
        meetings = []
        current_section = None
        in_meetings = False
        meeting = None
        for line in path.read_text(encoding="utf-8-sig").splitlines():
            if re.match(r"^# Meeting Notes", line):
                in_meetings = True
                current_section = None
                continue
            if not in_meetings:
                heading = re.match(r"^##\s+(.+)$", line)
                if heading:
                    current_section = heading.group(1)
                    sections.setdefault(current_section, [])
                    continue
                if current_section and line.strip():
                    sections[current_section].append(line.strip())
                continue

            heading = re.match(r"^##\s+(.+)$", line)
            if heading:
                if meeting:
                    meetings.append(meeting)
                title = heading.group(1).strip()
                project_match = re.search(r"\(@([^)]+)\)", title)
                time_match = re.search(r" - ([0-9]{1,2}:[0-9]{2}[ap]m)", title)
                meeting = {
                    "title": title,
                    "time": time_match.group(1) if time_match else "",
                    "project": project_match.group(1) if project_match else "",
                    "recommendation": "",
                    "bullets": [],
                }
                continue
            if meeting and line.strip():
                stripped = line.strip()
                recommendation = re.search(r"Recommendation:\s*(.+)$", stripped)
                if recommendation:
                    meeting["recommendation"] = recommendation.group(1)
                if stripped.startswith("- "):
                    meeting["bullets"].append(stripped[2:])
        if meeting:
            meetings.append(meeting)
        plans.append(
            {
                "date": path.stem,
                "path": str(path),
                "sections": {key: value[:8] for key, value in sections.items()},
                "meetings": meetings,
            }
        )
    return sorted(plans, key=lambda plan: plan["date"], reverse=True)


def read_recent_notes(root):
    notes = []
    for path in sorted(root.glob("*_notes.md")):
        project = project_name(path, "_notes")
        current_date = ""
        topic = ""
        buffer = []

        def flush():
            nonlocal buffer
            if current_date and topic and buffer:
                notes.append(
                    {
                        "project": project,
                        "date": current_date,
                        "topic": topic,
                        "bullets": [line for line in buffer if line.startswith("- ")][:4],
                    }
                )
            buffer = []

        for line in path.read_text(encoding="utf-8-sig").splitlines():
            date_heading = re.match(r"^###\s+(\d{4}-\d{2}-\d{2})", line)
            topic_heading = re.match(r"^####\s+(.+)$", line)
            if date_heading:
                flush()
                current_date = date_heading.group(1)
                topic = ""
            elif topic_heading:
                flush()
                topic = topic_heading.group(1).strip()
            elif topic and line.strip():
                buffer.append(line.strip())
        flush()
    return sorted(notes, key=lambda note: note["date"], reverse=True)[:36]


def read_people(root):
    path = root / "profiles.md"
    if not path.exists():
        return []
    people = []
    person = None
    for line in path.read_text(encoding="utf-8-sig").splitlines():
        heading = re.match(r"^###\s+(.+)$", line)
        if heading:
            if person:
                people.append(person)
            person = {"name": heading.group(1).strip(), "role": "", "personal": "", "lastInteraction": "", "style": ""}
            continue
        if not person:
            continue
        role = re.match(r"^- Role/function:\s*(.+)$", line)
        personal = re.match(r"^- Personal information:\s*(.+)$", line)
        interaction = re.match(r"^- Last known interaction:\s*(.+)$", line)
        style = re.match(r"^- Interaction description:\s*(.+)$", line)
        if role:
            person["role"] = role.group(1).strip()
        elif personal:
            person["personal"] = personal.group(1).strip()
        elif interaction:
            person["lastInteraction"] = interaction.group(1).strip()
        elif style:
            person["style"] = style.group(1).strip()
    if person:
        people.append(person)
    return people[:80]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--workspace", default=None)
    args = parser.parse_args()

    script_dir = Path(__file__).resolve().parent
    app_root = script_dir.parent
    root = Path(args.workspace).resolve() if args.workspace else app_root.parent.parent
    today = date.today()

    items = read_todos(root, today)
    plans = read_day_plans(root)
    payload = {
        "generatedAt": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        "today": today.isoformat(),
        "workspaceRoot": str(root),
        "role": "Director, Engineering for Digital Diagnostics at Midmark",
        "principles": [
            "Protect attention",
            "Surface decisions",
            "Track launch risk",
            "Keep people context close",
            "Make the next action obvious",
        ],
        "items": items,
        "dayPlans": plans[:18],
        "latestPlan": plans[0] if plans else None,
        "recentNotes": read_recent_notes(root),
        "people": read_people(root),
    }

    output = app_root / "data" / "planner-data.js"
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text("window.PLANNER_DATA = " + json.dumps(payload, indent=2) + ";\n", encoding="utf-8")
    print(f"Wrote {output}")
    print(f"{len(items)} tracked items, {len(plans)} day plans, {len(payload['recentNotes'])} recent note slices")


if __name__ == "__main__":
    main()
