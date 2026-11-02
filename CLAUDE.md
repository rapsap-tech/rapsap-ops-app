# Flutter Project Rules

Follow these rules for every task in this project. If a rule conflicts with a direct instruction from me, ask before proceeding.

The app ships first as a PWA (Flutter Web), then as Android and iOS apps from the same code. Every change must work on all three.

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
- Approved packages: flutter_bloc, bloc, bloc_concurrency, equatable, get_it, injectable, dio, pretty_dio_logger (dev only), go_router, freezed, json_serializable, fpdart, flutter_screenutil, google_fonts, flutter_localizations, intl, connectivity_plus, internet_connection_checker_plus, flutter_secure_storage, shared_preferences, cached_network_image, flutter_svg, image_picker, camera, flutter_image_compress, web_socket_channel, firebase_messaging, flutter_local_notifications, pinput, shimmer, flutter_gen_runner, logger, sentry_flutter, package_info_plus, bloc_test, mocktail, very_good_analysis.
- Don't add any other package to `pubspec.yaml` without asking me first, and confirm it supports Web, Android and iOS.

## 5. Networking & Connectivity

- All requests go through the single `DioClient`. Its interceptors handle: no-internet fail-fast, auth token, token refresh on 401 (queued, once), force update, retry for idempotent GETs, and dev-only logging.
- Pass a `CancelToken` to requests started from a page and cancel it in the bloc's `close()`.
- Uploads use multipart `FormData` with `onSendProgress` wired to the bloc. Never auto-retry uploads.
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
- Briefly list the files created or modified.