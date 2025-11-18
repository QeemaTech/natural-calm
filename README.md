# Natural Calm Mobile App

Cross-platform Flutter application that launches a branded splash animation and then renders the QDP web experience inside an embedded browser.

## Project Overview
- **Target platforms**: Android, iOS, web, desktop.
- **Primary flow**: `lib/main.dart` initializes Flutter bindings, applies status-bar styling, and hands off to `SplashScreen`.
- **Splash experience**: `lib/splash_screen.dart` presents a timed fade + scale animation before navigating to the web view.
- **Web container**: `lib/webview_screen.dart` uses `flutter_inappwebview` to display `https://naturalcalm.site/` with a loading overlay until the page is ready.

## Android Build Configuration
- The Android NDK is pinned in `android/app/build.gradle.kts` via `ndkVersion = "27.0.12077973"` to satisfy native plugin requirements (e.g., `flutter_inappwebview_android`).
- Custom launch themes live in `android/app/src/main/res/values/styles.xml`:
  - `LaunchTheme` controls the splash window background while Flutter initializes.
  - `NormalTheme` sets the base style after the first Flutter frame.
- Ensure Android Studio or command-line builds use the same SDK/NDK versions referenced above.

## Assets
- App logos reside in `assets/`; update `pubspec.yaml` if additional assets are added.
- The splash animation loads `assets/img.png`; confirm new art keeps transparent padding to avoid clipping.

## Development Tips
- Run `flutter pub get` after dependency updates.
- Use `flutter run -d <device_id>` for targeted testing; the Android build now requires NDK 27.0.12077973 or higher.
- Consider adding error handling around web view loading (offline detection, SSL errors) and analytics for navigation events.

## Future Improvements
- Implement a retry/offline UI for web view failures.
- Extract theme colors into a shared configuration file for easier branding updates.
- Add integration tests (e.g., `integration_test/`) to verify splash-to-web navigation and loading indicator behavior.
