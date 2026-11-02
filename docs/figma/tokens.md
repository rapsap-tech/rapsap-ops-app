# Design tokens (from Figma)

Read from the Rapsap-Designs file with the Figma MCP (`get_design_context` / `get_variable_defs`) on 2 Nov 2026.
The code side lives in `lib/core/theme/` — use those names, never raw values.

Figma variables defined in the file: `Schemes/On Primary` = `#FFFFFF`, `Static/Title Medium/Size` = 16, `Static/Title Medium/Line Height` = 24. Everything else below is the raw value used on the frames.

## Colours → `AppColors`

| Use | Hex | `AppColors` |
| --- | --- | --- |
| Brand / primary button / selected chip / logo dot | `#4866EC` | `primary` |
| Active nav label, "due soon" text, links | `#3A5BD9` | `primaryDark` |
| "Due soon" chip background, unread row | `#EEF1FE` | `primaryLight` |
| Text on primary | `#FFFFFF` | `onPrimary` |
| Page background | `#FCFCFC` | `background` |
| Cards, inputs | `#FFFFFF` | `surface` |
| Frame outline / desktop backdrop | `#D8DDEB` | `backdrop` |
| Logo text | `#00030C` | `textTitle` |
| Body text | `#1D1B20` | `textPrimary` |
| Secondary text | `#6B6970` | `textSecondary` |
| Neutral chip text | `#39373C` | `textTertiary` |
| Borders (cards, inputs, toggles) | `#C5CDE7` | `border` |
| Header bottom border | `#F2F2F2` | `divider` |
| Bottom nav top border | `#EDEDED` | `navBorder` |
| Disabled button | `#C6C6C6` | `disabled` |
| Progress track | `#ECE6F0` | `track` |
| Neutral chip ("Later", "Sent to SM") | `#F2F4F8` | `neutralChip` |
| Permission icon tile | `#E4E8F6` | `iconTile` |
| Verified tile border / bg / chip / chip text | `#33B240` / `#F9FFFA` / `#E6F6E8` / `#23862E` | `success` / `successSurface` / `successChip` / `successText` |
| Missed tile border / bg / chip text | `#FF4242` / `#FFEFEF` / `#C62828` | `error` / `errorSurface` / `errorText` |
| Error banner text (A3, A4) | `#8E1F1F` | `errorTextDark` |
| Nav badge | `#D93636` | `badge` |
| Photo hint text / icon | `#9AA6D6` | `hint` |
| Auto-post note text (B5) | `#26346F` | `infoBannerText` |
| X-screens: background / title / body / card border | `#FAFBFE` / `#191C2B` / `#667085` / `#DFE4F0` | `resultBackground` / `resultTitle` / `resultBody` / `resultCardBorder` |
| X-screens: "Action needed" badge bg / text | `#FFF1DB` / `#975E00` | `warningSurface` / `warningText` |
| X-screens: secondary button bg / text | `#F0F3FF` / `#435BF0` | `secondaryButton` / `secondaryButtonText` |
| Camera: background / subtitle / frame guide / switch border | `#00030C` / `#C9CDE0` / white 70% / white 40% | `cameraBackground` / `cameraSubtitle` / `cameraFrame` / `cameraSwitchBorder` |
| Photo stamp background | `rgba(0,3,12,0.65)` | `stampBackground` |
| Photo placeholder gradient | `#D9DDE8` → `#B9C0D4` | `photoPlaceholder` |

Not read from Figma (limit reached) and chosen to match: `bubbleMine`, `pinnedSurface`, `transparentBorder`.

## Typography → `AppTextStyles`

- **DM Sans** (bundled in `assets/fonts`): weights 400, 500, 600, 700, 800. Base 16 / 400 / `textPrimary`.
- **Barlow Condensed SemiBold** for counters ("2 of 9", "2 / 9", "₹64,210") → `AppTextStyles.numeric`.
- **Noto Sans Devanagari** fallback for Marathi/Hindi.
- Figma uses `DM Mono` for the photo stamp; the app stamps with DM Sans (not bundled).

| Text | Size / weight / extra |
| --- | --- |
| Logo "rapsap." large (sign-in) | 44 / 800, tracking −5%, line 44 |
| Logo in header | 28 / 800, tracking −5%, line 28 |
| Page heading ("Operations", "Enter OTP", task title) | 24 / 700, tracking −1%, line 28.8 (task sheet 22 / 700, line 26.4) |
| Card title ("My checklist") | 20 / 700 |
| Home name | 22 / 700, tracking −1% |
| Header date ("19 OCT 2026") | 19 / 700, tracking +1% |
| Body / subtitle | 14 / 400, line 20.3, `textSecondary` |
| Input text | 15 / 400 (+91 box 15 / 600) |
| OTP digit | 22 / 600 |
| Field label | 14 / 600 |
| Button | 16 / 600 (X-screens 16 / 800, tracking −2%) |
| Task tile title | 14 / 600, line 18.9 · time 13 / 700 · subtitle 11 / 400 |
| Chip | 12 / 600 |
| Section header ("OPENING · 7:30–9:00") | 11 / 700, tracking +7%, uppercase |
| Nav label | 12 / 400 (active 12 / 600 `primaryDark`) |
| Small helper text | 13 / 400, line 18.85 |
| X-screen title / body / badge | 30 / 700 · 16 / 400 · 12 / 700 |

## Spacing, radius, sizes → `Dimens`

- Design frame: **390 × 844** (`AppConstants.designSize`).
- Page side padding 16; X-screens 20; section gaps 12–16.
- Radius: toggle 6, input/banner 12, task tile 14, card 16, camera preview 20, pills 999.
- Input height 54 (+91 box 72 wide); OTP box 56 high, 8 gap; primary button 54 high, pill; X-screen buttons 52 high, radius 14.
- Header: padding 20 top / 15 bottom; language toggle 32 high, 42 per segment; menu button 44.
- Bottom nav 73 high; icon 22; badge 16 high.
- Task tile padding 15 × 13, time column 42 wide; chip padding 10 × 4; filter chip 14 × 8.
- Progress bar 10 high; photo box 222 high; photo preview 250 high; camera shutter 78 (inner 60, border 4).

## Components (Figma → code)

| Figma | Code |
| --- | --- |
| Ops / Brand header (logo, store, EN \| अ, menu) | `BrandHeader`, `LanguageToggle`, `BrandLogo` |
| Nav - Main | `AppBottomNavBar` |
| Primary / disabled pill button, outline "Allow" | `AppButton` (`primary`, `outline`, `secondary`, `danger`; `squared` for X-screens) |
| Status chips (Verified, Missed, Sent to SM, Due soon, Later) | `StatusChip` + `StatusTone` |
| Task rows | `TaskTile` / `ChecklistTaskTile` |
| Error banners (A3, A4) | `MessageBanner` |
| X-screens (badge, title, body, detail card, 2 actions) | `ResultView` |
| Filter pills ("All 9", "Needs review 6") | `FilterChipButton` |
