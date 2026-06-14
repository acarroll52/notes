# Cor_1.0 TODOs

## Open TODOs
- [ ] TODO 0036 - Due 2026-05-04 - Update Nellcor Flex Cable Bend Radius ADO ticket. Captured 2026-05-01. Source: electrical / 2026-05-01.
- [ ] TODO 0053 - Due 2026-05-29 - Finalize next step of CAPA. Captured 2026-05-26. Source: direct capture.
- [ ] TODO 0060 - Due 2026-06-05 - Figure out what to do with Maggie. Captured 2026-06-03. Source: business / 2026-06-03.
- [ ] TODO 0064 - Due 2026-06-18 - Setup time to identify what cohort projects we want to tackle. Captured 2026-06-12. Source: quality / 2026-06-12.
- [ ] TODO 0065 - Due 2026-06-30 - Signup team for black belt training. Captured 2026-06-12. Source: quality / 2026-06-12.
## Recurring TODOs

## Milestones
- [ ] MS 0023 - Milestone 2026-05-18 - Begin 1.3.0 regression testing. Captured 2026-04-17. Rescheduled from 2026-05-08 on 2026-05-04.
- [ ] MS 0024 - Milestone 2026-06-15 - Commercial Build start / Commercialization Build #1. Captured 2026-04-21. Source: business / 2026-04-21. Rescheduled from 2026-04-27. Reconfirmed 2026-04-28. Source: business / 2026-04-28. Rescheduled from 2026-06-01 on 2026-05-12.
- [ ] MS 0025 - Milestone 2026-04-27 - NIBP PR Clinical study start. Captured 2026-04-07.
- [x] MS 0026 - Milestone 2026-06-05 - All regression testing complete. Captured 2026-04-06. Source: firmware / 2026-04-06. Rescheduled from 2026-05-08 on 2026-05-04. Rescheduled from 2026-05-22 on 2026-05-26. Completed 2026-06-10.
- [x] MS 0027 - Milestone 2026-05-08 - 1.1.4 Regression testing complete. Captured 2026-04-17. Completed 2026-04-28.
- [x] MS 0028 - Milestone 2026-05-22 - FDA resubmission deadline. Captured 2026-04-01. Completed 2026-05-18; submitted to FDA the week of 2026-05-11.
- [ ] MS 0029 - Milestone 2026-07-01 - Get 6-sigma cohort started with Matt Schulze. Captured 2026-04-06. Source: quality / 2026-04-06.
- [ ] MS 0030 - Milestone 2026-07-15 - Work-to-date for all plugins and all EMRs commercialized for the MI change (commit is 7/31). Captured 2026-04-13. Source: firmware / 2026-04-13.
- [ ] MS 0031 - Milestone 2026-09-04 - Most likely date for Cor 1.0 commercialization. Captured 2026-04-06.
- [ ] MS 0032 - Milestone 2026-09-15 - Work-to commercialization date. Captured 2026-04-02. Source: business / 2026-04-02.
- [ ] MS 0033 - Milestone 2026-09-17 - New commercialization date. Captured 2026-04-01. Source: regulatory / 2026-04-01.

## Open Questions

## Decisions
- [x] We will not patch `NIBP` JTAG for `1.3.0`; for `1.4.0`, patch the application code and create a change request to push a new bootloader to Creation later. Captured 2026-05-28. Source: firmware / 2026-05-28.
- [x] MIP Gate 3 approved. Captured 2026-04-02. Source: business / 2026-04-02.
- [x] Will wait on CB1 for the 1.3.0 firmware release. Captured 2026-04-21. Source: business / 2026-04-21.
- [x] Discoloring is acceptable on the cart if the part is replaceable, specifically the handle. Captured 2026-04-06. Source: manufacturing / 2026-04-06.
- [x] Cor 1 NIBP Pulse Rate pop-ups when a child or small-adult cuff is detected in Linear mode will be informational, not a warning. Captured 2026-04-06. Source: misc / 2026-04-06.
- [x] Will move forward with the Parameters usability study as-is since formative is covering usability of the new NIBP PR pop-up. Captured 2026-04-07. Source: quality / 2026-04-07.
- [x] Focus clinical testing on software validation, not device performance. Captured 2026-04-08. Source: quality / 2026-04-08.
- [x] We want to actually send the warranty device back as opposed to sending an empty box to fully test the process. We'll wait until we're done with regression testing and it is convenient for Cinci. Captured 2026-04-14. Source: firmware / 2026-04-14.

## Actions for Others
- [ ] ACTION 0019 - Dan Herman - Plan for alternate construction EMC testing. Due 2026-05-01. Captured 2026-04-20.
- [ ] ACTION 0049 - Adam Mullen - Procure an additional `1,000` manifolds from Asia Connection and direct them to mimic the yellowish-tint manifolds with flash only in the sensor ports; target no flash, with sensor-port-only flash as the fallback goal. Captured 2026-05-21. Source: manufacturing / 2026-05-21.
- [ ] ACTION 0050 - Adam Mullen - Confirm FI Company has the green light to cut steel on the current `5-200-0114 AA2` tooling design, refresh FI's tooling/sampling timeline, and check whether FI could later support a larger core pin and main-tube OD change if needed. Captured 2026-05-21. Source: manufacturing / 2026-05-21.
- [ ] ACTION 0051 - Dale Albers - Initiate a letter of intent with Decatur for tooling design submission, Midmark review and approval, estimated timeline, and review of proposed tool or part design changes. Captured 2026-05-21. Source: manufacturing / 2026-05-21.
- [ ] ACTION 0052 - Russ Beisner and Brady Post - Update the group on testing to evaluate material/flash in manifold valve ports and any risk or effect on the device. Captured 2026-05-21. Source: manufacturing / 2026-05-21.

