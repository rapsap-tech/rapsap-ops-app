# Flutter Project Rules

Follow these rules for every task in this project. If a rule conflicts with a direct instruction from me, ask before proceeding.

The app ships first as a PWA (Flutter Web), then as Android and iOS apps from the same code. Every feature and fix must work on all three: the PWA (Chrome on Android, Safari on iOS) and the Android and iOS apps. Never build something that works on only one of them; if a platform truly can't support it, stop and ask me.

## 1. Architecture (Clean Architecture, feature-first)

Always follow this folder structure. Never put files outside it.

```
lib/
├── main.dart                  # calls bootstrap() (no flavors; env from env/env.json)
├── bootstrap.dart             # env, DI, error zones, crash reporting, Bloc observer
├── app.dart                   # MaterialApp.router, ScreenUtilInit, theme, l10n, root BlocProviders
├── core/
│   ├── config/                # env_config.dart
│   ├── constants/             # api_constants.dart, app_constants.dart, storage_keys.dart
│   ├── di/                    # injection.dart (get_it + injectable), injection.config.dart (generated)
│   ├── error/                 # failures.dart, exceptions.dart, error_mapper.dart
│   ├── network/               # dio_client.dart, api_response.dart, network_info.dart, interceptors/
│   ├── router/                # app_router.dart, route_paths.dart, route_names.dart, guards/
│   ├── theme/                 # app_colors.dart, app_text_styles.dart, dimens.dart, app_theme.dart
│   ├── l10n/arb/              # app_en.arb, app_mr.arb, app_hi.arb
│   ├── services/              # connectivity, storage, media, push, socket, app_update
│   ├── extensions/            # context, string, date, num extensions
│   ├── utils/                 # validators, formatters, debouncer, logger
│   ├── bloc/                  # app-wide blocs/cubits: session, connectivity, locale
│   └── widgets/               # reusable widgets shared across features
└── features/
    └── <feature_name>/
        ├── data/
        │   ├── datasources/   # remote & local data sources
        │   ├── models/        # DTOs (freezed + json_serializable) with toEntity()
        │   └── repositories/  # repository implementations
        ├── domain/
        │   ├── entities/      # plain business objects
        │   ├── repositories/  # abstract repository contracts
        │   └── usecases/      # one use case per action
        └── presentation/
            ├── bloc/          # blocs / cubits for this feature
            ├── pages/         # full screens
            └── widgets/       # widgets used only by this feature
```

- Data flow: Widget → Bloc/Cubit → UseCase → Repository (domain) → RepositoryImpl (data) → DataSource → DioClient.
- Domain layer must not import from data or presentation, and must not depend on Flutter, Dio or JSON packages. fpdart (Either) and equatable are the only allowed exceptions.
- Presentation talks only to use cases, never directly to data sources or the API client.
- Models map to entities; never pass raw JSON or DTOs to the UI.
- When creating a new feature, create the full data/domain/presentation structure for it.
- Platform-specific code (camera, push, storage, file download, install prompt) lives only behind a service interface in `core/services/`, with web and mobile implementations picked by conditional imports. Never import `dart:io` or `dart:html` in features or shared code.

## 2. Constants (No Hardcoded Values)

Never hardcode values inside widgets or logic. Use these files:

- `core/l10n/arb/app_*.arb` → all user-facing text, including labels and error messages, in English, Marathi and Hindi. Access with `context.l10n.key`. Add the key to all three files at once.
- `core/constants/api_constants.dart` → base URL getter and all endpoints, grouped as `ApiConstants.<group>.<endpoint>`. Groups hold paths only; pass query parameters to Dio as a `queryParameters` map, never build `?a=b&c=d` strings by hand.
- `core/constants/app_constants.dart` → non-translatable values: OTP length, resend seconds, page size, upload limits, durations, date formats, regexes.
- `core/constants/storage_keys.dart` → every shared-preferences and secure-storage key.
- `core/theme/app_colors.dart` → all colour codes, named after the Figma variables.
- `core/theme/app_text_styles.dart` → `AppTextStyles.base` plus the weight / size / spacing / colour / decoration extensions.
- `core/theme/dimens.dart` → spacing, padding, radius, icon and component sizes.
- `core/router/route_names.dart` and `route_paths.dart` → every route.
- Assets → the generated `Assets` class from flutter_gen; never raw asset path strings.

If a constant doesn't exist yet, add it to the correct file first, then use it.

## 3. Code Quality

