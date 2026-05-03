# Cor_2.0 Notes

*Imported legacy OneNote notes from `Cor2.pdf` on 2026-04-01. Explicit page dates from the source were used for each cluster. Substantive PDF visuals were rendered into the workspace and linked from the matching clusters.*

## Raw Notes Capture Status

- Captured through Raw_Notes: 2026-04-21

### Capture Ledger
- 2026-04-08: captured into Cor_2.0 notes. Meetings: `FEI Project Sync- Wireless Connectivity - 10:30am`; `Weekly Sync- Digital Auscultatory BP Feasibility Study - 1:00pm`.
- 2026-04-09: captured into Cor_2.0 notes. Meetings: `Cor 2.0 AI Strategy - 10:00am`.
- 2026-04-10: captured into Cor_2.0 notes. Meetings: `Discuss Cor 1 - 1.5 - 2 plan - 8:30am`; `COR 2.0 Systems Engineering Management Plan (SEMP) - 3:30pm`.
- 2026-04-14: captured into Cor_2.0 notes. Meetings: `Cor 2.0 Technical Feasibility Assessment Meeting - 2:30pm`.
- 2026-04-15: captured into Cor_2.0 notes. Meetings: `FEI Project Sync- Wireless Connectivity - 10:30am`.
- 2026-04-21: captured into Cor_2.0 notes. Meetings: `Cor 2.0 and Cor 1.5 - ideation and workshop session 1 - 12:30pm`.
- 2026-04-24: captured into Cor_2.0 notes. Meetings: `Bi-weekly FEI - Diagnostics Sync - 10:30am`; `Cor 2.0 Planning: Planning, MIP, Project Management and ADO Setup - 2:00pm`.
- 2026-04-28: captured into Cor_2.0 notes. Meetings: `Weekly Sync- Digital Auscultatory BP Feasibility Study - 12:00pm`.
- 2026-04-29: captured into Cor_2.0 notes. Meetings: `BP Patent Workshop - 9:00am`.
- 2026-04-30: captured into Cor_2.0 notes. Meetings: `Cor 2.0 Technical Feasibility Assessment Meeting - 10:00am`; `FEI Project Sync- Wireless Connectivity - 11:00am`; `Cor 2.0 Planning: Planning, MIP, Project Management and ADO Setup - 3:30pm`.

## business

### 2026-01-09
#### Onboarding Notes
- Cor2.0
  - Will replace 1.0.
  - Adds connectivity.
- Team
  - Systems
  - Rashid Shaibu
  - Firmware
  - Electrical
  - Mechanical
  - Project Management
  - Quality
  - Upstream Marketing
  - Manufacturing
  - Regulatory
  - Compliance
  - Verification
  - Cybersecurity
  - Reliability and Robustness
  - Supply Chain
  - IDHF
  - Backend software
- Onboarding visual from the imported PDF:
![Onboarding page](/C:/Users/ACarroll/OneDrive%20-%20Midmark%20Corporation/Documents/ChatGPT/Notes/Cor_2.0_imported_images/Cor2_pdf_page_01.png)

### 2026-01-22
#### Key Decisions/Opportunities
- NIBP improvements
  - Algorithm updates
  - Additional hardware
- Cost reductions
- Requirements
- Agile process

### 2026-04-10
#### Discuss Cor 1 - 1.5 - 2 plan - 8:30am
- Attendees: Chris Collins, James Lua
- Previous meeting: no documented recap found in workspace notes or email.
- Aligned that the team needs to walk through customer needs with upstream marketing and identify whether and how they have been validated.
- If validation is missing, the next step is to define the path to get that data.

## system

