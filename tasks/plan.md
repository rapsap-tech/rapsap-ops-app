# Implementation Plan: Offline proof uploads, API caching, offline PWA shell

## Overview

Three things, on the PWA, Android and iOS:

1. **Camera works offline.** Staff can open the camera and take proof (photo or video) with no internet.
2. **Proof survives no internet.** Proof taken or submitted without a connection is saved on the phone, survives closing or reloading the app, and uploads by itself when internet returns. A pending-uploads screen shows what is waiting, with manual Retry.
3. **API caching.** Screens open instantly with the last data they showed, then refresh from the server.
4. **The PWA opens without internet.** The app shell (code, fonts, icons) is cached by a service worker, so a cold start works offline and shows cached data plus pending uploads.

Every task must work the same on the PWA (Chrome on Android, Safari on iOS 16.4+) and the Android and iOS apps.

This brings forward "offline submit and sync", which PRD v1.4 places in a later phase, and it touches "Phone clock is never trusted" (CK-03). The time rule for offline proof below needs the backend team's agreement (Task 0).

## Decisions (agreed 2026-11-03)

- **Scope:** offline camera + saved proof + auto-retry.
- **Storage:** add `hive_ce` (IndexedDB on web, files on Android/iOS, no native setup). Used for the upload outbox and the API cache.
- **Late uploads:** the server decides whether a proof that arrives after the 2-minute lock is accepted, based on the capture details the app sends. Listed as a backend ask.
- **Pending uploads screen:** built from the X4 (Upload interrupted) and task-list styles; no new Figma frame.
- **CLAUDE.md §5:** reworded to allow retries only from the outbox (done with this plan).
- **Logout with pending uploads:** blocked until each one is sent or deleted.

## Architecture decisions

- **Offline capture.** Online, the camera keeps using the server capture token as today. Offline, the camera opens without a token:
  - The stamp details (store code and name, staff name, task number) come from the last cached task detail and token response.
  - The capture time is the last known server time plus the time elapsed on a monotonic clock since then (a `Stopwatch` in the same app run). It is marked `time_source: server_offset`. If the app was restarted since the last server contact, the phone clock is used and marked `time_source: device`.
  - The proof is saved to the outbox with `captured_offline: true`, `captured_at` and `time_source`. The server decides how much to trust it.
  - The camera itself (getUserMedia on web, the `camera` plugin on Android/iOS) needs no network; it only needs the PWA shell cached (Task 2) and the task detail cached (Task 10).
- **Outbox first, then send.** Submit writes the proof to the outbox *before* the request, and deletes it only after the server confirms. A tab closed mid-upload loses nothing.
- **New feature `features/uploads/`** owns the outbox (data/domain/presentation). Each outbox item has a `kind` (task proof, review edit, closing report, walkthrough), and DI maps each kind to the feature's existing submit use case, so no multipart code is duplicated.
- **Sending one at a time, from one place.** One app-wide `UploadSyncCubit` drains the outbox on app start, when connectivity returns (`ConnectivityCubit`) and on app resume. Network errors stop the drain until the next trigger. Server rejections (4xx such as locked or blocked) mark the item failed with its reason and are never retried automatically.
- **Idempotency.** Each outbox item gets a `client_id` that is sent with the upload, so a retry after a lost response can't create a second submission (the chat endpoint already works this way).
- **Uploads run only while the app is open.** No background upload when the app is closed: that would need extra packages (workmanager, Background Sync), and Background Sync doesn't exist on iOS Safari.
- **Cache = stale-while-revalidate in the data layer.** Repositories read the cached JSON first, then fetch. `LoadCubit` shows cached data at once, then the fresh data. The cache is keyed by user id + path + query and cleared on logout. Auth, capture tokens, POSTs and DSR checks are never cached.
- **PWA shell:** our own `web/sw.js` (versioned cache of the build output), registered in `index.html`. CanvasKit is self-hosted (`--no-web-resources-cdn`) so it is in the cache. `staticwebapp.config.json` keeps `index.html` and `sw.js` no-cache so updates still land.
- **CLAUDE.md §5:** "Never auto-retry uploads" is now "Uploads are retried only from the outbox, when the connection returns, with a `client_id`".

## Task list

### Phase 0: Backend asks (docs only)