- Keep everything simple. Don't make things complicated or clever. Pick the simplest approach that fully solves the task.
- Write logic that is easy to read and understand at a glance. Use clear names, small functions that do one job, straightforward conditions and early returns. Avoid deep nesting, chained one-liners and tricks that need explaining.
- Don't over-engineer. No unnecessary abstractions, patterns, or helper classes.
- Don't repeat code. If something is used in 2+ places, extract it into a reusable widget (`core/widgets/`) or util.
- Keep widgets small. Split any build method longer than ~80 lines into separate widget classes (not helper methods that return widgets).
- Use `const` constructors wherever possible.
- Use full null safety; avoid `!` unless the value is guaranteed non-null.
- Prefer `final` over `var`. Always declare explicit types for public APIs.
- Follow official Dart naming: snake_case for files, PascalCase for classes, camelCase for variables and methods.
- Remove unused imports, variables, and dead code.
- Never use deprecated APIs, widgets, or package methods. Always use the current replacement (e.g. `withValues()` instead of `withOpacity()`, `PopScope` instead of `WillPopScope`, `WidgetStateProperty` instead of `MaterialStateProperty`, `package:web` instead of `dart:html`). If unsure whether something is deprecated, check the Flutter SDK version in `pubspec.yaml` and use the latest API for it.
- Never edit generated files (`*.g.dart`, `*.freezed.dart`, `*.config.dart`, l10n output, `assets.gen.dart`). Change the source and run code generation.
- Code must pass `flutter analyze` with zero issues (very_good_analysis) and be formatted with `dart format`.

## 4. State Management & Dependencies

- State management is flutter_bloc. Use Cubit for simple screens and Bloc when events need transformers (debounced search, pagination, chat). Never introduce a different solution.
- One bloc/cubit per screen or independent section. No business logic, API calls or `setState` for business state inside widgets.
- Pick one state style (sealed/freezed union or a single state class with a status enum) and use it everywhere.
- Use `BlocSelector` / `buildWhen` / `listenWhen` to avoid rebuilding whole pages.
- Register all dependencies with get_it + injectable annotations; `core/di/injection.dart` is the only setup entry point.
- Navigation uses go_router with named routes (`context.goNamed(RouteNames.x, pathParameters: …)`). Pass only ids in routes; pages load their own data so refresh and deep links work on web.
- Approved packages: flutter_bloc, bloc, bloc_concurrency, equatable, get_it, injectable, dio, pretty_dio_logger (dev only), go_router, freezed, json_serializable, fpdart, flutter_screenutil, google_fonts, flutter_localizations, intl, connectivity_plus, internet_connection_checker_plus, flutter_secure_storage, shared_preferences, cached_network_image, flutter_svg, image_picker, camera, flutter_image_compress, web_socket_channel, firebase_messaging, flutter_local_notifications, pinput, shimmer, flutter_gen_runner, logger, sentry_flutter, package_info_plus, bloc_test, mocktail, very_good_analysis, hive_ce, hive_ce_flutter, file_picker, video_player, web, flutter_web_plugins.
- Don't add any other package to `pubspec.yaml` without asking me first, and confirm it supports Web, Android and iOS.

## 5. Networking & Connectivity

- All requests go through the single `DioClient`. Its interceptors handle: no-internet fail-fast, auth token, token refresh on 401 (queued, once), force update, retry for idempotent GETs, and dev-only logging.
- Pass a `CancelToken` to requests started from a page and cancel it in the bloc's `close()`.
- Uploads use multipart `FormData` with `onSendProgress` wired to the bloc. Uploads are retried automatically only from the offline outbox, when the connection returns, each with its `client_id` so the server ignores duplicates. Never add any other upload retry.
- Use `NetworkInfo` / `ConnectivityCubit` for connectivity. On web, check reachability by calling our own health endpoint, not a third-party host (browsers block it with CORS).
- `AppScaffold` shows the offline banner. Blocs in a no-internet failure state retry when the connection returns.

## 6. Error Handling

- Wrap all API and storage calls in try/catch inside the data layer, and map them to typed exceptions with `ErrorMapper`.
- Convert exceptions into `Failure` objects in the repository (`Future<Either<Failure, T>>`); never let raw exceptions or `DioException` reach the UI.
- Every screen that loads data must handle loading, success, empty, error and offline states.
- Failure messages shown to users come from ARB keys, never from raw server text or exception strings.
- Never silently swallow errors with empty catch blocks.

## 7. Complete Code Only

