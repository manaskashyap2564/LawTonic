# LawTonic - Indian Laws Explained

LawTonic is a Flutter application designed to simplify and explain Indian laws for students and citizens. It provides easy access to information on various legal domains, daily legal news, and a community forum for discussions.

## Features

-   **Categorized Law Sections**: Civil, Criminal, Traffic, and Cyber Laws.
-   **Daily Law News**: Stay updated with the latest legal happenings.
-   **Community Forum**: Share tips, ask questions, and engage with other users.
-   **User Authentication**: Secure login and signup functionality.
-   **Bookmarking**: Save important information for quick access.
-   **PDF Downloads**: Download relevant legal documents (conceptual).
-   **Multilingual Support**: Toggle between Hindi and English (conceptual).
-   **User-Friendly Interface**: Built with Material 3 for a modern look and feel.

## Folder Structure

```
law_tonic/
├── android/            # Android specific files
├── ios/                # iOS specific files
├── lib/
│   ├── main.dart       # Main application entry point, routes, theme
│   ├── pages/          # UI screens
│   │   ├── home_page.dart
│   │   ├── civil_law_page.dart
│   │   ├── criminal_law_page.dart
│   │   ├── traffic_law_page.dart
│   │   ├── cyber_law_page.dart
│   │   ├── daily_news_page.dart
│   │   ├── about_page.dart
│   │   ├── contact_us_page.dart
│   │   ├── login_signup_page.dart
│   │   └── community_page.dart
│   ├── widgets/        # Reusable UI components (e.g., custom_card.dart, custom_button.dart)
│   └── models/         # Data models (if any, e.g., news_article.dart)
├── test/               # Unit and widget tests
│   └── home_page_test.dart # Example test
├── web/                # Web specific files (if targeting web)
├── macos/              # macOS specific files (if targeting macOS)
├── windows/            # Windows specific files (if targeting Windows)
├── linux/              # Linux specific files (if targeting Linux)
├── pubspec.yaml        # Project dependencies and metadata
└── README.md           # This file
```

## Setup Instructions

1.  **Clone the repository (if applicable)**:
    ```bash
    git clone <repository_url>
    cd LawTonic
    ```

2.  **Ensure Flutter is installed**:
    Follow the official Flutter installation guide: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)

3.  **Get dependencies**:
    Open your terminal in the `law_tonic` project directory and run:
    ```bash
    flutter pub get
    ```

4.  **Run the application**:
    Make sure you have a connected device (emulator or physical device) and then run:
    ```bash
    flutter run
    ```

## How to Extend Pages

1.  **Create a new Dart file** in the `lib/pages/` directory (e.g., `lib/pages/new_law_category_page.dart`).
2.  **Define your page widget**:
    ```dart
    import 'package:flutter/material.dart';

    class NewLawCategoryPage extends StatelessWidget {
      const NewLawCategoryPage({super.key});

      static const String routeName = '/new_law_category'; // Define a unique route name

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('New Law Category'),
          ),
          body: const Center(
            child: Text('Content for New Law Category Page'),
          ),
        );
      }
    }
    ```
3.  **Add the route** in `lib/main.dart`:
    In the `MaterialApp` widget, add your new page to the `routes` map:
    ```dart
    routes: {
      // ... other routes
      NewLawCategoryPage.routeName: (context) => const NewLawCategoryPage(),
    },
    ```
4.  **Navigate to the new page**:
    Use `Navigator.pushNamed(context, NewLawCategoryPage.routeName);` from any other page or widget.

## Contribution Guide

We welcome contributions to LawTonic! To contribute:

1.  **Fork the repository.**
2.  **Create a new branch** for your feature or bug fix:
    ```bash
    git checkout -b feature/your-feature-name
    ```
    or
    ```bash
    git checkout -b fix/issue-description
    ```
3.  **Make your changes.** Ensure your code follows the project's coding style and best practices.
4.  **Add tests** for any new functionality.
5.  **Ensure all tests pass**:
    ```bash
    flutter test
    ```
6.  **Commit your changes** with a clear and descriptive commit message:
    ```bash
    git commit -m "feat: Add new feature for X"
    ```
    or
    ```bash
    git commit -m "fix: Resolve issue Y in Z component"
    ```
7.  **Push your branch** to your forked repository:
    ```bash
    git push origin feature/your-feature-name
    ```
8.  **Open a Pull Request** to the main LawTonic repository. Provide a detailed description of your changes.

Thank you for helping make LawTonic better!
