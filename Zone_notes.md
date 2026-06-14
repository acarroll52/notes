# Zone Notes

## Raw Notes Capture Status

- Captured through Raw_Notes: 2026-06-12

### Capture Ledger
- 2026-06-12: processed `Zone - Commercial Update - 3:00pm` with no substantive non-generated notes to capture.
- 2026-06-05: processed `Zone Quality Issues - 8:00am`; `Zone - Commercial Update - 3:00pm`; `CAPA005714 Recall Discussion - 4:00pm` with no substantive non-generated notes to capture.
- 2026-06-03: captured into Zone notes. Meetings: `CAPA005714 Touch Base - 11:00am`. Processed `Zone Quality Issues - 8:00am` with no substantive non-generated notes to capture.
- 2026-06-02: processed `Zone Quality Issues - 8:00am`; no substantive non-generated notes were present to capture.
- 2026-05-29: processed `Zone Quality Issues - 8:00am`; no substantive non-generated notes were present to capture.
- 2026-05-27: captured into Zone notes. Meetings: `Zone Quality Issues - 8:00am`.
- 2026-05-26: processed `Zone Quality Issues - 8:00am`; no substantive non-generated notes were present to capture.
- 2026-05-19: processed `Zone Quality Issue Update - 8:00am`; no substantive non-generated notes were present to capture.
- 2026-05-18: processed `Zone Quality Issue Update - 8:00am`; no substantive non-generated notes were present to capture.
- 2026-05-15: captured into Zone notes. Meetings: `Zone Quality Issue Update - 8:00am`; `Zone Set Screw CAPA Kickoff - 9:30am`.
- 2026-05-11: captured into Zone notes. Meetings: `Zone Quality Issue Update - 8:00am`.
- 2026-05-08: captured into Zone notes. Meetings: `Zone Quality Issue Update - 8:00am`; misc note `Zone set screw data report out`.
- 2026-05-07: captured into Zone notes. Meetings: `Zone Quality Issue Update - 8:00am`.
- 2026-04-27: captured into Zone notes. Meetings: `Isolation Test for ZONE and UART Alignment - 12:30pm`.
- 2026-04-28: captured into Zone notes. Meetings: `Zone Testing`.
- 2026-04-29: captured into Zone notes. Meetings: `Zone - Analysis update - 7:30am`.
- 2026-04-30: captured into Zone notes. Meetings: `Zone Quality Issue Update - 8:00am`; `Zone Analysis Check In - 11:00am`.
- 2026-05-01: captured into Zone notes. Meetings: `Zone Quality Issue Update - 8:00am`; `Review of Data/Determine Line Start Up - 2:00pm`.
- 2026-05-04: captured into Zone notes. Meetings: `Zone Quality Issue Update - 8:00am`.
- 2026-05-05: captured into Zone notes. Meetings: `Zone Quality Issue Update - 8:00am`.
- 2026-05-06: captured into Zone notes. Meetings: `Zone Quality Issue Update - 8:00am`.

## manufacturing

### 2026-04-27
#### Isolation Test for ZONE and UART Alignment - 12:30pm
- Attendees: Many
- Purpose: align coverage for main-board UART and implementation of the isolation tester on Zone NIBP.
- Risk: the organizer explicitly said not everyone needs to be on the call, which is a good hint to delegate unless the process gap needs director-level pressure.
- Creation is looking through every board record to identify if any others got through without UART lock.
- Splitting UART lock into two steps, lock and check, each with its own pass/fail step.
- Creation will upload board record files to the shared FTP site for the Cincinnati team to review.
- Creation will automate the sign-off that the UART lock step was run.
- Planning to ship some main boards by Friday this week.
- *Context added from Outlook meeting: "Isolation Test for ZONE and UART Alignment" at 12:30 PM on 2026-04-27. The invite said the group should align on coverage for the main-board UART and implementation of the isolation tester on Zone NIBP; it also noted not everyone needed to be on the call. Source: Outlook calendar.*

## testing

