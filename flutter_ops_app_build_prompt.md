# Prompt: Build the Ops App in Flutter (PWA first, then Android/iOS)


## 0. Your role and inputs

You are a senior Flutter engineer. Build a production-grade Flutter app from the Figma design below. Ship it first as a **PWA (Flutter Web)**, then as **Android and iOS** apps from the **same codebase** with no rewrite.

- **Figma (source of truth for UI):** `https://www.figma.com/design/kEdB82eXddsUq6gAnNzMFF/Rapsap-Designs?node-id=1085-6532&t=hPgjiYRvGk5qiXQO-0`
  - If the Figma MCP is available, use it: `get_metadata` to list every frame, `get_variable_defs` to pull colors, typography, spacing and radii, `get_design_context` + `get_screenshot` per screen, and `download_assets` for icons and images. Do not guess values that the file defines.
  - Read the design size of the main mobile frame (e.g. 375×812 or 390×844) and use it as the `ScreenUtil` `designSize`.
- **Product requirements:** Ops App PRD v1.4 (retail store operations). Roles: **Staff**, **Store Manager (SM)**, **Admin**. Features: OTP login, daily checklist tasks with photo/video proof, SM review (verify / send back), section reports, DSR (daily sales report) upload, chat (groups + DMs) with moderation, notifications, profile, settings. Languages: **English, Marathi, Hindi**.
- **Backend:** REST + WebSocket. Base URLs per environment come from env config (section 4). Where an endpoint is not yet known, add it to `ApiConstants` with a `// TODO(api): confirm path` comment and a fake data source behind the same repository interface so the UI can be built now.

Work in the phases in section 13. After each phase, run `flutter analyze` (zero warnings), `dart format`, and the tests, then stop and summarise what was built.

---

## 1. Tech stack (use these; latest stable versions, check pub.dev)

| Concern | Package(s) | Notes |
| --- | --- | --- |
| State management | `flutter_bloc`, `bloc`, `equatable`, `bloc_concurrency` | Cubit for simple screens, Bloc where events need transformers (search debounce, pagination, chat). |
| Dependency injection | `get_it` + `injectable` (+ `injectable_generator`) | One `configureDependencies(env)` call in `bootstrap.dart`. |
| Networking | `dio` (+ `pretty_dio_logger` in dev only) | Single `DioClient`; interceptors in section 5. |
| Routing | `go_router` | `StatefulShellRoute` for bottom tabs, `redirect` for auth + role guards, path URL strategy on web. |
| Models | `freezed`, `freezed_annotation`, `json_serializable`, `json_annotation` | DTOs in data layer, plain entities in domain. |
| Functional results | `fpdart` | Repositories return `Future<Either<Failure, T>>`. Don't use `dartz` (unmaintained). |
| Responsive sizing | `flutter_screenutil` | See section 7. |
| Fonts | `google_fonts` | Font family from Figma; bundle the font files in `assets/fonts` for offline/PWA and set `GoogleFonts.config.allowRuntimeFetching = false` in release. |
| Localisation | `flutter_localizations`, `intl`, ARB files (`gen-l10n`) | EN / MR / HI. See section 8. |
| Connectivity | `connectivity_plus` + `internet_connection_checker_plus` | See section 6. |
| Secure storage | `flutter_secure_storage` | Tokens. Note web limitation in section 12. |
| Local storage | `shared_preferences` | Language, onboarding seen, last store, etc. |
| Images | `cached_network_image`, `flutter_svg` | |
| Media capture | `image_picker` (+ `camera` if Figma needs a custom camera UI), `flutter_image_compress` | Behind a `MediaCaptureService` interface. |
| Real-time chat | `web_socket_channel` | Behind a `ChatSocketService` with reconnect + backoff. |
| Push | `firebase_messaging` (+ `flutter_local_notifications` for mobile) | Behind a `PushService` interface. Web needs `firebase-messaging-sw.js`. |
| OTP input | `pinput` | |
| Pagination | custom `PaginatedState<T>` + Bloc (no extra package) | |
| Loading skeletons | `shimmer` (or `skeletonizer`) | |
| Assets codegen | `flutter_gen_runner` | Type-safe `Assets.images.logo`, no raw asset strings. |
| Logging / crashes | `logger`; `sentry_flutter` (supports web + mobile) | Crashlytics has no web support, so prefer Sentry. |
| App version / force update | `package_info_plus` | Compare with server `min_version` (PRD PLAT-04). |
| Lints | `very_good_analysis` | Plus `prefer_const_constructors`, `require_trailing_commas`. |
| Testing | `bloc_test`, `mocktail`, `flutter_test` | |

