# API pending

The backend is live on staging (`rapsap-operations-api`, guide:
https://claude.ai/artifact/9WxbPVYavB2FQUMXJtgvtM, Swagger:
https://operations-api-stag.rapsap.com/rapsap-operations/docs). Run against it with
`flutter run --dart-define-from-file=env/staging.json` (`USE_FAKE_API=false`).
`WS_URL` must include the API prefix: `wss://<host>/ops/api/v1`. Health is
`/ops/health`, outside the prefix.

The tables below are the contract the app was built on. Where the real API
differs, the app adapts in the data layer (see "How the app adapts") and the
backend team has the list under "Backend fixes needed".

## Not on the backend yet

With the real API these features are hidden (`EnvConfig.has…` flags) instead
of running on sample data, so nothing a user submits is dropped. Turn a flag
on when its endpoint ships.

| Feature | Missing endpoint | With the real API |
| --- | --- | --- |
| Section reports, closing report, walkthrough, daily summary | all of `/section-reports/*` | Hidden (`hasSectionReports`): no "Section reports" link, section tiles don't open it, deep links go home |
| Notification settings | `/me/notification-settings` | Hidden (`hasNotificationSettings`): Settings shows language and log out only |
| DSR post to chat | `/dsr/post` takes JSON `{ date }` only | `hasDsrChatPost` off: no group picker; the button is "Mark as posted" |
| Force update | `/app/config` | Real path; a 404 means no minimum version. Needed before a store release |
| Profile | `/me/profile` | Built from `/auth/me` (name, job roles, store); employee id, phone, manager and month stats stay hidden |
| Team: resend invite, change number | `/team/members/{id}/resend-invite`, `/number-change`, `/number-change/verify` | Real paths; they return 404 ("not found") until built |

## How the app adapts to the real API

- **Ids:** the API sends numeric ids; `IdConverter` (`core/network/json_converters.dart`) reads any id as a string. Team role and task ids go back as numbers.
- **Nulls:** `store_name`, `subtitle`, `sender_name`, `assigned_to`, `manager_name`, `checklist_group`, `staff_name` and `phone` default to empty; screens hide empty rows.
- **Checklist:** a null `shift` hides the shift label; a section key (`trading`, `back_store`, `hygiene`) is the mid shift. Tasks with no time window are open all day. Section keys are shown through ARB names (`l10n.sectionName`).
- **Media:** a `photo_url` ending in `.mp4`, `.webm` or `.mov` is treated as the video.
- **Chat:** `created_at` is the send time; a message is the user's own when `sender_id` is the signed-in user's id. After the socket closes with 4401 the app refreshes the token before reconnecting; repeated quick closes back off up to 30 s. The socket disconnects on logout and session expiry.
- **Token refresh:** the server revokes the whole session when a refresh token is used twice, so on the PWA the refresh runs under a cross-tab Web Lock (`TabLock`) and a tab that waited uses the token another tab just got.
- **Review:** `/review/{taskId}` lacks staff, kind and time, so the app joins it with the task's `/review/queue` row. Section status `not_started` shows "In progress", `completed` shows "Ready". Review edit sends `remarks` only when filled in.
- **Team:** members list role names; the app matches them to catalog ids.
- **DSR:** trend `day` dates become day numbers; `monthly_target` / `daily_target` lines are shown; history and today's posting have no time or on-time flag, so those are hidden; a missing store name falls back to the signed-in SM's store.
- **Limits:** video uploads are capped at 25 MB (the server's limit).
- **Login:** `/auth/otp/send` answers the same for every number (privacy rule), so the A3 "No login" screen only appears with fake data; an unknown number fails at verify as a wrong OTP.

## Backend fixes needed

Paths are in `rapsap-operations-api/apps/operations-api/src`.

| # | Problem | Where | Effect in the app |
| --- | --- | --- | --- |
| B1 | Review edit can never pass the capture token: tokens are issued per checklist item to the assigned worker, but `/review/{taskId}/edit` checks them against the submission id, and SMs can't get one | `checklist.capture-token.service.ts:57-60`, `worker/worker.service.ts:112-121` | SM edit (C5) fails. Needs an SM capture-token endpoint keyed by submission id |
| B2 | Business 400s have no `code` (task not open, locked, no media, token invalid/used/expired, unlock on a non-missed task, DSR save not checked) | `worker/worker.service.ts:135,138,170`, `checklist.capture-token.service.ts:60-63`, `store-manager/storeManager.service.ts:454-469` | The app can only show a generic error; please add codes such as `task_locked`, `capture_token_expired` |
| B3 | Capture tokens expire after 15 min | `checklist.capture-token.service.ts` | Proof that waited offline longer is refused and the user must retake it |
| B4 | `/tasks/{id}/not-done` drops `client_id` (Zod strips it) | `checklist.schema.ts:117-119`, `worker/worker.controller.ts:42` | Not-done isn't idempotent |
| B5 | `/tasks/{id}` and `/review/{id}` put a video in `photo_url`, `video_url` always null | `worker/worker.service.ts:105-106`, `store-manager/storeManager.service.ts:417` | App guesses by file extension |
| B6 | `checklist_group_id` is the store id, not the chat id; `manager_name` holds the store name | `worker/worker.service.ts:102-104` | "View chat" opens the chat list instead of the group |
| B7 | Notification `target_id` for tasks is a submission id for verified/sent back/edited and an item id for due/missed | `notifications.triggers.ts:40-87`, `notifications.scheduler.ts:52,68` | Some task notifications open the wrong task or "not found" |
| B8 | `can_post` isn't enforced when posting | `chat/chat.service.ts:173-216` | Anyone can post in Rapsap Announcements through the API |
| B9 | `/chat/messages/{id}/report` doesn't check the message or membership | `chat/chat.controller.ts:64-67` | Reports can target any id |
| B10 | Wrong file type returns 500 instead of 400 (multer fileFilter throws a plain Error) | `checklist/checklist.upload.ts`, `chat/chat.upload.ts:11`, `dsr/dsr.upload.ts` | Shown as a server error |
| B11 | Media is uploaded to blob storage before validation; a rejected request leaves orphan blobs | `worker/worker.controller.ts:27`, `store-manager/storeManager.controller.ts:121-126` | Storage cost, stray personal photos |
| B12 | Upload limit 25 MB; the doc says 45 s video. 45 s at high resolution can exceed 25 MB | `checklist/checklist.upload.ts:5`, `chat/chat.upload.ts:4` | Long clips are refused; please allow 50 MB |
| B13 | Video duration error message says "15 seconds" (limit is 45) | `checklist/checklist.media.ts:13,24` | Wrong text if ever shown |
| B14 | `/review/{taskId}` returns no staff, kind or time; `locked_at` null; `unlock_minutes` hard-coded | `store-manager/storeManager.service.ts:409-423` | App joins with the queue; tasks no longer queued show no staff name |
| B15 | Dashboard section status uses `not_started/in_progress/completed/critical`; section `missed` is 0/1, not a count; no `sales` block; section names are raw keys | `store-manager/storeManager.service.ts:334-349` | "Critical · 1 missed" can undercount; no sales card on the dashboard |
| B16 | `/team/members` returns role names, not `{ id, name }`; no `since`; `sms_sent` is always true and no SMS is sent | `team/team.service.ts:66,94-101` | App matches names to the catalog |
| B17 | DSR: `store_name` always null on save; `wrong_store` is never detected; any non-xlsx file returns `too_large`; `on_time` uses server-local time, not IST; `change_percent` always 0; no `previous` trend; history has no posted time | `dsr/dsr.service.ts:38,152,182-197` | Shown as described under "How the app adapts" |
| B18 | Unregistered numbers always get `attempts_left: 4` and never lock or rate-limit, which reveals that the number has no account | `auth/auth.otp.service.ts:102-107` | Account enumeration, despite the generic `otp/send` |
| B19 | Logout ignores `all_devices` and always signs out every device | `auth/auth.controller.ts:36-41` | "Log out this device" also ends other sessions |
| B20 | Opening a conversation's messages (even older pages) marks it all read | `chat/chat.controller.ts:28` | Unread counts clear early |
| B21 | No WebSocket ping; idle sockets may be dropped silently by the proxy | `core/ws/chat.gateway.ts` | Live chat can stall until the app reconnects |
| B22 | Offline proof fields `captured_offline`, `captured_at`, `time_source` are stripped | `checklist.schema.ts` (`submitTaskSchema`) | Needed before offline capture ships |

## Global assumptions

| Item | Assumed value | Where |
| --- | --- | --- |
| Base URL / WebSocket URL | `BASE_URL`, `WS_URL` in `env/env.json` | `core/config/env_config.dart` |
| Path prefix | `/ops/api/v1` | `ApiConstants._prefix` |
| Response envelope | `{ "success": bool, "data": any, "message": string? }` | `core/network/api_response.dart` |
| Error body | `{ "success": false, "code": string?, "data": object?, "errors": { "<field>": "msg" \| ["msg"] }? }` | `core/error/error_mapper.dart` |
| Validation errors | HTTP 400/422 with `errors` | `ErrorMapper` |
| Force update | HTTP 426 on any call | `ForceUpdateInterceptor` |
| Rate limit | HTTP 429 | `TooManyRequestsFailure` |
| Auth header | `Authorization: Bearer <access_token>` | `AuthInterceptor` |
| Dates | ISO-8601 with offset; shown in store time (IST) | `core/extensions/date_ext.dart` |
| JSON keys | snake_case | `build.yaml` |

## Endpoints

All paths are under `/ops/api/v1`. Bodies use snake_case. "multipart" = `FormData`.

| Area | Endpoint | Method | Request | Response `data` / errors |
| --- | --- | --- | --- | --- |
| Auth | `/auth/otp/send` | POST | `{ phone }` | `{ resend_after_seconds, valid_minutes }`; 404 no login, 429 too many OTPs |
| Auth | `/auth/otp/verify` | POST | `{ phone, otp }` | `{ access_token, refresh_token, user }`; 400 `otp_invalid` `{ attempts_left }`, 423 `otp_locked` `{ locked_minutes }` |
| Auth | `/auth/refresh` | POST | `{ refresh_token }` | `{ access_token, refresh_token }` |
| Auth | `/auth/me` | GET | — | `user` |
| Auth | `/auth/consent` | POST | — | — |
| Auth | `/auth/logout` | POST | `{ all_devices }` | — |
| Me | `/me/profile` | GET | — | `{ name, tags[], employee_id, phone, store_name, reports_to, on_time_percent, done_this_month, missed_this_month, emergency_contact? }` |
| Me | `/me/notification-settings` | GET / PUT | `{ chat_messages, announcements }` | same |
| Checklist | `/checklist/today` | GET | — | `{ date, shift, sections: [{ name, opens_at, closes_at?, tasks: [task] }] }` |
| Task | `/tasks/{id}` | GET | — | `{ task, section, assigned_to, photo_hint, manager_name, checklist_group, checklist_group_id, send_back?, photo_url?, video_url?, remarks?, locked_at? }` |
| Task | `/tasks/{id}/capture-token` | POST | — | `{ token, server_time, store_code, store_name, staff_name, task_number }` (stamp uses server time, CK-12) |
| Task | `/tasks/{id}/submit` | POST multipart | `capture_token, remarks`, and `photo` (jpeg ≤300 KB, ≤1280 px) or `video` (≤45 s, as recorded) | `{ submitted_at, on_time }`; 400 `message_blocked` for abusive remarks |
| Task | `/tasks/{id}/not-done` | POST | `{ reason }` | `{ submitted_at, on_time }` |
| Notifications | `/notifications` | GET | — | `[{ id, title, subtitle, created_at, read, target_type: task\|conversation, target_id }]` (title/subtitle already localised) |
| Notifications | `/notifications/{id}/read`, `/notifications/read-all` | POST | — | — |
| Chat | `/chat/conversations` | GET | — | `[conversation]` |
| Chat | `/chat/conversations/{id}` | GET | — | `{ id, title, kind: group\|direct\|announcements, member_count, unread, muted, can_post, last_preview?, last_at?, pinned_text? }` |
| Chat | `/chat/conversations/my-manager` | GET | — | the staff member's 1:1 with their SM |
| Chat | `/chat/conversations/{id}/messages` | GET / POST | GET `?limit&before`; POST `{ client_id, text }` | `{ messages: [message], has_more }` / `message`; 400 `message_blocked` `{ reason: abuse\|link\|flood\|sensitive\|muted, muted_until? }` |
| Chat | `/chat/conversations/{id}/photos` | POST multipart | `client_id`, and `photo` or `video` (≤45 s) | `message` |
| Chat | `/chat/conversations/{id}/mute` | PUT | `{ muted }` | — |
| Chat | `/chat/messages/{id}/report` | POST | — | — |
| Chat | `wss://…/chat/ws` | WebSocket | first frame `{ type: auth, token }` | events `{ type: message, conversation_id, message }` |
| Review (SM) | `/manager/dashboard` | GET | — | `{ date, done, total, to_review, missed, not_done, sections: [{ id, name, status, done, total, missed }], sales?: { month, sales_mtd, target, dsr_due_at } }` |
| Review (SM) | `/review/queue` | GET | — | `[{ task_id, number, title, section, staff_name, staff_role, kind: needs_review\|missed\|not_done\|open_now, at, reason? }]` |
| Review (SM) | `/review/{taskId}` | GET | — | `{ item, photo_url?, video_url?, remarks?, locked_at?, unlock_minutes }` |
| Review (SM) | `/review/{taskId}/verify`, `/unlock`, `/take-over` | POST | — | — |
| Review (SM) | `/review/{taskId}/send-back` | POST | `{ reason }` | — |
| Review (SM) | `/review/{taskId}/edit` | POST multipart | `capture_token, reason: photo_unclear\|wrong_photo\|remark_missing\|other, remarks`, and `photo` or `video` (≤45 s) | — |
| Team (SM) | `/team/members` | GET / POST | POST `{ phone, name, role_ids[], extra_task_ids[] }` | `[member]` / `{ id, sms_sent }`; 400 `errors.phone` = number already has a login |
| Team (SM) | `/team/members/{id}` | GET | — | `{ id, name, status: active\|invited\|deactivated, phone, roles[], since? }` |
| Team (SM) | `/team/catalog` | GET | — | `{ roles: [{ id, name }], tasks: [{ id, number, title, role_ids[] }] }` |
| Team (SM) | `/team/members/{id}/resend-invite` | POST | — | — |
| Team (SM) | `/team/members/{id}/roles` | PUT | `{ role_ids[] }` | — |
| Team (SM) | `/team/members/{id}/number-change` | POST | `{ phone }` | `{ resend_after_seconds, valid_minutes }` |
| Team (SM) | `/team/members/{id}/number-change/verify` | POST | `{ phone, otp }` | —; 400 `otp_invalid` |
| Team (SM) | `/team/members/{id}/active` | PUT | `{ active }` | — |
| Reports (SM) | `/section-reports/today` | GET | — | `[{ id, section, status: not_ready\|ready\|submitted\|approved\|returned, opens_at, closes_at, done, total, not_done, photos, to_verify, revision, includes_daily_summary, status_at?, return_note? }]` |
| Reports (SM) | `/section-reports/{id}/submit` | POST | `{ note }` | — |
| Reports (SM) | `/section-reports/{id}/snapshot` | GET | — | `{ report_id, title, store_name, date, opens_at, closes_at, done, total, lines[], photo_urls[], targets: [{ conversation_id, name }], sent_at? }` |
| Reports (SM) | `/section-reports/{id}/snapshot/post` | POST multipart | `conversation_ids[], image` | — (the app renders the snapshot image, SM-32) |
| Reports (SM) | `/section-reports/daily-summary` | GET / POST | POST `{ margin_percent, complaints, damages, shrinkage, manpower_present, key_issues }` | GET `{ staff_total, sales?, bills? }` (null sales = DSR missing, X12) |
| Reports (SM) | `/section-reports/closing` | GET / POST multipart | POST `task_id, closed_by[], capture_token`, and `photo` or `video` (≤45 s) | GET `{ task_id, walkthrough_task_id, due_at, early_before, staff: [{ id, name }] }` |
| Reports (SM) | `/section-reports/walkthrough` | POST multipart | `task_id, video` (45 s) | — |
| DSR (SM) | `/dsr/overview` | GET | `?period=1M\|3M\|6M\|1Y` | `{ date, due_at, sales_mtd, target, need_per_day, trend: [{ day, current, previous? }], change_percent, history[], todays_posting? }` |
| DSR (SM) | `/dsr/check` | POST multipart | `file` (.xlsx ≤5 MB) | `{ upload_id, file_name, size, lines: [{ field, value, ok }], warnings[], replaces_existing }`; 400 `dsr_rejected` `{ reason: wrong_store\|unreadable_date\|no_sales\|too_large\|has_macros, detected_store? }` |
| DSR (SM) | `/dsr/uploads/{uploadId}/save` | POST | — | `{ date, store_name, sales, bills, mtd_percent, saved_at, on_time }` |
| DSR (SM) | `/dsr/post` | POST multipart | `date, conversation_ids[], image` | — |
| App | `/app/config` | GET | — | `{ min_version }` |
| App | `/health` | GET/HEAD | — | any response = reachable |

`user` = `{ id, name, role: staff|store_manager|admin, store_name, job_roles: [string], consent_accepted }`.
Section names, task titles, notification texts and DSR warnings are shown as sent, so the server should localise them from `Accept-Language`.

## Fake data sources (`@fakeApi`, used with `USE_FAKE_API=true`)

| Fake | Behaviour |
| --- | --- |
| `FakeAuthRemoteDataSource` | Numbers starting `91` have no login; `99…` signs in as the store manager (Rahul), anything else as staff (Priya). OTP `000000` is wrong; 5 wrong tries lock the number. The fake token remembers the role across reloads, and a reload counts first sign-in as done. |
| `FakeChecklistRemoteDataSource` | A sample day built around the first "now" (verified, sent back, missed, submitted, one task due in 12 min, later tasks, #46/#47 closing tasks). Submissions and SM actions change it until the page reloads. |
| `FakeReviewRemoteDataSource` | Reads and changes the fake checklist day: verify, send back (reopens 30 min), unlock, take over. |
| `FakeTeamRemoteDataSource` | Five sample staff. Numbers starting `987654` already have a login; a name containing `nosms` simulates an SMS failure (X7); OTP `000000` is wrong when changing a number. |
| `FakeReportRemoteDataSource` | Section reports from the fake day (Hygiene approved, Trading returned). The daily summary shows X12 until the fake DSR is saved. |
| `FakeDsrRemoteDataSource` | Pretends to read the Excel: file name containing `rio` = another store's DSR, `macro` = has macros; saving unlocks the daily summary. |
| `FakeChatRemoteDataSource` | Four chats; blocks links, OTP/password-like text and a few abusive words; 3 blocks mute for 24 h. |
| `FakeChatSocketService` | No live events. |
| `FakeNotificationRemoteDataSource`, `FakeProfileRemoteDataSource`, `FakeSettingsRemoteDataSource`, `FakeAppConfigSource` | Static sample data. |
| `DeviceNetworkInfo` | Checks only the device network (there is no server to ping). |

## Offline uploads (backend changes needed)

The app is getting offline proof capture and an upload outbox that retries when the connection returns (plan: `tasks/plan.md`). The server needs to:

- **Ignore duplicate uploads.** Accept a `client_id` field on `/tasks/{id}/submit`, `/review/{taskId}/edit`, `/section-reports/closing` and `/section-reports/walkthrough`. A repeat `client_id` returns the first result instead of creating a second submission (as chat messages already do).
- **Decide on proof that arrives after the lock.** A proof taken before the 2-minute lock may reach the server later. Accept it when its capture token (or offline capture time) is before the lock, or reject it as missed.
- **State how long a capture token stays valid**, so the app knows whether a saved proof can still use it.
- **Accept proof captured offline**, sent without `capture_token` and with `captured_offline=true`, `captured_at` (ISO 8601) and `time_source`:
  - `server_offset`: last server time plus the time elapsed on a monotonic clock; the phone clock was not used.
  - `device`: the phone clock, used only after an app restart while offline. It can be wrong or changed, so the server should flag these proofs for SM review.

## Security (backend changes needed)

From the security audit (2026-11-03). The app can't enforce these; the server must:

- **Capture tokens:** make them single-use, short-lived, and tied to the task and user, and record the server's own receive time. The drawn photo stamp is client-made, so treat it as display only.
- **Walkthrough:** the app now gets a token from `/tasks/{walkthrough_task_id}/capture-token` when recording starts, and sends `capture_token` with `/section-reports/walkthrough`. Validate it the same way as task proof.
- **Uploads:** check the content type (`image/jpeg`, `video/mp4`, `video/webm`), size (photo ≤300 KB; video ≤50 MB, the app's cap) and duration (≤45 s). Strip metadata on the server too.
- **Refresh:** reject an invalid or expired refresh token with 400, 401 or 403. The app signs the user out only on those; any other error keeps the session. Rotate refresh tokens on use, detect reuse, and keep lifetimes short (on web they live in browser storage). Logout must revoke the refresh token.
- **OTP and login:** rate-limit `/auth/otp/send` and `/auth/otp/verify` per number and per IP, and enforce the 5-try lock. The A3 "No login" screen shows whether a number has an account (kept by product decision), so rate limits are what stop number scanning.
- **Roles:** check the store-manager role on every `/review`, `/team`, `/section-reports` and `/dsr` endpoint. The app's route guards are only for UX.
- **Ids:** the app sends only ids matching `^[A-Za-z0-9_-]{1,64}$` and rejects anything else as not found. Keep server ids within that shape.
- **Media links:** serve `photo_url` / `video_url` as signed, expiring links. The app loads them without an auth header.

## Other assumptions to confirm

- Chat delete-for-everyone, reply and pin are not built yet (no endpoints agreed).
- Walkthrough and proof videos are uploaded as recorded (no compression); 45 s caps the size. Web records WebM or MP4 depending on the browser; the file name keeps the recorded extension.
- Proof videos have no burnt-in stamp (photos do); the `capture_token` is still sent so the server knows the capture time.
- A chat message with a clip comes back with `video_url` instead of `photo_url`.
- The snapshot image (section report, DSR) is rendered by the app and uploaded as JPEG.
