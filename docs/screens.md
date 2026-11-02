# Figma frame → page map

Figma: Rapsap-Designs, section "Rapsap Ops — UI screens" (node 1085:6532). Design size 390×844.
✅ = built. 🔍 = built from saved Figma layout/text after the Figma MCP limit was hit; colours and spacing need a check against Figma.

| Figma frame | Node | Feature / page | Phase |
| --- | --- | --- | --- |
| A2 · Sign in | 1079:667 | auth / LoginPage | 3✅ |
| A3 · No login | 1079:699 | auth / LoginPage (no-login state) | 3✅ |
| A4 · Enter OTP | 1079:728, 1085:6551 | auth / OtpPage | 3✅ |
| A5 · First sign-in | 1079:763, 1085:6662 | auth / FirstSignInPage | 3✅ |
| B1 · Staff home | 1079:805 | home / StaffHomePage | 4✅ |
| B2 · Daily checklist | 1079:938 | checklist / ChecklistPage | 4✅ |
| B3 · Task sheet | 1079:1072 | checklist / TaskPage | ✅ |
| B4 · Camera | 1079:1108 | checklist / CameraPage | ✅ |
| B5 · Photo + submit | 1079:1132 | checklist / TaskPage (photo taken) | ✅ |
| B7 · Sent back | 1079:1193 | checklist / TaskPage (sent back) | ✅ |
| B8 · Missed | 1079:1225 | checklist / TaskPage (missed) | ✅ |
| X3 · Task submitted | 1079:3043 | checklist / SubmittedView | ✅ |
| X4 · Upload interrupted | 1079:3074 | checklist / InterruptedView | ✅ |
| X6 · No pending tasks | 1120:7113 | home / CaughtUpCard | ✅ |
| B9 · Notifications | 1120:6789 | notifications / NotificationsPage | ✅ 🔍 |
| B10 · Chat list | 1120:6874 | chat / ChatListPage | ✅ 🔍 |
| B11 · Group chat | 1120:6953 | chat / ConversationPage | ✅ 🔍 |
| B12 · Side menu | 1120:7007, 1120:7872 | home / SideMenu (end drawer) | ✅ 🔍 |
| B13 · My profile | 1120:7044 | profile / ProfilePage | ✅ 🔍 |
| C1 · SM home | 1120:7196 | review / ManagerHomePage | ✅ 🔍 |
| C2 · Needs review | 1120:7299 | review / ManagerChecklistPage | ✅ 🔍 |
| C3 · Report review | 1120:7399 | review / ReviewDetailPage | ✅ 🔍 |
| C4 · Send back | 1120:7440 | review / SendBackPage | ✅ 🔍 |
| C5 · Edit entry | 1120:7479 | review / EditEntryPage | ✅ 🔍 |
| C6 · Missed task | 1120:7523 | review / ReviewDetailPage (missed) | ✅ 🔍 |
| X5 · Review complete | 1120:7561 | review / result state | ✅ 🔍 |
| C7 · My team | 1120:7612 | team / TeamPage | ✅ 🔍 |
| C8–C10 · New login | 1120:7693, 1120:7732, 1120:7792 | team / CreateLoginFlow | ✅ 🔍 |
| X7 · Invitation delivery failed | 1120:7838 | team / result state | ✅ 🔍 |
| C11 · Staff detail | 1120:7899 | team / StaffDetailPage | ✅ 🔍 |
| C12–C13 · Change / verify number | 1120:7956, 1120:7984 | team / ChangeNumberFlow | ✅ 🔍 |
| C14 · Deactivate, X8 · Reactivate | 1120:8027, 1120:8065 | team / StaffDetailPage actions | ✅ 🔍 |
| C15 · Walkthrough video, X9 | 1124:8952, 1124:8390 | section_reports / WalkthroughPage | ✅ 🔍 |
| C16 · Closing report | 1124:8140 | section_reports / ClosingReportPage | ✅ 🔍 |
| C17 · Section reports | 1124:8189 | section_reports / SectionReportsPage | ✅ 🔍 |
| C18 · Daily summary | 1124:8258 | section_reports / DailySummaryPage | ✅ 🔍 |
| C19 · Report snapshot | 1124:8333 | section_reports / SnapshotPage | ✅ 🔍 |
| X10 · Report returned, X11 · Resubmission | 1124:8405, 1124:8420 | section_reports / result states | ✅ 🔍 |
| C20 · Sales | 1124:9302 | dsr / SalesPage | ✅ 🔍 |
| C21 · DSR check, C22 · DSR error | 1124:9396, 1124:9449 | dsr / DsrUploadPage | ✅ 🔍 |
| C23 · DSR snapshot | 1124:9489 | dsr / DsrSnapshotPage | ✅ 🔍 |
| X12 · DSR required, X13 · Posted to chat | 1124:9537, 1124:9552 | dsr / result states | ✅ 🔍 |

Not in Figma frames (built from the PRD / saved layout): Settings (frame 1120:7127), not-found page. Not built yet: force-update screen, PWA install/update prompts (Phase 7).