Do **not** add a package that isn't in this list without stating why and checking it supports **Web, Android and iOS**.

---

## 2. Architecture: Clean Architecture, feature-first

Rules:

1. **Three layers per feature**: `data` → `domain` ← `presentation`. Domain has **no** Flutter, Dio or JSON imports.
2. Data flow: `Widget → Bloc/Cubit → UseCase → Repository (interface, domain) → RepositoryImpl (data) → RemoteDataSource / LocalDataSource → DioClient`.
3. DTOs (`*Model`) live in `data/models`, have `fromJson/toJson` and a `toEntity()` mapper. Entities are immutable (`freezed` or `Equatable`).
4. Exceptions are thrown only in data sources; `RepositoryImpl` catches them and returns `Left(Failure)`. Blocs never see `DioException`.
5. One Bloc/Cubit per screen (or per independent widget section). No business logic, API calls or `setState` for business state inside widgets.
6. States use `sealed`/`freezed` unions (`initial / loading / success / failure`) or a single state class with a `status` enum — pick one style and use it everywhere.
7. Every page is split into small private widgets or files under `presentation/widgets`. No `build` method longer than ~80 lines.
8. Everything that touches a platform (camera, push, storage, file download, install prompt) is behind an abstract service with web and mobile implementations chosen via conditional imports (`if (dart.library.js_interop)`).

### Folder structure

```
lib/
├── main_dev.dart / main_staging.dart / main_prod.dart
├── bootstrap.dart              # env, DI, error zones, Sentry, Bloc observer
├── app.dart                    # MaterialApp.router, ScreenUtilInit, theme, l10n, global BlocProviders
├── core/
│   ├── config/                 # env_config.dart, flavor.dart
│   ├── constants/              # api_constants.dart, app_constants.dart, storage_keys.dart
│   ├── di/                     # injection.dart, injection.config.dart (generated), register_module.dart
│   ├── error/                  # exceptions.dart, failures.dart, error_mapper.dart
│   ├── network/                # dio_client.dart, api_response.dart, interceptors/, network_info.dart
│   ├── router/                 # app_router.dart, route_paths.dart, route_names.dart, guards/
│   ├── theme/                  # app_colors.dart, app_text_styles.dart, dimens.dart, app_theme.dart
│   ├── l10n/                   # arb/app_en.arb, app_mr.arb, app_hi.arb
│   ├── services/               # connectivity/, storage/, media/, push/, socket/, app_update/
│   ├── extensions/             # context_ext.dart, string_ext.dart, date_ext.dart, num_ext.dart
│   ├── utils/                  # validators.dart, formatters.dart, debouncer.dart, logger.dart
│   ├── bloc/                   # app_bloc_observer.dart, connectivity_cubit.dart, session (auth) bloc
│   └── widgets/                # common widgets (section 9)
└── features/
    ├── onboarding/             # language pick, privacy notice, permissions (camera, push)
    ├── auth/                   # phone → OTP → session, logout, force update gate
    ├── home/
    ├── checklist/              # task list by section, task detail, capture + submit proof
    ├── review/                 # SM: verify / send back / unlock
    ├── section_reports/        # SM: ready → submit; returned → resubmit
    ├── dsr/                    # SM/ASM: upload DSR file, history
    ├── chat/                   # groups, DMs, messages, report, pin, mute
    ├── notifications/
    ├── profile/
    └── settings/
        └── <feature>/
            ├── data/           # datasources/, models/, repositories/
            ├── domain/         # entities/, repositories/, usecases/
            └── presentation/   # bloc/, pages/, widgets/
```