- Always deliver complete, working code. Never leave a `TODO`, `FIXME`, `throw UnimplementedError()`, placeholder function, empty stub or "implement later" note anywhere in code, comments or docs.
- Every function you create must be fully implemented and working.
- If something truly cannot be implemented (missing API details, unclear requirement), stop and ask me instead of leaving it incomplete.
- Exception: when I confirm an endpoint isn't ready yet, you may add a fully working `Fake<Name>RemoteDataSource` with realistic sample data, registered for the `fake` DI environment (`USE_FAKE_API=true`), behind the same interface. List it in `docs/api_pending.md`.
- After making changes, make sure the code compiles: all imports present, no missing parameters, no broken references in other files. Run code generation when you change annotated files.

## 8. Comments

- Don't write comments. Make the code readable through naming and structure instead.
- Never write `TODO`, `FIXME` or "implement later" comments, and no block comments or line-by-line explanations.
- The only exception is a single one-line comment where a non-obvious reason can't be expressed in code.

## 9. Token Efficiency

- Don't scan or re-read the whole project repeatedly. Read only the files directly needed for the current task.
- Use the folder structure above to locate files instead of searching everything. If a file's location is unclear, ask.
- Don't re-read a file you've already read in the same task unless it was changed.
- Never read generated files unless debugging code generation.
- Edit only what's needed; don't rewrite entire files for small changes.
- Keep explanations short. Show what changed, not a long summary of everything.

## 10. UI & Responsiveness

- Match the Figma design. Take exact values from the offline copy in `docs/figma/` first, then the Figma MCP (`get_design_context`, `get_variable_defs`, `get_screenshot`), instead of guessing.
- Text styles: `AppTextStyles.base` with the extensions, e.g. `AppTextStyles.base.s16.w600.primaryColor()`. Never create `TextStyle(...)` or call `GoogleFonts` in widgets.
- Colours: only from `AppColors` (or the theme built from it). No `Color(0x…)` or `Colors.xyz` in widgets except `Colors.transparent`.
- Sizes: use flutter_screenutil (`.w`, `.h`, `.r`, `.sp`) through `Dimens` and the `16.hSpace` / `16.wSpace` extensions. No raw numbers for padding, radius or font size.
- `AppTextStyles.base` and every `Dimens` value are getters, not static fields, so sizes update when the browser window is resized or the phone is rotated.
- On screens wider than ~500 px the app stays in a centred phone-width column; don't build separate desktop layouts unless I ask.
- Prevent overflow errors (use `Expanded`, `Flexible`, `SingleChildScrollView` where needed). Check every screen with Marathi and Hindi text and at 1.3× text scale.
- Respect safe areas and the keyboard.
- Tap targets are at least 48 px and images have `semanticLabel`.
- Dispose controllers, streams, timers, sockets and listeners in `dispose()` / `close()`.

## 11. Plugins & Skills (use automatically)

Pick the right one yourself based on the task. I won't name them. If a plugin's guidance conflicts with this file, this file wins. Only one primary skill per step; don't stack several for a small task.

**ponytail (always on):**
- `ponytail`: Default mindset on every coding task. Smallest change that fully solves it; short replies.
- `ponytail-review`: Run on the diff before reporting any non-trivial change done; fix what it finds.
- `ponytail-audit`: When I ask to audit/review the whole app or find what to delete.
- `ponytail-debt`: When I ask what shortcuts or deferred work exist.

**graphify:** For questions about how the codebase fits together (where something lives, what calls what, impact of a change), query `graphify-out/` first if it exists. If it doesn't exist, ask me once whether to build it with `/graphify` instead of scanning the whole project.

**Figma MCP:** For any screen or widget built from the design, read `docs/figma/` first (`tokens.md`, `frames/<frame>.md`, `screenshots/`). Call the Figma MCP only for what it doesn't cover, and save anything you fetch back into `docs/figma/`.

