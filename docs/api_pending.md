# API pending

The backend API is not documented yet. Everything below is an assumption the app
is built against. With `USE_FAKE_API=true` in `env/env.json` the app runs on the
fake data sources; set it to `false` to call the real paths. Update this file
(and `ApiConstants`) as each endpoint is confirmed.

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
| Task | `/tasks/{id}` | GET | — | `{ task, section, assigned_to, photo_hint, manager_name, checklist_group, checklist_group_id, send_back?, photo_url?, remarks?, locked_at? }` |
| Task | `/tasks/{id}/capture-token` | POST | — | `{ token, server_time, store_code, store_name, staff_name, task_number }` (stamp uses server time, CK-12) |
| Task | `/tasks/{id}/submit` | POST multipart | `capture_token, remarks, photo (jpeg ≤300 KB, ≤1280 px)` | `{ submitted_at, on_time }`; 400 `message_blocked` for abusive remarks |
| Task | `/tasks/{id}/not-done` | POST | `{ reason }` | `{ submitted_at, on_time }` |
| Notifications | `/notifications` | GET | — | `[{ id, title, subtitle, created_at, read, target_type: task\|conversation, target_id }]` (title/subtitle already localised) |
| Notifications | `/notifications/{id}/read`, `/notifications/read-all` | POST | — | — |
| Chat | `/chat/conversations` | GET | — | `[conversation]` |
| Chat | `/chat/conversations/{id}` | GET | — | `{ id, title, kind: group\|direct\|announcements, member_count, unread, muted, can_post, last_preview?, last_at?, pinned_text? }` |
| Chat | `/chat/conversations/my-manager` | GET | — | the staff member's 1:1 with their SM |
| Chat | `/chat/conversations/{id}/messages` | GET / POST | GET `?limit&before`; POST `{ client_id, text }` | `{ messages: [message], has_more }` / `message`; 400 `message_blocked` `{ reason: abuse\|link\|flood\|sensitive\|muted, muted_until? }` |
| Chat | `/chat/conversations/{id}/photos` | POST multipart | `client_id, photo` | `message` |
| Chat | `/chat/conversations/{id}/mute` | PUT | `{ muted }` | — |
| Chat | `/chat/messages/{id}/report` | POST | — | — |
| Chat | `wss://…/chat/ws` | WebSocket | first frame `{ type: auth, token }` | events `{ type: message, conversation_id, message }` |
| Review (SM) | `/manager/dashboard` | GET | — | `{ date, done, total, to_review, missed, not_done, sections: [{ id, name, status, done, total, missed }], sales?: { month, sales_mtd, target, dsr_due_at } }` |
| Review (SM) | `/review/queue` | GET | — | `[{ task_id, number, title, section, staff_name, staff_role, kind: needs_review\|missed\|not_done\|open_now, at, reason? }]` |
| Review (SM) | `/review/{taskId}` | GET | — | `{ item, photo_url?, remarks?, locked_at?, unlock_minutes }` |
| Review (SM) | `/review/{taskId}/verify`, `/unlock`, `/take-over` | POST | — | — |
| Review (SM) | `/review/{taskId}/send-back` | POST | `{ reason }` | — |
| Review (SM) | `/review/{taskId}/edit` | POST multipart | `capture_token, reason: photo_unclear\|wrong_photo\|remark_missing\|other, remarks, photo` | — |
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
| Reports (SM) | `/section-reports/closing` | GET / POST multipart | POST `task_id, closed_by[], capture_token, photo` | GET `{ task_id, walkthrough_task_id, due_at, early_before, staff: [{ id, name }] }` |
| Reports (SM) | `/section-reports/walkthrough` | POST multipart | `task_id, video` (45 s) | — |
| DSR (SM) | `/dsr/overview` | GET | `?period=1M\|3M\|6M\|1Y` | `{ date, due_at, sales_mtd, target, need_per_day, trend: [{ day, current, previous? }], change_percent, history[], todays_posting? }` |
| DSR (SM) | `/dsr/check` | POST multipart | `file` (.xlsx ≤5 MB) | `{ upload_id, file_name, size, lines: [{ field, value, ok }], warnings[], replaces_existing }`; 400 `dsr_rejected` `{ reason: wrong_store\|unreadable_date\|no_sales\|too_large\|has_macros, detected_store? }` |
| DSR (SM) | `/dsr/uploads/{uploadId}/save` | POST | — | `{ date, store_name, sales, bills, mtd_percent, saved_at, on_time }` |
| DSR (SM) | `/dsr/post` | POST multipart | `date, conversation_ids[], image` | — |
| App | `/app/config` | GET | — | `{ min_version }` |
| App | `/health` | GET/HEAD | — | any response = reachable |

`user` = `{ id, name, role: staff|store_manager|admin, store_name, job_roles: [string], consent_accepted }`.
Section names, task titles, notification texts and DSR warnings are shown as sent, so the server should localise them from `Accept-Language`.

## Fake data sources (`@fakeApi`)

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

## Other assumptions to confirm

- Chat delete-for-everyone, reply and pin are not built yet (no endpoints agreed).
- Walkthrough videos are uploaded as recorded (no compression); 45 s caps the size.
- The snapshot image (section report, DSR) is rendered by the app and uploaded as JPEG.