Only create feature folders for screens that exist in the Figma; map each Figma frame to a page and list the mapping in `docs/screens.md`.

---

## 3. Constants: endpoints, strings, keys

### 3.1 API endpoints — keep the grouped style, with three fixes

Keep the `ApiConstants.<group>.<endpoint>` style (it reads well and groups by feature). Improve it as follows:

1. **Paths only, no query strings.** Don't build `?limit=…&page=…` by hand: it skips URL encoding and duplicates defaults. Pass a `queryParameters` map (or a small `freezed` query object with `toJson()`) to Dio instead.
2. **`const` groups** with private `const` constructors, so nothing is allocated at runtime and nobody can instantiate them elsewhere.
3. **A shared service prefix** in one place, so a backend path change is a one-line edit.

```dart
// core/constants/api_constants.dart
import 'package:<app>/core/config/env_config.dart';

class ApiConstants {
  ApiConstants._();

  static String get baseUrl => EnvConfig.instance.baseUrl;
  static String get wsUrl => EnvConfig.instance.wsUrl;

  static const Duration connectTimeout = Duration(seconds: 20);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 60); // photo/video uploads

  static const _prefix = '/ops/api/v1'; // TODO(api): confirm

  static const auth = _AuthEndpoints();
  static const user = _UserEndpoints();
  static const tasks = _TaskEndpoints();
  static const review = _ReviewEndpoints();
  static const reports = _SectionReportEndpoints();
  static const dsr = _DsrEndpoints();
  static const chat = _ChatEndpoints();
  static const notifications = _NotificationEndpoints();
  static const app = _AppEndpoints();
}

class _AuthEndpoints {
  const _AuthEndpoints();
  String get sendOtp => '${ApiConstants._prefix}/auth/otp/send';
  String get verifyOtp => '${ApiConstants._prefix}/auth/otp/verify';
  String get refresh => '${ApiConstants._prefix}/auth/refresh';
  String get logout => '${ApiConstants._prefix}/auth/logout';
}

class _TaskEndpoints {
  const _TaskEndpoints();
  String get base => '${ApiConstants._prefix}/tasks';
  String get today => '$base/today';                         // + queryParameters: {section, page, limit}
  String byId(String id) => '$base/$id';
  String submit(String id) => '$base/$id/submit';            // multipart
  String notDone(String id) => '$base/$id/not-done';
  String captureToken(String id) => '$base/$id/capture-token'; // PRD CK-03
}

class _ChatEndpoints {
  const _ChatEndpoints();
  String get base => '${ApiConstants._prefix}/chat';
  String get conversations => '$base/conversations';
  String messages(String conversationId) => '$conversations/$conversationId/messages';
  String message(String conversationId, String messageId) =>
      '${messages(conversationId)}/$messageId';
  String report(String messageId) => '$base/messages/$messageId/report';
  // Token goes in a header or first socket frame where the backend allows; avoid it in the URL (it ends up in logs).
  String socket(String token) => '${ApiConstants.wsUrl}/chat/ws?token=$token';
}

class _AppEndpoints {
  const _AppEndpoints();
  String get config => '${ApiConstants._prefix}/app/config'; // min_version, feature flags
  String get health => '${ApiConstants._prefix}/health';      // used by the internet check
}
// …same pattern for user, review, reports, dsr, notifications.
```

Usage:

```dart
final res = await _dio.get(
  ApiConstants.tasks.today,
  queryParameters: TaskQuery(section: section, page: page, limit: 20).toJson(),
);
```

### 3.2 Strings

- **All user-facing text goes in ARB files** (`app_en.arb`, `app_mr.arb`, `app_hi.arb`), accessed as `context.l10n.loginTitle`. The PRD needs three languages, so a plain Dart `AppStrings` file is not enough for UI text.
- `core/constants/app_constants.dart` holds **non-translatable** values only: app name, OTP length, OTP resend seconds, page size, max upload MB, video min/max seconds, date formats, regexes.
- `core/constants/storage_keys.dart` holds every `SharedPreferences` / secure-storage key.
- No string literal in a widget except `''` and keys. Add a lint check or test that greps `Text('` in `features/`.