### 2026-01-14
#### Wireless Workshop
- Key Customer Needs
  - Workflow efficiency
    - Typical time is about 15 minutes in the exam room for high-volume family care.
  - Vitals History on Device
    - Pull patient record from EMR.
  - Continuous monitoring
    - Important for outpatient infusion treatment.
  - Reduce number of BP cuffs.
  - Motion-tolerant BP.
  - Remote software update.
  - RTLS
    - BLE and IR.
    - IR for room detection, BLE for communications.
    - IR needs line of sight.
    - IR up to 30 ft cone.
    - Very interested in getting out of line-of-sight.
      - UWB.
      - BLE 6 channel sounding.
    - IR is not for data transmission, but it could broadcast something like a unique ID for BLE pairing.
    - Sensor can be battery powered or wired.
      - Battery should last at least 2 years.
      - 3 D cells.
  - Misc
    - May want DVSD to be connected to plug-in even when not taking vitals.
    - May want to stream data from chair status or other equipment data in the room.
    - Is retrofitting to older chairs in scope?
    - BLE 6 requires stationary anchors.
    - Curtain dividers are uncommon and likely out of scope.
    - LiFi?

### 2026-04-08
#### FEI Project Sync- Wireless Connectivity - 10:30am
- Attendees: Jennifer Serres, Rick J. Schuman
- Previous meeting: no documented recap found in workspace notes or email.
- Dev kits coming from TI. Arriving Monday.
- Just met with Nordic last week. Dev kits need to be ordered.
- Also looking at Silicon Labs. Meeting next Tuesday.
- Order kits with credit card and use Jennifer's cost center in Concur.
- Jennifer's direction is to focus on the tech feasibility and not detailed component selection. Pick the most likely path to success and defer a deep-dive COGS/performance evaluation until the project.

### 2026-04-10
#### COR 2.0 Systems Engineering Management Plan (SEMP) - 3:30pm
- Attendees: Rashid Shaibu, Greg Luthman
- Previous meeting: no documented recap found in workspace notes or email.
- Tailor systems engineering practices for a specific process.

#### Weekly Sync- Digital Auscultatory BP Feasibility Study - 1:00pm
- Attendees: Many
- Previous meeting: no documented recap found in workspace notes or email.
- Did not attend.

### 2026-04-28
#### Weekly Sync- Digital Auscultatory BP Feasibility Study - 12:00pm
- Attendees: Many
- Previous meeting: no useful recap beyond a lightweight status touchpoint; this looked lower leverage than the sponsor meeting and Cor 1 decision slices.
- Skipped.
- *Context added from Outlook meeting: "Weekly Sync- Digital Auscultatory BP Feasibility Study" at 12:00 PM on 2026-04-28. The attendee list included Jennifer Serres, Radouane Bouguerra, Nick Ross, Arjun Sridhar, Priority Designs attendees, and others, confirming this was the Riva / digital auscultatory feasibility sync. Source: Outlook calendar.*

### 2026-04-29
#### BP Patent Workshop - 9:00am
- Attendees: Many
- Purpose: blood-pressure-focused patent workshop in Cincinnati with a Webex option.
- Talking points: keep the invention focus broad enough to cover Riva / BP workflow, cuff variants, deflation-rate insights, and EMR-connected workflow advantages.
- Recent lane notes:
  - Riva June study protocol is in progress.
  - Deflation rate matters because heartbeats are needed across the five K-sound stages.
  - Competitive pricing now includes Baxter ambulatory and GE Portrait, with Baxter acute and Mindray still TBD.
- New patent attorney: Justin, based in Cincinnati.
- Patents cost `$15k-$25k` to file, with another approximately `$20k` over time to keep the patent alive.
- Only `2 mmHg` deflation rate is "validated" against a cannula measurement.
- K sounds:
  - K sounds are not caused by pressure or heartbeats. They are associated with arterial wall thickness changes due to turbulent flow caused by the pressure restriction and release.
  - There are five K-sound stages.
  - The fifth stage is diastolic and is very difficult to hear.
  - Clinicians use the first four sounds to help locate the fifth.
- Due to variations in biology/pathology, oscillometric readings are only accurate for about `80%` of the population.
- Look into scroll pumps, which are silent and whose volumetric air flow does not change with pressure.
  - ![image-20260429101037874](C:/Users/ACarroll/AppData/Roaming/Typora/typora-user-images/image-20260429101037874.png)
  - A brushless motor would allow pressure to be held without turning on and off. This could remove the venting system.