## Closed TODOs
- [x] ~~TODO 0057 - Due 2026-06-02 - Figure out what to do with Radouane's cuff size analysis. Captured 2026-06-01. Closed 2026-06-10. Source: manufacturing / 2026-06-01.~~
- [x] ~~OQ 0039 - How do we get good baseline "golden" data to compare to in the future? Captured 2026-05-06. Closed 2026-06-11. Source: misc / 2026-05-06.~~
- [x] ~~ACTION 0047 - Dan Herman - Determine fail threshold at Creation for calibration. Due 2026-05-25. Captured 2026-05-19. Closed 2026-06-11. Source: firmware / 2026-05-19.~~
- [x] ~~TODO 0059 - Due 2026-06-05 - Setup recurring meeting with Casey, Ben, Maggie, Soum, Leslie. Captured 2026-06-03. Closed 2026-06-10. Source: business / 2026-06-03.~~
- [x] ~~TODO 0061 - Due 2026-06-04 - Come up with strategy for Hypercare performance testing. Captured 2026-06-03. Closed 2026-06-05. Source: quality / 2026-06-03.~~
- [x] ~~TODO 0058 - Due 2026-06-05 - Setup quarterly touch base with cyber team. Captured 2026-06-02. Closed 2026-06-03. Source: business / 2026-06-02.~~
- [x] ~~ACTION 0014 - Radouane - Get BHS AA analysis released in Agile. Due 2026-04-13. Captured 2026-04-07. Closed 2026-06-01.~~
- [x] ~~TODO 0040 - Due 2026-05-12 - Check what calibration would be on original 3 Zone BP Validation units. Captured 2026-05-11. Closed 2026-06-01. Source: business / 2026-05-11.~~
- [x] ~~TODO 0002 - Due 2026-04-02 - Update OGSIM 4-blocker. Captured 2026-04-01. Closed 2026-04-02. Source: misc / 2026-04-01.~~
- [x] ~~TODO 0003 - Due 2026-04-10 - Need to review the software version history document to make sure there are not other docs in the estar that need updated to make the package coherent. Captured 2026-04-01. Closed 2026-04-15. Source: regulatory / 2026-04-01.~~
- [x] ~~TODO 0004 - Due 2026-04-07 - Need to get the latest NIBP PR firmware on a unit and to James. Captured 2026-04-06. Closed 2026-04-07. Source: business / 2026-04-06.~~
- [x] ~~TODO 0005 - Due 2026-04-07 - Make sure we have a laptop with IQManager ready for formative. Captured 2026-04-06. Closed 2026-04-07. Source: misc / 2026-04-06.~~
- [x] ~~TODO 0007 - Due 2026-04-10 - Send usability concerns to Parameters. Captured 2026-04-09. Closed 2026-04-15. Source: quality / 2026-04-09.~~
- [x] ~~TODO 0008 - Due 2026-04-10 - Get screener used for summative. Captured 2026-04-09. Closed 2026-04-10. Source: quality / 2026-04-09.~~
- [x] ~~TODO 0009 - Due 2026-04-10 - Get competitive devices to target. Captured 2026-04-09. Closed 2026-04-10. Source: quality / 2026-04-09.~~
- [x] ~~TODO 0012 - Due 2026-04-17 - Get misuse feedback into ADO. Captured 2026-04-10. Closed 2026-04-17. Source: quality / 2026-04-10.~~
- [x] ~~TODO 0018 - Due 2026-04-15 - Ask Radouane for analysis showing where we should move the child cuff threshold. Captured 2026-04-14. Closed 2026-04-21. Source: misc / 2026-04-14.~~
- [x] ~~TODO 0021 - Due 2026-04-21 - Check set screw on old Zone devices. Captured 2026-04-21. Closed 2026-04-27. Source: business / 2026-04-21.~~
- [x] ~~TODO 0011 - Due 2026-04-17 - Order a Pronk device. Captured 2026-04-10. Closed 2026-04-27. Source: misc / 2026-04-10.~~
- [x] ~~TODO 0013 - Due 2026-04-10 - Send 2 scales, cart, 0804 Masimo device, laptop with IQManager, and Nellcor device/sensor. Captured 2026-04-09. Closed 2026-04-27. Source: quality / 2026-04-09.~~
- [x] ~~TODO 0037 - Due 2026-05-08 - Plan for Cor1 baseline data. Captured 2026-05-06. Closed 2026-05-18. Source: direct capture.~~
- [x] ~~TODO 0041 - Due 2026-05-15 - Meet with Creation on calibration. Captured 2026-05-14. Closed 2026-05-22. Source: misc / 2026-05-14.~~