### 2026-06-03
#### CAPA005714 Touch Base - 11:00am
- Attendees: Andrew Carroll, Janie Pearson
- `CRB` happens after Planning phase.
- Janie will set up a separate meeting from `CRB` to discuss field action.
- Field action on this is news to Janie.
- *Context added from Outlook email: "FW: CAPA005714" from Janie Pearson at 8:35 AM on 2026-06-02. Janie said Andrew's `5-Why` attachment is needed to move `CAPA005714` from Investigation to Investigation Review, and that the Plan phase could target the `2026-06-09` `CRB` if ready or move to the `2026-07-14` `CRB` if more time is needed. Source: Outlook email.*

### 2026-05-27
#### Zone Quality Issues - 8:00am
- Need to release the Zone set-screw testing data; talk to Taylor and Pat.

### 2026-05-15
#### Zone Quality Issue Update - 8:00am
- Attendees: Many
- Recommendation: Attend or request notes only if temperature sensitivity, CAPA evidence, or customer risk is discussed.
- Recent reminders: set-screw MI is moving to CAPA; flash parts remain the primary path; Hackensack MDR and Better BP alignment are still linked.
- Decisions needed: evidence threshold, containment/customer-risk framing, whether the NIBP temperature-sensitivity theory changes the path.

#### Zone Set Screw CAPA Kickoff - 9:30am
- Attendees: Andrew Carroll, Jordan Rapking, Janie Pearson
- Recommendation: Attend; Andrew-owned kickoff.
- Purpose: start CAPA mechanics for set-screw issue.
- Decisions needed: CAPA problem statement, scope boundary, owner, evidence package, and link to Hackensack/Better BP.
- Janie is new and came from Abbott.
- CAPA005714.
- Jordan is listed as owner because Andrew does not have permissions in Agile.
- Jordan will fill out the cover page, then the CAPA will move to the Risk Assessment stage.
  - The team would like to get this done within a week.
  - HHE = Health Hazard Evaluation.
    - Owen would own the HHE.
    - The HHE is linked to CAPA through Relationships.
    - It is unclear whether one already exists.
  - Product Safety Risk pulls in the applicable line from the RMF.
    - Russ, Owen, and Shane can help here.
  - Containment:
    - Supplier is now leaving the set screw alone.
  - Correction:
    - Field action / rework.
- Next step after Risk Assessment is Investigation.
  - Investigation should take about 2 weeks, but it could be longer.
  - Investigation includes root-cause analysis.
  - Investigation tools include 5 Whys, fishbone, and a released document for investigation tools.
- Next step after Investigation is Plan.
  - Quality owns effectiveness.
- CAPA review board requires Quality, Manufacturing, and Engineering.
  - John Shevlin and Jeff Bargemann are involved.
- There is an adverse event board.
  - Tom, John Shevlin, and Adam Clutter would get involved during the risk-assessment stage.
- Jordan is out next week.
- TODO_2026-05-22 Finalize risk assessment stage of CAPA.

### 2026-05-11
#### Zone Quality Issue Update - 8:00am
- Attendees: Many
- Recommendation: Request notes unless restart/customer/CAPA risk needs you live.
- Previous notes: Friday Zone set-screw data report out and tomorrow's CRB CAPA make owner/scope the useful signal.
- Decisions: evidence threshold, CAPA owner/scope, customer-risk framing.
- [DEC] Moving forward with flash parts as primary path (not re-work).
- Transitioning MI for set screw to CAPA.
- MDR is being released for Hackensack complaints indicating the issue was resolved with Better BP.
- Flash testing Dan has been doing will be captured in Engineering Study. Don't need to repeat under protocol.

### 2026-05-08
#### Zone Quality Issue Update - 8:00am
- Attendees: Many
- Request notes unless a restart or customer-risk decision is happening live.
- Previous meeting: worst-case set-screw and manifold-flash testing were still active, and Hackensack alignment looked acceptable when Better BP protocol is followed.
- Decisions needed: restart confidence, evidence threshold, field-unit disposition, and owner for remaining valve/flash checks.
- *Context added from Outlook meeting: "Zone Quality Issue Update" at 8:00 AM on 2026-05-08. The invite described this as a daily meeting for the next two weeks and included quality, operations, engineering, and customer-quality stakeholders. Source: Outlook calendar.*

#### Zone set screw data report out
- No additional detail was recorded in the raw note beyond the report-out heading.
- *Context added from Outlook meeting: "Zone Testing Data Review" at 1:00 PM on 2026-05-08. The invite described the meeting as a review of Hackensack-unit data and linear-valve variability, with Leslie Gaier Brown, Nick Ross, Pat Reichert, Taylor Schmitmeyer, Patrick Caplinger, Tom Schwieterman, Scott Albers, and Andrew Carroll included. Source: Outlook calendar.*

