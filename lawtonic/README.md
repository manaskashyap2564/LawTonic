# LawTonic

A Flutter project that simplifies Indian laws for students & citizens.

## Description

This project aims to provide an easy-to-use mobile application for accessing information about various Indian laws, including Civil, Criminal, Traffic, and Cyber laws. It also features a daily news section to keep users updated on the latest legal developments.

## Firebase Setup

1.  **Create a Firebase Project:**
    *   Go to the [Firebase Console](https://console.firebase.google.com/).
    *   Create a new project named `LawTonic`.

2.  **Add Firebase to your apps:**
    *   **Android:**
        *   Add an Android app to your Firebase project with the package name `com.example.law_tonic`.
        *   Download the `google-services.json` file and place it in the `android/app/` directory.
    *   **iOS:**
        *   Add an iOS app to your Firebase project with the bundle ID `com.example.lawTonic`.
        *   Download the `GoogleService-Info.plist` file and place it in the `ios/Runner/` directory.
    *   **Web:**
        *   Add a web app to your Firebase project.
        *   Copy the Firebase SDK configuration snippet.
        *   Replace the placeholder configuration in `lib/main.dart` with your actual configuration.

3.  **Enable Firebase Services:**
    *   In the Firebase Console, enable the following services:
        *   Authentication (Email/Password and Google)
        *   Firestore Database
        *   Firebase Storage
        *   Firebase Hosting (for web deployment)

## Setup Instructions

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/LawTonic.git
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run the app:**
   ```bash
   flutter run
   ```

## Folder Structure

- `lib/`: Contains all the Dart code for the application.
  - `main.dart`: The entry point of the application.
  - `pages/`: Contains all the UI pages of the application.
    - `home_page.dart`: The main screen of the app.
    - `civil_law_page.dart`: Page for Civil Law content.
    - `criminal_law_page.dart`: Page for Criminal Law content.
    - `traffic_law_page.dart`: Page for Traffic Law content.
    - `cyber_law_page.dart`: Page for Cyber Law content.
    - `daily_news_page.dart`: Page for daily news articles.
    - `about_page.dart`: Page with information about the app.
    - `contact_us_page.dart`: Page with a contact form.
    - `login_signup_page.dart`: Page for user authentication.
    - `community_page.dart`: Page for community interaction.
- `test/`: Contains all the tests for the application.

## How to Extend Pages

To add a new page, you can create a new Dart file in the `lib/pages/` directory and add a new route in `lib/main.dart`.

## CI/CD

This project uses GitHub Actions to automate the build and test process. The workflow is defined in `.github/workflows/flutter_ci.yml` and is triggered on every push or pull request to the `main` and `dev` branches.

## DevTools

To use Flutter DevTools, run the following commands:

```bash
flutter pub global activate devtools
flutter pub global run devtools
```

## Contribution Guide

Contributions are welcome! Please open an issue or submit a pull request for any changes.
