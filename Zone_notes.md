# Zone Notes

## Raw Notes Capture Status

- Captured through Raw_Notes: none

### Capture Ledger
- 2026-04-27: captured into Zone notes. Meetings: `Isolation Test for ZONE and UART Alignment - 12:30pm`.
- 2026-04-28: captured into Zone notes. Meetings: `Zone Testing`.
- 2026-04-29: captured into Zone notes. Meetings: `Zone - Analysis update - 7:30am`.
- 2026-04-30: captured into Zone notes. Meetings: `Zone Quality Issue Update - 8:00am`; `Zone Analysis Check In - 11:00am`.
- 2026-05-01: captured into Zone notes. Meetings: `Zone Quality Issue Update - 8:00am`; `Review of Data/Determine Line Start Up - 2:00pm`.

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
