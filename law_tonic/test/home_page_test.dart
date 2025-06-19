import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:law_tonic/main.dart'; // To provide theme and routes
import 'package:law_tonic/pages/home_page.dart';

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized(); // Not always needed, but good practice

  Widget createTestableWidget({required Widget child}) {
    return MaterialApp(
      // Minimal theme and route setup for testing,
      // or use LawTonicApp() if it doesn't have too many external dependencies for a unit test.
      // For deeper testing, you might need to mock navigation and other services.
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: child,
      routes: {
        // Define only absolutely necessary routes for this test, or mock them.
        // For instance, if HomePage immediately tries to navigate, that could fail.
        // For a simple "does it render" test, direct child rendering is often enough.
        HomePage.routeName: (context) => const HomePage(),
        // Add other routes if HomePage tries to navigate to them during build/initialization
        // For example, if a button's onPressed is directly called or a future immediately navigates
      },
    );
  }

  // A more robust setup using the actual app's theme and navigation structure
  Widget createLawTonicAppWrapper({required String initialRoute}) {
    return const LawTonicApp(); // This will use the routes and theme from main.dart
                                // We'd then pumpWidget this and find the initialRoute or HomePage
  }


  group('HomePage Widget Tests', () {
    testWidgets('HomePage renders and shows AppBar title', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      // Using LawTonicApp directly is more of a widget/integration test for the home page.
      // For a pure unit test of HomePage, you might mock dependencies it has.
      await tester.pumpWidget(MaterialApp(
        home: const HomePage(),
         routes: { // Add routes that HomePage might try to access if any button is auto-triggered or widget calls Navigator
            '/login_signup': (context) => const Scaffold(body: Text("Mock Login Page")),
            // Add other necessary mock routes here
        },
      ));

      // Verify that the AppBar title is present.
      expect(find.text('Indian Laws Explained'), findsOneWidget);
      // Verify that the Login/Sign Up button is present (example)
      expect(find.widgetWithText(TextButton, 'Login/Sign Up'), findsOneWidget);
    });

    testWidgets('Law category cards are present', (WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget(child: const HomePage()));

      // Scroll to ensure all cards are rendered if layout is scrollable (it's not in current design)
      // await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -300));
      // await tester.pumpAndSettle();

      expect(find.text('Civil Law'), findsOneWidget);
      expect(find.text('Criminal Law'), findsOneWidget);
      expect(find.text('Traffic Law'), findsOneWidget);
      expect(find.text('Cyber Law'), findsOneWidget);
    });

    // Example of how you might test navigation (would require more setup for routes)
    // testWidgets('Tapping Civil Law card navigates', (WidgetTester tester) async {
    //   await tester.pumpWidget(const LawTonicApp()); // Use the main app for navigation testing

    //   // Ensure home page is shown
    //   expect(find.byType(HomePage), findsOneWidget);

    //   // Find the Civil Law card
    //   final civilLawCard = find.widgetWithText(Card, 'Civil Law'); // This might need adjustment based on actual widget tree
    //   expect(civilLawCard, findsOneWidget);

    //   await tester.tap(civilLawCard);
    //   await tester.pumpAndSettle(); // Allow navigation to complete

    //   // Verify that we navigated to CivilLawPage (or a mock of it)
    //   // This requires CivilLawPage.routeName to be correctly pushed and a widget on that page to be found.
    //   expect(find.text('Detailed content on Civil Law will be displayed here.'), findsOneWidget);
    // });

     testWidgets('Drawer can be opened and shows Bookmarks item', (WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget(child: const HomePage()));

      // Open the drawer
      final ScaffoldState state = tester.firstState(find.byType(Scaffold));
      state.openDrawer();
      await tester.pumpAndSettle(); // Wait for drawer animation

      expect(find.text('Bookmarks'), findsOneWidget);
      expect(find.text('Download PDFs'), findsOneWidget);
    });

  });
}