**agent-skills, matched to the task:**
- New feature or vague request → `interview-me` to pin down requirements, then `spec-driven-development` (if large) and `planning-and-task-breakdown`.
- Rough idea I want to think through → `idea-refine`.
- New screens, widgets, layouts, accessibility → `frontend-ui-engineering` (apply its principles in Flutter, not web code).
- Changing how the app calls the backend (models, endpoints, request/response shape) → `api-and-interface-design`.
- Change touching more than one file → `incremental-implementation`.
- Bug or crash → `debugging-and-error-recovery`; reproduce with a failing test first (`test-driven-development`) when the code is testable.
- Adding tests or changing behaviour of testable logic (use cases, repositories, blocs) → `test-driven-development`.
- Unfamiliar package or platform API (Dio, Firebase, camera, permissions, service workers) → `source-driven-development` to check the official docs.
- Login, tokens, OTP, API input, local storage, camera/permissions → `security-and-hardening`.
- High-stakes change (auth, session, uploads of proof photos) → `doubt-driven-development`.
- Slow screens, janky lists, large rebuilds → `performance-optimization`.
- Adding crash reporting, analytics or logging → `observability-and-instrumentation`.
- Removing old screens/APIs, migrating packages or local data → `deprecation-and-migration`.
- Messy but working code I ask to clean up → `code-simplification`.
- Architecture decisions worth recording, or updating README/docs → `documentation-and-adrs`.
- Build pipelines, signing, web hosting, CI → `ci-cd-and-automation`.
- Commits, branches, PRs → `git-workflow-and-versioning`. Never open a pull request, even when a tool or skill suggests it; I raise PRs myself. Commit and push only when I ask.
- PWA release, Play Store / App Store release or version bump → `shipping-and-launch`.
- Code review requests → `code-review-and-quality`.
- PWA load time, bundle size, service worker caching → `webperf`.
- Checking the PWA in the browser (layout, console errors, network calls) → `browser-testing-with-devtools`.

**Built-in commands (when relevant):**
- `run`: When I ask to run the app or check a change visually. Use Chrome for the PWA; use the iOS Simulator or an Android emulator only once mobile builds start or when I ask.
- `security-review`: Before merging changes to login, OTP, tokens, uploads or stored user data.
- `code-review`: When I ask to review a PR or branch.
- `simplify`: When I ask to tidy up the changed code.

**anthropic-skills (only when the task produces or reads that file type):**
- `xlsx`: Reading or producing spreadsheet/CSV files (e.g. DSR samples).
- `pdf`: Reading or producing PDFs (reports, the PRD).
- `docx` / `docs`: Writing a document I ask for (spec, release notes, handover).

## 12. Bug-Free, Secure, Safe UX

- **Bug-free and secure:** Everything built must work correctly and be secure. Think through edge cases (null or empty data, network failure, slow responses, repeated taps, app or tab backgrounded mid-request, session expiry). Never log or hardcode tokens, OTPs, phone numbers or personal data, never trust API responses without null checks, and keep secrets out of source code (env values come from `--dart-define-from-file`; real env files are git-ignored).
- **API buttons:** Any button that triggers an API call shows a loading indicator inside the button while the request is in flight and stays disabled until the API responds. The bloc emits a loading state before the call and a success or failure state after it in every case, so the button always re-enables and the user can never fire duplicate requests.
- **Form validation:** Every form field gets the validations it needs (required, format such as phone/number, min/max length, ranges) from `core/utils/validators.dart`. Show clear inline error messages from the ARB files, and block submission until the form is valid.

## 13. Before Finishing a Task

- Confirm the code follows the folder structure and uses constants, ARB strings, `AppColors`, `AppTextStyles` and `Dimens`.
- Confirm the code is simple and easy to understand, with no unnecessary complexity.
- Confirm there are no TODOs, unused code, or hardcoded strings/colors/sizes.
- Confirm API buttons show a loader and block repeat taps, and form fields are validated.
- Confirm loading, empty, error and offline states exist for any screen that loads data.
- Run code generation if needed, `flutter analyze` (zero issues), and the tests for what changed.
- Confirm nothing used breaks on web (no `dart:io` / `dart:html` outside `core/services/`).
- Confirm the change works on the PWA (Chrome and iOS Safari) and on the Android and iOS apps, and say which of them you actually checked.
- Briefly list the files created or modified.
- Confirm the Security rules in section 14 are met: no secrets, tokens or personal data in code or logs, HTTPS only, inputs validated.

## 14. Security