- [x] **Task 0: List the backend changes in `docs/api_pending.md`**
  - Accept `client_id` on `/tasks/{id}/submit`, `/review/{taskId}/edit`, `/section-reports/closing` and `/section-reports/walkthrough`; a repeat `client_id` returns the first result.
  - Decide whether a proof arriving after the lock is accepted when its capture token was issued before the lock.
  - State how long a capture token stays valid.
  - Accept offline proof without a capture token, with `captured_offline`, `captured_at` and `time_source` (`server_offset` or `device`), and decide how it is checked (for example, flagged for SM review when `time_source` is `device`).
  - **Acceptance:** the four asks are in the doc, under a new "Offline uploads" heading.
  - **Dependencies:** none. **Scope:** XS.

### Phase 1: Foundation

- [x] **Task 1: Local storage with `hive_ce`**
  - Add the package. Add `LocalDb` in `core/services/storage/`: opened in `bootstrap.dart`, with boxes scoped by user id and wiped on logout (`SessionCubit`). Ask the browser for persistent storage on web.
  - **Acceptance:** a value written survives a reload on web and a restart on Android/iOS; logout clears it; `flutter analyze` is clean.
  - **Verify:** unit test for scoping and clearing; manual check that a value survives a PWA reload.
  - **Files:** `pubspec.yaml`, `core/services/storage/local_db.dart`, `bootstrap.dart`, `core/bloc/session_cubit.dart`, test.
  - **Dependencies:** none. **Scope:** S.

- [x] **Task 2: PWA opens offline**
  - Add `web/sw.js` that caches the build output by version and serves it cache-first; register it in `web/index.html`; self-host CanvasKit; update the CI build command and `staticwebapp.config.json`.
  - **Acceptance:** in Chrome, after one online load, an offline reload shows the app; a new deploy is picked up on the next online open.
  - **Verify:** DevTools Offline reload on the staging build; Lighthouse PWA "works offline".
  - **Files:** `web/sw.js`, `web/index.html`, `web/staticwebapp.config.json`, `.github/workflows/deploy-staging.yml`.
  - **Dependencies:** none (can run in parallel with Task 1). **Scope:** S.

#### Checkpoint A

- [ ] Analyze clean, tests pass, the PWA opens offline. Review with you.

### Phase 2: Proof outbox (checklist)

- [x] **Task 3: Outbox data and domain**
  - `features/uploads/`: `PendingUpload` entity (id, client_id, kind, target id, media bytes and type, capture token, remarks, extra fields, captured_at, status, failure reason, attempts) and a repository on `LocalDb` (add, list, watch, update status, delete).
  - **Acceptance:** add/list/delete round-trip; a 45 s video fits; items survive a restart.
  - **Verify:** repository unit tests.
  - **Dependencies:** 1. **Scope:** M.

- [ ] **Task 4: Checklist proof goes through the outbox**
  - `TaskCubit.submit` saves to the outbox, then sends with the `client_id`. Success removes the item. A network failure leaves it queued and shows X4 "Your photo is saved", which is now true across reloads. Reopening a task that has a queued proof shows that state instead of the camera.
  - **Acceptance:** submit offline, reload, and the proof is still queued; going back online sends it once.
  - **Verify:** `TaskCubit` bloc tests (online, offline, server rejection); manual check in the PWA with DevTools Offline.
  - **Dependencies:** 3, Task 0 (`client_id`; the fake API accepts it in the meantime). **Scope:** M.

- [ ] **Task 5: Automatic sync**
  - App-wide `UploadSyncCubit` drains the outbox one item at a time on start, reconnect and resume; stops on network errors; marks server rejections failed; reports progress.
  - **Acceptance:** two queued proofs go up in order after reconnect; a rejected one shows its reason and is not retried; no duplicate sends when connectivity flaps.
  - **Verify:** bloc tests with a fake connectivity stream.
  - **Dependencies:** 4. **Scope:** M.

- [ ] **Task 6: Pending uploads screen**
  - A list of queued items showing waiting / uploading % / failed + reason, with Retry and Delete (Delete asks to confirm), plus a count badge on staff home. Logout warns when uploads are still pending. All strings in en/mr/hi.
  - Designed from the X4 and task-list styles. Logout is blocked while uploads are pending: it opens this screen and asks to send or delete them first.
  - **Acceptance:** loading, empty, error and offline states; works at 1.3× text and in Marathi/Hindi; 48 px tap targets; logout is blocked while uploads are pending.
  - **Verify:** widget test for the states; manual check in the PWA.
  - **Dependencies:** 5. **Scope:** M.

#### Checkpoint B

- [ ] Proof submitted online, then interrupted, is saved and syncs on the PWA, Android and iOS. Review with you.

### Phase 3: API caching (the offline camera needs it)