### 2026-05-07
#### Zone Quality Issue Update - 8:00am
- Attendees: Many
- Request notes unless a restart/customer-risk decision is live.
- Previous meeting: worst-case set-screw and manifold-flash testing were still running, and Hackensack alignment looked acceptable when Better BP protocol is followed.
- Decisions needed: restart confidence, evidence threshold, field-unit disposition, and owner for remaining valve/flash checks.
- Working on getting a new Zone device (with good manifold) to Cinci tomorrow. Will test as baseline and then test again with a bad manifold.

### 2026-04-28
#### Zone Testing
- Attendees: Jessica Fortkamp, Patrick Caplinger, Taylor Schmitmeyer, Pat Reichert, Nick Ross
- Next steps:
  - Re-test leak.
  - Controlled teardown.
  - Ana.
- *Context added from Outlook meeting: "Zone Measurement Phase Check in" at 11:15 AM on 2026-04-28. The invite included Leslie Gaier Brown, Pat Reichert, Patrick Caplinger, Taylor Schmitmeyer, Jessica Fortkamp, Nick Ross, and others, matching the Zone testing note. Source: Outlook calendar.*

### 2026-04-29
#### Zone - Analysis update - 7:30am
- Attendees: Leslie Gaier Brown, Jessica Fortkamp, Pat Reichert, Patrick Caplinger, Brady Post, Taylor Schmitmeyer, Nick Doseck, Nick Ross, Andrew Carroll
- Previous meeting: Zone testing next steps were to re-test the leak, perform controlled teardown, and involve Ana.
- Recent lane notes:
  - Creation is checking board records for UART lock gaps.
  - Creation is splitting lock/check into separate pass-fail steps.
  - Creation is uploading board records for Cincinnati review.
  - Creation is automating sign-off.
- *Context added from Outlook meeting: "Zone - Analysis update" at 7:30 AM on 2026-04-29. The invite was organized by Leslie Gaier Brown, included the same Zone analysis attendees, and listed the VS Basement Lab Cart as the location/resource. Source: Outlook calendar.*

### 2026-04-30
#### Zone Quality Issue Update - 8:00am
- Attendees: Many
- Previous notes: Creation is checking every board record for UART lock gaps; board-record uploads to FTP were planned for Cincinnati review.
- Decisions needed: containment path, owner for teardown/retest evidence, and whether any customer/commercial risk needs escalation.
- We do not think Hackensack is using the Zone devices anymore, except maybe one in the ortho unit.
- Dan spent a lot of time talking about his testing. Follow-up was to consider what we might do to test flash in valve ports.
- *Context added from Outlook meeting: "Zone Quality Issue Update" at 8:00 AM on 2026-04-30. The invite was the daily Zone quality-issue forum and included operations, quality, engineering, and customer-quality attendees including Scott Albers, Adam Clutter, Adam Mullen, Patrick Caplinger, Jessica Fortkamp, Nick Doseck, Daniel Herman, Leslie Gaier Brown, and others. Source: Outlook calendar.*

#### Zone Analysis Check In - 11:00am
- Attendees: Leslie Gaier-Brown, Pat, Patrick, Taylor, Brady, Andrew Carroll, Adam Rohrer, Matt Schulze
- Previous notes: prior next steps were leak retest, controlled teardown, and involving Ana; Creation board-record review remains key.
- Decisions needed: evidence package, owner/date for next containment readout, and whether escalation is needed.
- Missed.
- *Context added from Outlook meeting: "Zone Analysis Check In" at 11:00 AM on 2026-04-30. The invite matched the Zone analysis follow-up series with Leslie Gaier Brown and the analysis/retest group. Source: Outlook calendar.*

### 2026-05-01
#### Zone Quality Issue Update - 8:00am
- Attendees: Many
- Previous notes: Creation is checking UART-lock records, splitting lock/check into pass-fail steps, uploading board records, and automating sign-off.
- Decisions needed: containment path, flash-in-valve-port test plan, line-start risk, and whether customer/commercial escalation is needed.
- *Context added from Outlook meeting: "Zone Quality Issue Update" at 8:00 AM on 2026-05-01. The invite was the continuing daily Zone quality-issue forum with operations, quality, engineering, and customer-quality attendees. Source: Outlook calendar.*