- *Context added from Outlook meeting: "BP Patent Workshop" at 9:00 AM on 2026-04-29. Jennifer Serres organized the all-day Cincinnati/Webex workshop in CN Landings 2, and the attendee list included Justin Wise, Rigved Dubhashi, Nick Ross, Jeromy Raczak, Radouane Bouguerra, Daniel Herman, Soumajit Sen, Rick J. Schuman, Leslie Gaier Brown, and others. Source: Outlook calendar.*

### 2026-04-14
#### Cor 2.0 Technical Feasibility Assessment Meeting - 2:30pm
- Attendees: Soumajit Sen, Nick Ross, Rick J. Schuman, Daniel Herman
- Previous meeting: no documented recap found in workspace notes or email.
- SiLabs has two separate kits for angle of arrival and channel sounding + 16 channel antenna array. We could wire them together through UART.
  - Claim `0.3m` accuracy.
- TI has chip that supports both AoA and channel sounding but not an antenna.
  - Dev kits arrived Monday.
- Nordic does not have own antenna array and does not have own algorithm for AoA (rely on external vendors for this).
- Meeting with Digi next week.
- Working on setting up meeting with Ezurio.

### 2026-04-15
#### FEI Project Sync- Wireless Connectivity - 10:30am
- Attendees: Jennifer Serres, Rick J. Schuman
- Previous meeting: no documented recap found in workspace notes or email.
- Aligned on setting up a meeting with upstream, systems, and ID to discuss the full set of use cases.

### 2026-04-24
#### Bi-weekly FEI - Diagnostics Sync - 10:30am
- Attendees: Jennifer Serres
- Previous meeting: aligned on setting up a meeting with upstream, systems, and ID to discuss the full wireless-use-case set.
- Latest signal: Jennifer said she would be off-site and could update Andrew virtually on the prior day's discussion.
- KV visit was good.
  - Lead EE seemed good and excited.
  - Would entertain fixed or T&M quote; Midmark prefers fixed.
- Cor meeting:
  - Chris was added to the monthly Cor 2 director meeting.
- Riva update:
  - Working on protocol for June study.
    - Focused on algorithm.
  - Deflation rate is important because heartbeats are needed within each of the five K-sound stages.
- *Context added from Outlook meeting: "Bi-weekly FEI - Diagnostics Sync" at 10:30 AM on 2026-04-24. The invite included Jennifer's note that she would be off-site but could connect virtually and update Andrew on the prior day's discussion. Source: Outlook calendar.*

### 2026-04-30
#### Cor 2.0 Technical Feasibility Assessment Meeting - 10:00am
- Attendees: Soumajit Sen, Andrew Carroll, Nicholas Ross, Rick J. Schuman, Daniel Herman
- Previous notes: SiLabs, TI, Nordic, Digi, and Ezurio wireless options are still the useful comparison lane.
- Decisions needed: what needs feasibility proof now versus what can wait until Gate 1 planning.
- Listed out areas for investigation. Soumajit took a picture of the whiteboard and will load it into ADO.
- TODO_2026-05-06 Ask Jennifer about SpO2 patent search and chair team brainstorm.
- *Context added from Outlook meeting: "Cor 2.0 Technical Feasibility Assessment Meeting" at 10:00 AM on 2026-04-30. The invite says this is the recurring bi-weekly feasibility-assessment discussion for Cor 2.0 and included Soumajit Sen, Nick Ross, Rick J. Schuman, Daniel Herman, Jeromy Raczak, and Andrew Carroll. Source: Outlook calendar.*

#### FEI Project Sync- Wireless Connectivity - 11:00am
- Attendees: Jennifer Serres, Rick J. Schuman, Andrew Carroll
- Recommendation: optional/delegate because it conflicts with Zone Analysis; request notes unless a Cor2 architecture decision is needed.
- Previous notes: Riva June study protocol is in progress; deflation rate matters because five K-sound stages need heartbeat coverage.
- Moving forward with Nordic beacon for angle of arrival, SiLabs antenna array and angle detection, and TI channel sounding.
- Rick got the angle-of-arrival feature working in the Nordic beacon.

## planning