---

## 4. Environment config and flavors

- `EnvConfig` singleton with `baseUrl`, `wsUrl`, `sentryDsn`, `flavor`, `enableLogs`.
- Values come from `--dart-define-from-file=env/dev.json` (and `staging.json`, `prod.json`). Commit `env/example.json` only; git-ignore the real files.
- Three entry points: `main_dev.dart`, `main_staging.dart`, `main_prod.dart`, each calling `bootstrap(Flavor.x)`.
- Add VS Code `launch.json` and a `Makefile`/`justfile` with `run-dev`, `build-web-prod`, `build-apk-prod`, `gen` (build_runner + gen-l10n + flutter_gen).

---

## 5. Networking

`DioClient` (registered as a lazy singleton) with:

1. `BaseOptions`: `baseUrl`, the timeouts from `ApiConstants`, `Accept: application/json`, `Accept-Language` from the current locale, `X-App-Version` and `X-Platform` (web/android/ios).
2. **Interceptors, in order:**
   - `ConnectivityInterceptor`: if `NetworkInfo.isConnected` is false, reject immediately with `NoInternetException` (no 30 s wait).
   - `AuthInterceptor` (`QueuedInterceptorsWrapper`): adds the bearer token; on **401** refreshes the token **once**, queues concurrent requests while refreshing, retries them, and on refresh failure clears the session and emits `SessionExpired` so the router sends the user to login.
   - `ForceUpdateInterceptor`: on a `426` (or a server flag), emits an event that shows the force-update screen.
   - `RetryInterceptor`: retry idempotent GETs up to 2 times with backoff on timeout/5xx. Never auto-retry POST uploads.
   - `PrettyDioLogger`: dev flavor only; never log tokens or OTPs.
3. A typed `ApiResponse<T>` envelope parser matching the backend's response shape.
4. `ErrorMapper` turns `DioException` / status codes into `ServerException`, `UnauthorizedException`, `ValidationException(fieldErrors)`, `NoInternetException`, `TimeoutException`, `CancelledException`. Repositories turn those into `Failure` subclasses with a localisable message key.
5. Uploads: `FormData` multipart with `onSendProgress` wired to the Bloc so the UI shows a progress bar; `CancelToken` on every request started from a page, cancelled in `close()`.

---

## 6. Internet connectivity

- `NetworkInfo` service: combines `connectivity_plus` (is there a network?) with `internet_connection_checker_plus` (is the internet reachable?).
  - **On web**, ping our own `ApiConstants.app.health` URL, not Google/Cloudflare: browsers block cross-origin pings with CORS.
- `ConnectivityCubit` provided at the app root, emitting `online / offline`, debounced (~1 s) so it doesn't flicker.
- `OfflineBanner` common widget shown at the top of every `AppScaffold` while offline, and a short "Back online" toast when the connection returns.
- When connectivity returns, Blocs in a failure state caused by `NoInternetFailure` retry automatically (listen to `ConnectivityCubit`).
- Upload and chat send failures show "Failed — tap to retry" (PRD: no offline queue in Phase 1). Design repositories so an offline queue can be added later without touching the UI.

---

## 7. Theme, colours, typography, spacing (ScreenUtil)

### 7.1 Colours — `core/theme/app_colors.dart`

```dart
class AppColors {
  AppColors._();
  static const Color primary = Color(0xFF……);   // from Figma variables
  static const Color secondary = Color(0xFF……);
  static const Color textPrimary = Color(0xFF……);
  static const Color textSecondary = Color(0xFF……);
  // status colours used by task chips: pending, done, verified, sentBack, missed, notDone, locked
  // gray50…gray900, success, warning, error, info, border, divider, background, surface
}
```

- Names match the Figma variable names. No `Color(0x…)` or `Colors.xyz` anywhere outside this file (except `Colors.transparent`).
- Wire them into `AppTheme.light` (`ColorScheme`, `InputDecorationTheme`, `ElevatedButtonTheme`, `AppBarTheme`, etc.) so default widgets already look right. Add a `ThemeExtension` for status colours.

