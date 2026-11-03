# Security Audit Prompt

Paste this into Claude Code to audit the app. Save a copy as `docs/security-audit-prompt.md`.

---

Run a security audit of this Flutter app (PWA first, then Android and iOS). Follow the project rules, especially section 13 (Security). This is a review only: do not change any code until I approve the fixes.

## How to work

- Query `graphify-out/` first if it exists. Otherwise read only the files each check needs, using the folder structure in the rules. Don't scan the whole project repeatedly and don't read generated files.
- Use the `security-review` command and `security-and-hardening` skill. For auth, session and proof-photo uploads, also apply `doubt-driven-development`.
- Keep it simple. Report real, specific problems, not generic advice.

## What to check

1. **Secrets in the repo**: API secrets, tokens, passwords, keystores, service-account files, real env files, hardcoded URLs with credentials. Check `env/`, `.gitignore`, `android/`, `ios/`, `web/`, `pubspec.yaml`, assets and git history of those files if possible.
2. **Token and session handling**: where tokens are stored on mobile and on web, token lifetime and refresh logic, logout cleanup (storage, memory, caches, in-flight requests), session expiry behaviour.
3. **Network layer**: `DioClient` and interceptors. HTTPS only, no certificate bypass, token sent only to our API host, 401 refresh runs once, retries only for idempotent GETs, uploads never auto-retried.
4. **Auth and OTP flow**: resend timer, attempt limits, generic error messages, no account enumeration, no OTP or phone number in logs, storage or analytics.
5. **Logging and crash reporting**: anything sensitive in `logger`, `pretty_dio_logger` (dev only, Authorization redacted), Bloc observer, or Sentry (`sendDefaultPii` off, scrubbing in place). Confirm logging is off in release.
6. **Input and link handling**: route and deep-link parameters validated, external links limited to `https` and allowed domains, no untrusted HTML rendered, form validation from `validators.dart`.
7. **Uploads and media**: file type and size checks, compression, metadata and location handling, camera and storage permission flow.
8. **Platform config**:
   - Android: `AndroidManifest.xml` (allowBackup, cleartext, exported components, permissions), release signing, obfuscation flags.
   - iOS: `Info.plist` (ATS, permission strings), entitlements.
   - Web: `web/index.html`, `manifest.json`, service worker caching rules, and the hosting config for CSP, HSTS, `X-Content-Type-Options`, `frame-ancestors`.
9. **Dependencies**: packages outside the approved list, outdated packages, advisories reported by `dart pub get` and `flutter pub outdated`.
10. **Architecture leaks**: presentation calling data sources or Dio directly, raw DTOs or exception text reaching the UI, `dart:io` or `dart:html` outside `core/services/`, empty catch blocks that hide failures.
11. **Push notifications**: sensitive data in payloads, token registration and removal on logout.

## Report format

Give a short summary first: overall risk level and the top 3 issues.

Then list every finding in a table:

| # | Severity | Area | File and line | Problem | Fix |
|---|----------|------|---------------|---------|-----|

Severity levels:
- **Critical**: exposed secret, account takeover, data leak, or auth bypass. Fix before release.
- **High**: serious weakness that is easy to exploit.
- **Medium**: real weakness that needs some effort to exploit or limited impact.
- **Low**: hardening, best practice, or cleanup.

