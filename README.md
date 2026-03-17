## Mubssure — App Documentation

Welcome to Mubssure, a mobile-first dating application built with Flutter. This document describes the project purpose, the main screens (pages), assets and launcher icon details, and how to run and verify the app locally.

---

## Project summary

- Name: Mubssure
- Platform: Flutter (Android, iOS, web, desktop scaffolding present)
- Purpose: A dating / social discovery app allowing users to create profiles, discover matches, message, manage subscriptions, and configure settings.

Key capabilities implemented in the repository:
- Create and edit user profiles
- Discover other users (card/list style)
- In-app chat and messaging
- Subscription management UI
- User settings and profile viewing

---

## Project layout (high-level)

Relevant folders and their purpose:
- `lib/` — Main Dart source code.
	- `lib/main.dart` — App entry point.
	- `lib/screens/` — UI screens (each major page in the app).
	- `lib/widgets/` — Reusable UI widgets (cards, tiles, etc.).
- `assets/images/` — App image assets (icons, logos, illustrations). Contains `icon.png` used for launcher icons.
- `android/`, `ios/`, `web/`, `windows/`, `macos/`, `linux/` — Platform-specific projects scaffolding.
- `pubspec.yaml` — Dart/Flutter manifest: dependencies, assets, and `flutter_launcher_icons` configuration.

---

## Screens (files in `lib/screens/`) and what they do

Below are the screens present in the `lib/screens/` folder with their purpose and typical behaviour.

- `welcome_screen.dart`
	- Purpose: First screen shown to unauthenticated users.
	- Behaviour: Presents branding, short app intro, and actions to sign up or log in.

- `signup_screen.dart`
	- Purpose: User registration flow.
	- Behaviour: Collects name, email/phone, password, optionally basic profile details and navigates to profile creation.

- `create_profile_screen.dart`
	- Purpose: Allow users to build their profile (photos, bio, interests, age, location, etc.).
	- Behaviour: Upload or select images, set textual details and preferences; save and return to the home/discovery flow.

- `home_tabs.dart`
	- Purpose: Root tabbed navigation for the logged-in user.
	- Behaviour: Hosts primary tabs such as Discover, Messages, Profile, Settings, and Subscriptions.

- `discover_screen.dart`
	- Purpose: Main discovery experience where users see potential matches.
	- Behaviour: Shows cards or list of profiles (often swipeable). Provides actions to like, super-like, or skip. May show filters and search.

- `chat_screen.dart`
	- Purpose: The conversation view between two users.
	- Behaviour: Displays message history, allows sending text (and possibly images), shows timestamps and typing indicators if implemented.

- `messages_screen.dart`
	- Purpose: Conversations list / inbox.
	- Behaviour: Shows list of active conversations; tapping a conversation opens `chat_screen.dart`.

- `profile_screen.dart`
	- Purpose: View a user's own profile or another user's public profile (depending on navigation).
	- Behaviour: Shows photos, bio, interests, and actions such as edit (if own profile), like, or message.

- `subscriptions_screen.dart`
	- Purpose: Manage in-app purchases / premium plans.
	- Behaviour: Presents available subscription tiers, benefits, prices, and purchase buttons. (Actual purchase integration may require platform setup and backend.)

- `settings_screen.dart`
	- Purpose: App preferences and account management.
	- Behaviour: Toggle push notifications, privacy options, logout, and other app-level settings.

---

## Reusable widgets

- `lib/widgets/profile_card.dart`
	- Purpose: Compact, reusable UI used in discovery lists and other places to display user photo, name, age and short bio snippet.

You can add other widgets here for common components like buttons, dialogs, and form inputs.

---

## Assets and launcher icon

- The project includes `assets/images/icon.png` and `pubspec.yaml` is configured to include `assets/images/` in the `flutter.assets` section.
- `flutter_launcher_icons` is declared in `dev_dependencies` and a `flutter_icons` section is present in `pubspec.yaml` pointing to `assets/images/icon.png`.

Commands (PowerShell) to install deps and generate platform icons:

```powershell
flutter pub get
flutter pub run flutter_launcher_icons:main
```

Notes when running the commands:
- Run the commands from the project root (`mubssure/`).
- The `flutter_launcher_icons` tool will generate Android and iOS launcher icons from `assets/images/icon.png` and place them into the respective platform directories.

Verification locations after generation:
- Android: `android/app/src/main/res/mipmap-*/ic_launcher*.png` and adaptive icon XML under `mipmap-anydpi-v26` if adaptive icons were generated.
- iOS: `ios/Runner/Assets.xcassets/AppIcon.appiconset/` — verify the PNG files and `Contents.json` are present.

Adaptive icons note:
- The current `flutter_icons` configuration is minimal (single `image_path`). If you want adaptive Android icons (foreground + background), add `adaptive_icon_background`, `adaptive_icon_foreground` or `adaptive: true` to the `flutter_icons` section and provide suitable images.

---

## How to run the app locally

1. Ensure Flutter SDK is installed and on PATH.
2. From project root run:

```powershell
flutter pub get
# (optional) generate launcher icons
flutter pub run flutter_launcher_icons:main
flutter run -d <deviceId>
```

3. Use an available device or emulator. For Android use `flutter emulators --launch <name>` or start an emulator from Android Studio.

---

## Tests & Linting

- `flutter_test` is available in `dev_dependencies`. Add widget/unit tests in `test/` and run `flutter test`.
- `flutter_lints` is present; run `flutter analyze` to check for lints and static issues.

---

## Common development notes and caveats

- Make sure `flutter_launcher_icons` version is compatible with your Flutter SDK. If icon generation fails, try upgrading the package or consult the plugin docs.
- Platform-specific features (in-app purchases, push notifications) need platform setup (store keys, entitlements, Firebase config).
- If images fail to load at runtime, confirm `pubspec.yaml` indentation is correct and assets listed are available under `assets/images/`.

---

## Next steps / Suggestions

- Add adaptive icon images to improve Android launchers.
- Add more in-app documentation screens or a help center accessible from `settings_screen.dart`.
- Add automated tests for critical UI flows (signup, create profile, discover, messaging).
- Integrate analytics and crash reporting for production monitoring.

---

## Contact / contributor notes

If you are contributing, follow these guidelines:
- Create a feature branch and open pull requests against `main`.
- Run `flutter analyze` and `flutter test` before submitting changes.
- Update this documentation if you add new screens or change navigation.

Thank you for working on Mubssure — this document should help new contributors and reviewers quickly understand the app structure and how to run/verify launcher icons and assets.