### 7.2 Text styles — `core/theme/app_text_styles.dart`

Use exactly this extension pattern, with two fixes:

1. `base` must be a **getter**, not a static field. A static field is evaluated once, so `.sp` is frozen at first use and won't update when a browser window is resized or a phone is rotated.
2. Letter spacing scales with the font, so use `.sp` (not `.w`) for it.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get base => GoogleFonts.openSans( // font family from Figma
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        letterSpacing: -0.4.sp,
      );
}

extension AppFontWeight on TextStyle {
  TextStyle get w100 => copyWith(fontWeight: FontWeight.w100);
  // … w200 – w900
}

extension AppFontSize on TextStyle {
  TextStyle get s10 => copyWith(fontSize: 10.sp);
  // … s12, s13, s14, s16, s17, s18, s20, s24, s28, s32, s36, s40, s44, s48 (add any size Figma uses)
}

extension AppLetterSpacing on TextStyle {
  TextStyle get l2 => copyWith(letterSpacing: -0.2.sp);
  TextStyle get p2 => copyWith(letterSpacing: 0.2.sp);
  // … l3/p3, l4/p4, l5/p5
}

extension AppLineHeight on TextStyle {         // added: Figma specifies line heights
  TextStyle height(double px) => copyWith(height: px / (fontSize ?? 16.sp));
}

extension AppFontColor on TextStyle {
  TextStyle whiteColor({double opacity = 1.0}) =>
      copyWith(color: Colors.white.withValues(alpha: opacity));
  TextStyle primaryTextColor({double opacity = 1.0}) =>
      copyWith(color: AppColors.textPrimary.withValues(alpha: opacity));
  // … one method per AppColors text colour, generated from the Figma palette
}

extension AppFontStyle on TextStyle {
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
}

extension AppFontDecoration on TextStyle {
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
  TextStyle get overline => copyWith(decoration: TextDecoration.overline);
  TextStyle get noneDecoration => copyWith(decoration: TextDecoration.none);
}
```

Usage: `Text(context.l10n.today, style: AppTextStyles.base.s18.w600.primaryColor())`.

Never call `TextStyle(...)` or `GoogleFonts.x(...)` in a widget. Marathi/Hindi text must render: check the chosen Google Font has Devanagari glyphs; if not, set `fontFamilyFallback: ['Noto Sans Devanagari']` in `base` and bundle that font.

### 7.3 Dimensions — `core/theme/dimens.dart`

Same API as before, but every value is a **getter** (same reason as `base` above):

```dart
class Dimens {
  Dimens._();

  // Padding / spacing
  static double get paddingExtraSmall => 4.w;
  static double get paddingSmall => 8.w;
  static double get paddingMedium => 16.w;
  static double get paddingLarge => 24.w;
  static double get paddingExtraLarge => 32.w;

  // Radius
  static double get radius2 => 2.r;
  // … radius4 – radius32

  // Icons, buttons, inputs, app bar, bottom nav heights from Figma
  static double get buttonHeight => 48.h;
  static double get inputHeight => 48.h;
  static double get iconMedium => 24.r;

