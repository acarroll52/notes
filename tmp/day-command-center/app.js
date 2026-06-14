(function () {
  const data = window.PLANNER_DATA || {};
  const state = {
    project: "All",
    kind: "all",
    search: ""
  };

  const projects = ["All", ...Array.from(new Set((data.items || []).map((item) => item.project))).sort()];
  const latest = data.latestPlan || {};

  const byId = (id) => document.getElementById(id);
  const normalize = (value) => String(value || "").toLowerCase();
  const escapeHtml = (value) => String(value || "")
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;");

  function sectionLines(names) {
    const sections = latest.sections || {};
    for (const name of names) {
      if (sections[name] && sections[name].length) {
        return sections[name];
      }
    }
    return [];
  }

  function labelForAge(item) {
    if (!item.date) return "no date";
    if (item.kind === "question") return item.source ? `captured ${item.source}` : "open";
    if (item.ageDays > 0) return `${item.ageDays}d overdue`;
    if (item.ageDays === 0) return "due today";
    return `in ${Math.abs(item.ageDays)}d`;
  }

  function scoreItem(item) {
    const kindWeight = { todo: 5, action: 4, milestone: 3, question: 2, recurring: 1, decision: 0 };
    const dueScore = item.ageDays === null || item.ageDays === undefined ? 0 : 100 - item.ageDays;
    const overdueBoost = item.ageDays > 0 ? 300 + item.ageDays : 0;
    const todayBoost = item.ageDays === 0 ? 240 : 0;
    return overdueBoost + todayBoost + (kindWeight[item.kind] || 0) * 12 - dueScore;
  }

  function matches(item) {
    const searchBlob = normalize([
      item.kind,
      item.project,
      item.id,
      item.title,
      item.owner,
      item.raw
    ].join(" "));
    const projectOk = state.project === "All" || item.project === state.project;
    const kindOk = state.kind === "all" || item.kind === state.kind;
    const searchOk = !state.search || searchBlob.includes(state.search);
    return projectOk && kindOk && searchOk;
  }

  function filteredItems() {
    return (data.items || [])
      .filter((item) => item.kind !== "decision")
      .filter(matches)
      .sort((a, b) => scoreItem(b) - scoreItem(a));
  }

  function renderHeader() {
    byId("todayDate").textContent = latest.date || data.today || "";
    byId("generatedAt").textContent = `Snapshot refreshed ${data.generatedAt || "unknown"}.`;

    const next = sectionLines(["Next Action", "Next action"])[0] || sectionLines(["Must-Do", "Must Do", "Must-do", "Must do"])[0] || "";
    byId("nextAction").textContent = next.replace(/^- /, "") || "No latest day plan found yet.";

    const milestone = (data.items || [])
      .filter((item) => item.kind === "milestone" && item.ageDays !== null)
      .sort((a, b) => Math.abs(a.ageDays) - Math.abs(b.ageDays))[0];
    byId("criticalPath").textContent = milestone
      ? `${milestone.project}: ${milestone.id} ${labelForAge(milestone)} - ${milestone.title}`
      : "No open milestones found in the current tracker.";
  }

  function renderFocusStack() {
    const groups = [
      ["Must", sectionLines(["Must-Do", "Must Do", "Must-do", "Must do"])],
      ["Should", sectionLines(["Should-Do", "Should Do", "Should-do", "Should do"])],
      ["Can wait", sectionLines(["Can-Wait", "Can Wait", "Can-wait", "Can wait", "Can Wait / Delegate"])]
    ];
    byId("focusStack").innerHTML = groups.map(([label, lines]) => `
      <article class="focus-card">
        <strong>${escapeHtml(label)}</strong>
        <p>${escapeHtml((lines[0] || "No item captured.").replace(/^- /, ""))}</p>
      </article>
    `).join("");
  }

  function renderMetrics() {
    const items = data.items || [];
    const overdueTodos = items.filter((item) => ["todo", "recurring"].includes(item.kind) && item.ageDays > 0).length;
    const dueSoonMilestones = items.filter((item) => item.kind === "milestone" && item.ageDays <= 14 && item.ageDays >= -7).length;
    const questions = items.filter((item) => item.kind === "question").length;
    const overdueActions = items.filter((item) => item.kind === "action" && item.ageDays > 0).length;
    const metrics = [
      ["Overdue TODOs", overdueTodos, "Close, move, or deliberately park"],
      ["Milestone watch", dueSoonMilestones, "Due or recently missed within 14 days"],
      ["Open questions", questions, "Decision gaps to use in meetings"],
      ["Delegated overdue", overdueActions, "Follow-up owed by others"]
    ];
    byId("metrics").innerHTML = metrics.map(([label, value, helper]) => `
      <article class="metric">
        <div class="metric-head"><span>${escapeHtml(label)}</span><strong>${escapeHtml(value)}</strong></div>
        <p>${escapeHtml(helper)}</p>
      </article>
    `).join("");
  }

  function renderFilters() {
    byId("projectFilters").innerHTML = projects.map((project) => `
      <button type="button" class="${project === state.project ? "is-active" : ""}" data-project="${escapeHtml(project)}">${escapeHtml(project)}</button>
    `).join("");
  }

  function renderCommitments() {
    const items = filteredItems();
    byId("itemCount").textContent = `${items.length} shown`;
    byId("commitmentList").innerHTML = items.length ? items.slice(0, 22).map((item) => `
      <article class="commitment urgency-${escapeHtml(item.urgency || "normal")}">
        <div>
          <span class="kind">${escapeHtml(item.kind)}</span>
          <p>${escapeHtml(item.project)}</p>
        </div>
        <div>
          <h3>${escapeHtml(item.id ? `${item.id} - ${item.title}` : item.title)}</h3>
          <p>${escapeHtml(item.owner ? `Owner: ${item.owner}` : item.section || "")}</p>
        </div>
        <span class="date-pill">${escapeHtml(labelForAge(item))}</span>
      </article>
    `).join("") : `<div class="empty">No commitments match the current filters.</div>`;
  }

  function renderQuestions() {
    const questions = (data.items || [])
      .filter((item) => item.kind === "question")
      .filter((item) => state.project === "All" || item.project === state.project)
      .slice(0, 8);
    byId("questionList").innerHTML = questions.length ? questions.map((item) => `
      <article class="list-row">
        <h3>${escapeHtml(item.id)} - ${escapeHtml(item.title)}</h3>
        <p>${escapeHtml(item.project)} / ${escapeHtml(item.owner || "Unassigned")}</p>
      </article>
    `).join("") : `<div class="empty">No open questions for this filter.</div>`;
  }

  function renderMeetings() {
    const meetings = latest.meetings || [];
    byId("meetingTimeline").innerHTML = meetings.length ? meetings.map((meeting) => `
      <article class="meeting">
        <time>${escapeHtml(meeting.time || "TBD")}</time>
        <div>
          <h3>${escapeHtml(meeting.title)}</h3>
          <p>${escapeHtml(meeting.recommendation || (meeting.bullets || [])[0] || "No recommendation captured.")}</p>
        </div>
      </article>
    `).join("") : `<div class="empty">No meetings found in the latest day plan.</div>`;
  }

  function renderPeople() {
    const people = (data.people || [])
      .filter((person) => {
        const blob = normalize([person.name, person.role, person.personal, person.lastInteraction, person.style].join(" "));
        return !state.search || blob.includes(state.search);
      })
      .slice(0, 18);
    byId("peopleList").innerHTML = people.length ? people.map((person) => `
      <article class="person">
        <h3>${escapeHtml(person.name)}</h3>
        <p>${escapeHtml(person.role || "Role not captured.")}</p>
        <p>${escapeHtml(person.personal && person.personal !== "None captured yet." ? person.personal : person.lastInteraction || "")}</p>
      </article>
    `).join("") : `<div class="empty">No people context matches the current search.</div>`;
  }

  function renderRecentNotes() {
    const notes = (data.recentNotes || [])
      .filter((note) => state.project === "All" || note.project === state.project)
      .filter((note) => {
        const blob = normalize([note.project, note.date, note.topic, (note.bullets || []).join(" ")].join(" "));
        return !state.search || blob.includes(state.search);
      })
      .slice(0, 10);
    byId("recentNotes").innerHTML = notes.length ? notes.map((note) => `
      <article class="note">
        <span class="tag">${escapeHtml(note.project)} / ${escapeHtml(note.date)}</span>
        <h3>${escapeHtml(note.topic)}</h3>
        <ul>${(note.bullets || []).slice(0, 3).map((line) => `<li>${escapeHtml(line.replace(/^- /, ""))}</li>`).join("")}</ul>
      </article>
    `).join("") : `<div class="empty">No recent notes match the current filters.</div>`;
  }

  function renderSourceMap() {
    const counts = projects.filter((project) => project !== "All").map((project) => {
      const items = (data.items || []).filter((item) => item.project === project);
      const open = items.filter((item) => item.kind !== "decision").length;
      const notes = (data.recentNotes || []).filter((note) => note.project === project).length;
      return { project, open, notes };
    });
    byId("sourceMap").innerHTML = counts.map((entry) => `
      <article class="list-row">
        <h3>${escapeHtml(entry.project)}</h3>
        <p>${entry.open} open tracked items, ${entry.notes} recent note slices in this snapshot.</p>
      </article>
    `).join("");
  }

  function render() {
    renderHeader();
    renderFocusStack();
    renderMetrics();
    renderFilters();
    renderCommitments();
    renderQuestions();
    renderMeetings();
    renderPeople();
    renderRecentNotes();
    renderSourceMap();
  }

  function copyFocusBrief() {
    const lines = [];
    lines.push(`# Focus Brief - ${latest.date || data.today || ""}`);
    lines.push("");
    const next = byId("nextAction").textContent;
    lines.push(`Next action: ${next}`);
    lines.push("");
    filteredItems().slice(0, 6).forEach((item) => {
      lines.push(`- ${item.id || item.kind}: ${item.title} (${item.project}, ${labelForAge(item)})`);
    });
    navigator.clipboard.writeText(lines.join("\n")).then(() => {
      byId("copyBriefButton").textContent = "Copied";
      setTimeout(() => { byId("copyBriefButton").textContent = "Copy Focus Brief"; }, 1400);
    });
  }

  document.addEventListener("click", (event) => {
    const project = event.target.closest("[data-project]");
    if (project) {
      state.project = project.dataset.project;
      render();
      return;
    }

    const kind = event.target.closest("[data-kind]");
    if (kind) {
      state.kind = kind.dataset.kind;
      document.querySelectorAll("[data-kind]").forEach((button) => button.classList.toggle("is-active", button.dataset.kind === state.kind));
      renderCommitments();
      return;
    }
  });

  byId("searchInput").addEventListener("input", (event) => {
    state.search = normalize(event.target.value);
    renderCommitments();
    renderPeople();
    renderRecentNotes();
  });

  byId("copyBriefButton").addEventListener("click", copyFocusBrief);

  render();
})();