- [ ] **Task 9: Cache core**
  - `ApiCache` on `LocalDb` (JSON + saved time, keyed by user + path + query), and `LoadCubit` support for "show cached, then refresh". An offline refresh failure keeps the cached data on screen with the offline banner instead of an error.
  - **Acceptance:** the second open of a screen shows data with no spinner; logout clears the cache.
  - **Verify:** `LoadCubit` and cache unit tests.
  - **Dependencies:** 1. **Scope:** M.

- [ ] **Task 10: Cache the staff screens:** `/checklist/today`, `/tasks/{id}`, `/notifications`, `/me/profile`, `/chat/conversations`. **Dependencies:** 9. **Scope:** M.
- [ ] **Task 11: Cache the store-manager screens:** `/manager/dashboard`, `/review/queue`, `/section-reports/today`, `/dsr/overview`, `/team/members`. **Dependencies:** 9. **Scope:** M.

### Phase 4: Offline camera

- [ ] **Task 12: Trusted time and stamp details**
  - A `ServerClock` in `core/services/` that records server time from every capture-token response (and the `Date` header) together with a monotonic `Stopwatch`, and gives `now()` plus its `time_source`. The stamp details from each token response are cached per task.
  - **Acceptance:** after one online token, `now()` follows server time while offline, even if the phone clock is changed; after a restart it reports `device`.
  - **Verify:** unit tests with a fake clock.
  - **Dependencies:** 1. **Scope:** S.

- [ ] **Task 13: Checklist camera opens offline**
  - `TaskCubit.openCamera` falls back to an offline session (`ServerClock` time + cached stamp details) when there is no internet. Photos are stamped the same way; the proof goes straight to the outbox with `captured_offline`. The task sheet shows "Will upload when online".
  - **Acceptance:** with internet off from the start (PWA cold start and app), staff can open a task, take a photo or video and see it queued; it uploads once online.
  - **Verify:** `TaskCubit` bloc tests; manual check with airplane mode on Android and iOS and DevTools Offline on the PWA (Chrome and iOS Safari).
  - **Dependencies:** 2, 5, 10, 12, Task 0 answer. **Scope:** M.

- [ ] **Task 14: Review edit-entry, offline capture included** (same pattern as Tasks 4 and 13). **Dependencies:** 13, 11. **Scope:** M.
- [ ] **Task 15: Closing report and walkthrough, offline capture included.** **Dependencies:** 13, 11. **Scope:** M.

#### Checkpoint C (done)

- [ ] Cold start offline shows cached screens, the camera works, and proof is queued; going online syncs and refreshes.
- [ ] Analyze clean, tests pass, checked on the PWA (Chrome and iOS Safari), Android and the iOS Simulator.

## Parallel work

Tasks 1 and 2 are independent. After Task 1: the outbox (3 → 4 → 5 → 6), the cache (9 → 10/11) and the clock (12) are independent tracks. The offline camera (13 → 14/15) needs all three.

## Risks

| Risk | Impact | Mitigation |
|---|---|---|
| iOS Safari wipes the site's storage after 7 days without use (not when installed to the Home Screen) | High | Request persistent storage; the install prompt already exists; the pending-uploads screen makes losses visible |
| Videos (~45 s, uncompressed) fill device or browser quota | Med | Check free space before saving; show a clear error; delete each item once sent |
| A retry creates a duplicate submission | High | `client_id` idempotency (Task 0); sync sends one item at a time |
| Server rejects late proofs | Med | Backend decision (Task 0); the item shows the reason instead of failing silently |
| Cached data looks current but is stale (lock times, status) | Med | Always refresh on open; lock and due times still come from the server on submit |
| Shared phone shows the previous user's data | High | Cache and outbox are keyed by user id and cleared on logout; logout warns about pending uploads |
| Old service worker serves a stale app after a deploy | Med | Versioned cache, `index.html` and `sw.js` no-cache, `skipWaiting` on update |
| Offline capture time can be faked by changing the phone clock after a restart | High | `time_source: device` is flagged so the server or SM can check it; `server_offset` ignores the phone clock |
| Offline camera on a task never opened online has no cached stamp details | Med | Cache today's checklist and task details on every online open (Task 10); show "Open this task once online" only if nothing is cached |
| Camera permission prompts behave differently offline in iOS Safari PWA | Med | Check on a real iPhone in Task 13 |

## Open questions

1. **Backend:** will the server accept offline proof without a capture token, and how should `time_source: device` proofs be handled (Task 0)? Task 13 can be built against the fake API, but it can't ship until this is agreed.