  // Common EdgeInsets
  static EdgeInsets get pagePadding =>
      EdgeInsets.symmetric(horizontal: paddingLarge, vertical: paddingLarge);
  static EdgeInsets get cardPadding => EdgeInsets.all(paddingMedium);
  static EdgeInsets get buttonPadding =>
      EdgeInsets.symmetric(horizontal: paddingLarge, vertical: paddingSmall);
}
```

Add `extension SpaceX on num { Widget get hSpace => SizedBox(height: toDouble().h); Widget get wSpace => SizedBox(width: toDouble().w); }` so spacing reads `16.hSpace`. No raw numbers for padding, radius or font size in widgets.

### 7.4 ScreenUtil setup (mobile + PWA)

- `ScreenUtilInit(designSize: Size(<<figma width>>, <<figma height>>), minTextAdapt: true, splitScreenMode: true, ensureScreenSize: true)` wraps `MaterialApp.router`.
- **Web / tablet / desktop:** the app is mobile-first. On screens wider than ~500 px, centre the app in a phone-width column (max ~430 px) and override `MediaQuery.size` for that column **before** `ScreenUtilInit`, so `.w`/`.sp` are calculated from the column width and don't blow up on a 1440 px monitor.
- Clamp text scaling: `MediaQuery.withClampedTextScaling(minScaleFactor: 0.9, maxScaleFactor: 1.3)`.
- Respect safe areas and the keyboard (`resizeToAvoidBottomInset`, `SafeArea` inside `AppScaffold`).

---

## 8. Localisation

- `l10n.yaml` with `arb-dir: lib/core/l10n/arb`, `output-class: AppLocalizations`, `nullable-getter: false`.
- `context.l10n` extension.
- Language picked on onboarding and in Settings, saved in `shared_preferences`, applied through a `LocaleCubit` at the root.
- Dates, times and numbers use `intl` with the current locale (Indian grouping for currency: ₹1,23,456).
- Sent to the backend in `Accept-Language`.

---

## 9. Common widgets (`core/widgets/`)

Build these first from the Figma components, then use them everywhere. Each takes parameters, has no business logic and no hard-coded strings.

- `AppScaffold` (safe area, offline banner, optional app bar, loading overlay)
- `AppAppBar`, `AppBottomNavBar`
- `AppButton` (primary / secondary / outline / text / danger; `isLoading`, `isDisabled`, icon, full-width)
- `AppTextField`, `AppPhoneField` (+91, 10 digits), `AppOtpField` (pinput), `AppSearchField` (debounced), `AppDropdown`
- `AppCard`, `AppListTile`, `AppChip` / `StatusChip` (task statuses), `AppBadge`, `AppAvatar`
- `AppNetworkImage` (cache, placeholder, error), `AppSvgIcon`
- `AppLoader`, `AppShimmer` list/card skeletons
- `AppEmptyState`, `AppErrorView` (with retry), `OfflineBanner`
- `AppDialog` (confirm / info / destructive), `AppBottomSheet`, `AppSnackbar` / toast helper
- `PaginatedListView<T>` (pull to refresh, load more, empty, error, end-of-list)
- `UploadProgressTile`, `MediaPreview` (photo/video), `CountdownTimer` (OTP resend, task grace time)
- `BlocStateBuilder<B, S>` helper that renders loading / error / empty / success consistently

If a widget appears in two or more places, it belongs here. Refactor duplicates as you find them.

---

## 10. Routing (go_router)

- `RoutePaths` and `RouteNames` constants; navigate with `context.goNamed(RouteNames.taskDetail, pathParameters: {'id': id})`. No string paths in widgets.
- `StatefulShellRoute.indexedStack` for the bottom tabs (shown by Figma), each tab keeping its own stack.
- `redirect` driven by the session bloc (`refreshListenable` via a `GoRouterRefreshStream`): splash → force update → onboarding → login → home. Role guard: SM-only routes (review, section reports, DSR upload) redirect Staff to home.
- Web: `usePathUrlStrategy()` so URLs have no `#`; document the server rewrite (all routes → `index.html`). Deep links and refresh on any URL must work.
- `errorBuilder` with a not-found page.
- Pass only ids in routes; pages load their own data (so refresh and deep links work).

---

## 11. Feature notes from the PRD (build what the Figma shows)

