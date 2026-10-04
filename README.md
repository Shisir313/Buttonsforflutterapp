# Material Buttons and Navigation in Flutter

A modern, polished Flutter mobile application built as a college practical assignment demonstrating **Material Design 3 buttons**, **navigation patterns**, **state management**, **dialogs**, and **responsive UI layouts**.

---

## 📱 Application Screens & Features

1. **Login Screen (`/`)**:
   - Email input field with email icon and client-side form validation.
   - Password input field with lock icon, visibility toggle, and validation.
   - Demo login button navigating to the Button Gallery using `Navigator.pushReplacementNamed()`, ensuring the user cannot return to login via the back button.

2. **Button Gallery Screen (`/buttons`)**:
   - The main interactive screen showcasing **9 distinct Material 3 button types**:
     1. `ElevatedButton` (triggers a SnackBar)
     2. `FilledButton` (opens Details Screen)
     3. `FilledButton.tonal` (opens Settings Screen)
     4. `OutlinedButton` (opens Profile Screen)
     5. `TextButton` (displays informational message)
     6. `IconButton` (navigates to Profile Screen)
     7. `FloatingActionButton` (opens Add Item Dialog)
     8. `FilledButton.icon` (navigates to Details Screen)
     9. Custom-Styled Button (styled with `styleFrom()`, custom colors, elevation, and rounded corners)
   - Includes Quick Navigation cards and top app bar actions for Profile, Settings, and Logout.

3. **Profile Screen (`/profile`)**:
   - Displays a circular student avatar, Name (*Milan*), Role (*Student*), and Email (*student@example.com*).
   - Features an "Edit Profile" dialog and a Back button using `Navigator.pop()`.

4. **Details Screen (`/details`)**:
   - Displays app documentation ("About This Application"), core features, informational items with icons, and a Back button (`Navigator.pop()`).

5. **Settings Screen (`/settings`)**:
   - Interactive toggles for Notifications, Dark Mode (demo), and Sound Effects using `StatefulWidget`.
   - Save Settings confirmation SnackBar and Back navigation.

---

## 🧭 Navigation Techniques Demonstrated

- **`Navigator.pushNamed()` / `Navigator.push()`**: Used for navigating from the Gallery to child screens (Profile, Details, Settings).
- **`Navigator.pop()`**: Used in back buttons and dialogs to return to the previous screen or close modals.
- **`Navigator.pushReplacementNamed()`**: Used on successful login and logout to manage the navigation stack securely.
- **Named Routes**: Configured in `MaterialApp` (`/`, `/buttons`, `/profile`, `/details`, `/settings`).

---

## 🚀 Getting Started & Setup

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed (Dart ^3.13.4).
- Android Studio / VS Code with Flutter extensions.

### Installation & Execution
1. Clone or open the project directory in your terminal or IDE:
   ```bash
   cd flutter_buttons_navigation
   ```
2. Get project dependencies:
   ```bash
   flutter pub get
   ```
3. Run the application on an emulator or connected device:
   ```bash
   flutter run
   ```

---

## 📷 Screenshots

*Place screenshots in the `screenshots/` directory:*
- `screenshots/login_screen.png`
- `screenshots/button_gallery.png`
- `screenshots/profile_screen.png`
- `screenshots/details_screen.png`
- `screenshots/settings_screen.png`

---

## 🛠️ Code Structure

```text
lib/
├── main.dart               # Entry point
├── app.dart                # MaterialApp, themes, and named routes
├── screens/
│   ├── login_screen.dart           # Screen 1: Login
│   ├── button_gallery_screen.dart  # Screen 2: Button Gallery (Main)
│   ├── profile_screen.dart         # Screen 3: Profile
│   ├── details_screen.dart         # Screen 4: Details
│   └── settings_screen.dart        # Screen 5: Settings
└── widgets/
    ├── button_card.dart            # Reusable button showcase card
    ├── section_heading.dart        # Section title widget
    └── profile_info_row.dart       # Profile details row widget
```

---

## 🧪 Validation & Quality Checks
- Formatted code: `dart format lib`
- Analyzed code: `flutter analyze` (Zero warnings/errors)