### 2026-05-04
#### Zone Quality Issue Update - 8:00am
- Attendees: Many
- Previous notes: `20` good boards were expected Friday and `48` early this week, with higher leak-test pressure, visual linear-deflation inspection, and small-batch Hackensack rotation planned as the immediate containment path.
- Decisions needed: restart and rotation plan, field-unit disposition, owner for linear-valve checks, and what evidence is sufficient to clear Hackensack/customer risk.
- Versailles will spend this week on worst-case set-screw testing.
  - Turn the set screw in both directions until the device cannot capture `BP`, then back it off slightly for human and simulator testing.
- Dan is completing manifold-flash sensor-port testing this morning to see whether flash can become dislodged during cycle-pressure testing.
- The team is moving to manifold-flash valve testing this week.
- *Context added from Outlook meeting: "Zone Quality Issue Update" at 8:00 AM on 2026-05-04. The invite continued the daily Zone quality-issue forum with operations, quality, engineering, and customer-quality attendees including Scott Albers, Adam Clutter, Patrick Caplinger, Jessica Fortkamp, Pat Reichert, Daniel Herman, and Andrew Carroll. Source: Outlook calendar.*
- *Context added from Teams message in a related Hackensack chat at 8:43 AM on 2026-05-04. Jessica Fortkamp said the Hackensack unit data showed the devices align when the Better BP protocol is followed; the thread clarified the compliant conditions as rest, supported back, feet flat and uncrossed, no talking or movement, and arm supported at heart level on a bare arm, while Pat Reichert listed feet dangling, arm down, no back support, talking, and alternating leg crossing as the in-scope non-compliant conditions. Source: Teams.*

#### Review of Data/Determine Line Start Up - 2:00pm
- Attendees: Scott Albers, Leslie Gaier Brown, Pat Reichert, Taylor Schmitmeyer, Russ Beisner, Brady Post, Jessica Fortkamp, Nick Ross, Andrew Carroll, Patrick Caplinger
- Purpose: decide whether to restart the Zone line with new Creation boards.
- Previous notes: Zone testing next steps were leak retest, controlled teardown, Ana involvement, and review of Creation board records.
- Decisions needed: restart/no-restart, evidence threshold, risk owner, and customer/operations communication.
- Hackensack did some auditing on BP technique and did some re-education. They are now using our cuffs and say devices are working correctly.
- Jessica told Hackensack about an air leak on one unit. We will need to test these units or replace couplers in the field.
- Going back to Zone production:
  - Increase leak-test pressure.
  - Visually inspect linear deflation linearity.
- `20` good NIBP boards by the end of the day, with the total up to `48` early next week.
- Will go through all Hackensack units to check linear valves.
  - Scott suggests doing `10` at a time. Only give `10` new ones initially, and then rotate through.
- *Context added from Outlook meeting: "Review of Data/Determine Line Start Up" at 1:30 PM on 2026-05-01. Scott Albers framed the meeting around reviewing NIBP troubleshooting findings and deciding whether to restart the Zone line with new Creation boards. Source: Outlook calendar.*

### 2026-05-05
#### Zone Quality Issue Update - 8:00am
- Attendees: Many
- Previous notes: worst-case set-screw testing is running this week; manifold-flash sensor-port testing was in flight Monday; Hackensack alignment still depends on Better BP protocol compliance.
- Decisions needed: evidence threshold to reduce customer risk, field-unit check status, and owner/date for the next restart/confidence call.
- Gideon is measuring flash on manifolds onsite and bucketizing as much less than `25%`, `~25%`, or more than `25%` occlusion.
- Brady is testing without the NIBP board using off-the-shelf sensors and pump on the manifold.

### 2026-05-06
#### Zone Quality Issue Update - 8:00am
- Attendees: Many
- Previous meeting: worst-case set-screw testing and manifold-flash work were active this week; Hackensack alignment still depends on Better BP protocol compliance.
- Decisions needed: what evidence is enough to reduce customer risk, whether field checks are on track, and whether restart confidence is real or still fragile.