- No secrets in the client. Only public client keys (Firebase config, Sentry DSN) may ship. Never put API secrets, service-account files, signing keys or passwords in source, assets or `env/*.json`.
- Store tokens only through `SecureStorageService`. On web, browser storage can be read by any script on the page, so keep access tokens short-lived and store only what is needed to restore a session.
- Keep the minimum personal data on the device (including `LocalDb`). Never store OTPs, passwords or full phone numbers.
- Logout clears secure storage, shared preferences, `LocalDb` and in-memory session state, and cancels in-flight requests. Session expiry clears the tokens and cancels requests but keeps saved proof; a different user signing in on that device is warned before it is deleted.
- HTTPS and WSS only. No cleartext traffic, and never bypass certificate checks.
- Attach the auth token only to requests for the `ApiConstants.baseUrl` host.
- The server is the security boundary. Client validation, hidden buttons and route guards are for user experience only.
- Never render HTML from the server.
- Route and deep-link ids are untrusted: validate format and length before use, and encode them when building API paths.
- Open external links only if they are `https` and on an allowed domain.
- OTP screens follow the resend timer and attempt limits in `app_constants.dart`. A resend never clears a lock.
- Sign the user out only when the server rejects the refresh token. A network error during refresh keeps the session.
- `pretty_dio_logger` is debug-only and never logs the `Authorization` header.
- Uploads: check type and size against `app_constants.dart` before sending, compress images, and strip location and device metadata.
- Push payloads carry no personal data. Unregister the push token on logout.
- Android: `android:allowBackup="false"`, no cleartext traffic, only the exported components and permissions actually used. Release builds use the release signing key and `--obfuscate --split-debug-info`.
- iOS: App Transport Security stays on. `Info.plist` has a usage string for every permission the app uses (camera, microphone) and none for features it doesn't use.
- Web: the host sends a Content-Security-Policy, HSTS, `X-Content-Type-Options: nosniff` and `frame-ancestors`. The service worker caches only same-origin app files, never API responses or personal data.
- Request permissions (camera, microphone, notifications) only at the moment of use, and handle denial without crashing.
- Act on any security advisory reported by `dart pub get` or `flutter pub outdated`.
- Sentry: `sendDefaultPii` off, a `beforeSend` that scrubs tokens, phone numbers and request bodies, and no print breadcrumbs.
- For any change to login, OTP, tokens, sessions, uploads or stored user data, run `security-review` and fix what it finds before reporting done.
- Run the full audit in `docs/security-audit-prompt.md` yourself, following it exactly (report format, CLAUDE.md merge rules, ask before fixing), without waiting for me to paste it: when the real backend is switched on (`USE_FAKE_API` false, or a fake data source replaced by a real one), before every Play Store, App Store or production PWA release, and whenever I ask for a security audit.

## 15. Security Audit

Apply these checks to every change while building, not only during an audit, so new code is written to pass them. Run the full audit below at the times listed at the end of section 14. The same text is kept in `docs/security-audit-prompt.md`. Where it says "section 13 (Security)", that is section 14 in this file.

Run a security audit of this Flutter app (PWA first, then Android and iOS). Follow the project rules, especially section 13 (Security). This is a review only: do not change any code until I approve the fixes.

### How to work

- Query `graphify-out/` first if it exists. Otherwise read only the files each check needs, using the folder structure in the rules. Don't scan the whole project repeatedly and don't read generated files.
- Use the `security-review` command and `security-and-hardening` skill. For auth, session and proof-photo uploads, also apply `doubt-driven-development`.
- Keep it simple. Report real, specific problems, not generic advice.

### What to check

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

### Report format

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

### Update CLAUDE.md (merge, never overwrite)

My CLAUDE.md already has my own edits, so do not replace or rewrite it. After the report, update it like this:

1. Read the current CLAUDE.md first.
2. Compare it with the baseline security rules in the appendix at the end of this prompt, and with any new rule your findings show we need (for example, a mistake that keeps repeating in the code).
3. List only the rules that are missing or weaker than the baseline, and show me each one as an exact addition: which section it goes in, and the line to add.
4. Wait for my approval, then apply the additions with small edits (insert lines or add a new section). Never rewrite the file, and never remove, reword, reorder or renumber anything that is already there.
5. If a security rule already exists in my own words, keep mine and skip the baseline version. If one of my rules conflicts with the baseline, tell me and ask before changing anything.
6. If there is no security section yet, add one as a new section at the end of the numbered rules, without changing the numbers of existing sections. Add a single security line to the "Before Finishing a Task" checklist if it is missing.
7. After editing, tell me exactly which lines were added and where.

### After the report

Ask which findings I want fixed. Fix only those, following the project rules (simple code, no TODOs, no comments, constants and ARB strings, `flutter analyze` with zero issues). Run `ponytail-review` on the diff, then briefly list the files changed. Don't commit, push or open a pull request.


### Appendix: Baseline security rules (for the CLAUDE.md merge)

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