### 2026-04-21
#### Cor 2.0 and Cor 1.5 - ideation and workshop session 1 - 12:30pm
- Attendees: Arjun Sridhar, Jennifer Serres, Rigved Dubhashi, Soumajit Sen, Rashid Shaibu, Chris Collins, Rick J. Schuman, Maria Murphy, Nick Ross
- Purpose: define what has to happen to reach Gate 1 in October, what must run in parallel across technical derisking, marketing, and commercial work, and where the software and firmware dependencies are acceptable versus risky.
- Risks: this was a long block, and Nick's automatic reply said he was out sick on Monday, so decide whether full-session attendance is needed versus only the decision slices.

### 2026-04-24
#### Cor 2.0 Planning: Planning, MIP, Project Management and ADO Setup - 2:00pm
- Attendees: Soumajit Sen
- Previous meeting: this series was set up to formalize the ADO / Agile structure, templates, reporting, scheduling, and planning cadence for Cor 2.0.
- Relevant reminder: Monday's ideation workshop framed Gate 1 in October as the broader goal, so this block is only worth full attention if the mechanics are affecting real planning decisions.
- Soumajit will start populating RISDA, invite Maria / Arjun to this meeting going forward, and start a weekly Cor 2.0 meeting starting the week after the FDA response, the week of May 25.
- *Context added from Outlook meeting: "Cor 2.0 Planning: Planning, MIP, Project Management and ADO Setup" at 2:00 PM on 2026-04-24. The invite said the purpose was to formalize an ADO / Agile structure for Cor 2.0, including templates, reporting, scheduling, and planning. Source: Outlook calendar.*

### 2026-04-30
#### Cor 2.0 Planning: Planning, MIP, Project Management and ADO Setup - 3:30pm
- Attendees: Soumajit Sen, Andrew Carroll, Maria Murphy, Arjun Sridhar
- Previous notes: Soumajit was to start RISDA, include Maria/Arjun, and start weekly Cor2 meetings the week of `2026-05-25` after FDA response.
- Decisions needed: ADO structure, MIP owner, and feature sizing path for `TODO 0020` due `2026-05-01`.
- Upstream has already aligned with Jake/Josh on strategy for MIP Gate 0 deliverables:
  - No docs, just one PowerPoint deck.
  - Not doing some deliverables at all; punting them to a future phase.
  - Upstream has its own MIP spreadsheet. Soumajit will combine it with ours.
- Present the latest plan for Cor 2.0 / 3.0 at May SIR.
- Tentative plan is to hold Gate 0 at July SIR, but it could punt to August if more time is needed.
- *Context added from Outlook meeting: "Cor 2.0 Planning: Planning, MIP, Project Management and ADO Setup" at 3:30 PM on 2026-04-30. The invite frames this series as the recurring weekly planning forum for Cor 2.0 MIP Gate Reviews and the ADO/Agile structure. Source: Outlook calendar.*

### 2026-03-03
#### Schedule
- PDP Phase 0
  - Customer Needs
  - Business Needs
  - Proof of Concept Plan and Summary
  - Build, Risk Reduction and Mitigation Plan
  - Reliability, Robustness, and Warranty Plan
  - Regulatory Plan
  - Quality Plan
- MIP Phase 0
  - Create Customer Research Plan and Summary
  - Establish Commercialization Plan
  - Create RISDA
- PDP Phase 1
  - Customer, business, service, packaging, cyber requirements
  - Software plan
  - Risk management plan
  - Cybersecurity plan
  - Threat model
  - DFMEA
- MIP Phase 1
  - Opportunity Charter

### 2026-04-09
#### Cor 2.0 AI Strategy - 10:00am
- Attendees: Nick Ross, Soumajit Sen
- Previous meeting: no documented recap found in workspace notes or email.
- Well received.
- *Context added from Outlook meeting: "Cor 2.0 AI Strategy" at 10:00 AM on 2026-04-09. The invite also included Daniel Herman, Rick J. Schuman, and Jeromy Raczak, indicating a broader technical-leadership discussion than the raw notes alone captured. Source: Outlook calendar.*