- **Auth:** phone → OTP (length and resend timer from `AppConstants`) → session. Show the "locked after wrong OTPs" state. Tokens in secure storage. Logout clears storage, Blocs and the socket.
- **Onboarding:** language, privacy notice, camera and notification permission screens. If camera is denied, show how to enable it; if push is denied, show a warning banner on Home.
- **Checklist:** tasks grouped by section with status chips; open/due/grace times in the store's timezone (Asia/Kolkata); "Done by <name>" when someone else submitted a shared task.
- **Capture & submit:** take photo/video in-app (no gallery for proof unless Figma shows it), compress, show preview, request a capture token before capture, upload with progress, retry on failure. Video limits from `AppConstants`.
- **SM review:** verify, send back with reason, unlock; counts by status.
- **Section reports, DSR upload** (file picker; clear error when the file can't be read).
- **Chat:** group list, DMs, message list with pagination ("load older"), send text/photo, delete-for-everyone window, report message, pins, per-group mute, blocked-message notice with "Send for review", "Failed — tap to retry".
- **Notifications** list, **Profile**, **Settings** (language, notification toggle, app version, logout).
- **Force update** screen when the app version is below the server minimum.

---

## 12. PWA specifics (and the later move to mobile)

- `web/manifest.json`: name, short name, theme/background colours from `AppColors`, `display: standalone`, icons 192/512 + maskable.
- Splash/loading in `web/index.html` that matches the brand, removed when Flutter's first frame renders.
- "Update available — reload" prompt when a new service worker is waiting.
- "Install app" prompt (Android Chrome `beforeinstallprompt`); for iOS show "Add to Home Screen" steps — iOS Safari only delivers web push to installed PWAs (16.4+).
- Firebase web push: `firebase-messaging-sw.js` + VAPID key from env.
- `flutter_secure_storage` on web is not truly secure (data lives in browser storage). If the backend can set the refresh token as an `HttpOnly` cookie for web, prefer that; otherwise keep the access token short-lived.
- Camera on web needs HTTPS. `image_picker` on web opens the device camera via file input; check this on Android Chrome and iOS Safari early.
- Build: `flutter build web --release --dart-define-from-file=env/prod.json` (try `--wasm` and keep it if all packages work). Set `--base-href` if hosted under a sub-path.
- Avoid `dart:io` and `dart:html` in shared code; use `kIsWeb`, `defaultTargetPlatform`, `package:web` and conditional imports inside the service layer only.
- For mobile later: add Android/iOS permission strings (camera, microphone, notifications), app icons and splash (`flutter_launcher_icons`, `flutter_native_splash`), and Android/iOS flavors matching the env files. No feature code should need to change.

---

## 13. Build phases (stop and report after each)

1. **Foundation:** project, lints, flavors/env, DI, `DioClient` + interceptors + error mapping, `NetworkInfo` + `ConnectivityCubit`, secure/local storage, `AppColors` / `AppTextStyles` / `Dimens` / `AppTheme` from Figma variables, l10n setup, router skeleton, Bloc observer, Sentry, app-update check.
2. **Design system:** all common widgets (section 9) + a hidden `/dev/widgets` gallery page (dev flavor only) showing each one.
3. **Auth + onboarding + session + guards.**
4. **Home + checklist + task detail + capture/submit.**
5. **SM review + section reports + DSR.**
6. **Chat (REST + WebSocket) + notifications + push.**
7. **Profile + settings + force update + PWA polish** (manifest, install/update prompts, splash).
8. **Hardening:** tests, accessibility pass, performance pass, `README.md`.

---

## 14. Quality bar (check before each phase is "done")

- `flutter analyze` shows zero issues; `dart format` applied; generated files committed or ignored consistently.
- No hard-coded colours, font styles, sizes, strings, routes or endpoints in `features/`.
- Every Bloc/Cubit has `bloc_test` tests for success, failure and no-internet; every repository has unit tests with mocked data sources; key widgets have widget tests.
- Every list has loading, empty, error, offline and pagination states; every button that calls the API shows loading and blocks double taps.
- Images have `semanticLabel`; tap targets ≥ 48 px; text works at 1.3× scale and in Marathi/Hindi without overflow.
- `const` constructors wherever possible; `ListView.builder` for lists; images sized and cached; no rebuilds of the whole page on small state changes (`BlocSelector`, `buildWhen`).
- Blocs cancel streams, timers, sockets and `CancelToken`s in `close()`.
- No secrets in code; no tokens, OTPs or phone numbers in logs.
- `README.md` covers setup, env files, running each flavor, codegen, building web/APK/IPA, and folder conventions.