After the table:
- List what is already done well, in one short list.
- List anything you could not check (for example server or hosting config you can't see) and what I should verify myself.

## Update CLAUDE.md (merge, never overwrite)

My CLAUDE.md already has my own edits, so do not replace or rewrite it. After the report, update it like this:

1. Read the current CLAUDE.md first.
2. Compare it with the baseline security rules in the appendix at the end of this prompt, and with any new rule your findings show we need (for example, a mistake that keeps repeating in the code).
3. List only the rules that are missing or weaker than the baseline, and show me each one as an exact addition: which section it goes in, and the line to add.
4. Wait for my approval, then apply the additions with small edits (insert lines or add a new section). Never rewrite the file, and never remove, reword, reorder or renumber anything that is already there.
5. If a security rule already exists in my own words, keep mine and skip the baseline version. If one of my rules conflicts with the baseline, tell me and ask before changing anything.
6. If there is no security section yet, add one as a new section at the end of the numbered rules, without changing the numbers of existing sections. Add a single security line to the "Before Finishing a Task" checklist if it is missing.
7. After editing, tell me exactly which lines were added and where.

## After the report

Ask which findings I want fixed. Fix only those, following the project rules (simple code, no TODOs, no comments, constants and ARB strings, `flutter analyze` with zero issues). Run `ponytail-review` on the diff, then briefly list the files changed. Don't commit, push or open a pull request.

---

## Appendix: Baseline security rules (for the CLAUDE.md merge)

Use these only as the reference list when merging. Add what is missing, keep my existing wording where a rule already exists.

**Secrets and data**
- No secrets in the client. Only public client keys (e.g. Firebase config, Sentry DSN) may ship in the app. Never put API secrets, service-account files, signing keys or passwords in source, assets or `env/env.json`.
- Store tokens only through the storage service in `core/services/`, using `flutter_secure_storage` on mobile. On web, browser storage can be read by any script on the page, so keep access tokens short-lived, hold them in memory where possible, and store only what the app needs to restore a session.
- Store the minimum personal data on the device. Don't cache OTPs, passwords or full phone numbers.
- Logout and session expiry clear all secure storage, shared preferences, in-memory session state and cached user data, and cancel in-flight requests.

**Network**
- HTTPS only. No `http://` URLs, no cleartext traffic, and never bypass certificate checks (no `badCertificateCallback` returning true).
- Never send tokens to any host other than our own API. The auth interceptor attaches the token only to `ApiConstants` base URL requests.
- The server validates everything. Client validation is for user experience only; never rely on hidden buttons, route guards or client checks for access control.
- Treat all API responses as untrusted: null checks, type checks, and no rendering of server HTML.

**Auth and OTP**
- OTP screens respect the resend timer and attempt limits from `app_constants.dart`, and show a generic failure message that doesn't reveal whether an account exists.
- Token refresh on 401 runs once, queued; if refresh fails, log the user out cleanly.
- Never log tokens, OTPs, phone numbers, addresses or personal data. Logging is off in release builds; `pretty_dio_logger` is dev only and must redact the `Authorization` header.

**Inputs, links and uploads**
- Route and deep-link parameters are untrusted: validate ids (format, length) before use.
- Open external links only if they are `https` and on an allowed domain, using the approved launch mechanism.
- Uploads: check file type and size against `app_constants.dart` before sending, compress images, and don't upload location or device metadata unless the feature needs it.
- Push notification payloads carry no sensitive data; the app fetches details after opening.

**Platform hardening**
- Android: `android:allowBackup="false"`, no cleartext traffic, no unneeded exported components, and only the permissions actually used. Release builds use `--obfuscate --split-debug-info`.
- iOS: App Transport Security stays enabled, and `Info.plist` has only the permission strings for features in use.
- Web/PWA: the host sends a strict Content-Security-Policy, HSTS, `X-Content-Type-Options: nosniff` and a `frame-ancestors` restriction. The service worker never caches authenticated API responses or personal data.
- Request permissions (camera, notifications, storage) only at the moment of use, and handle denial without crashing.

**Dependencies and crash reporting**
- Only approved packages. Act on any security advisory that `dart pub get` or `flutter pub outdated` reports, and keep packages updated within the SDK constraints.
- Sentry runs with `sendDefaultPii` off and scrubs tokens, phone numbers and request bodies before sending. Users never see stack traces or raw exception text.

**Security review**
- For any change to login, OTP, tokens, sessions, uploads or stored user data, run `security-review` and fix what it finds before reporting done.
- For a full app check, use the prompt in `docs/security-audit-prompt.md`.

**Checklist line for "Before Finishing a Task"**
- Confirm the Security rules are met: no secrets, tokens or personal data in code or logs, HTTPS only, inputs validated.
