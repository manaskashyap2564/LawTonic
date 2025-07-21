// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:lawtonic/firebase_options.dart';
// import 'package:lawtonic/pages/home_page.dart';
// import 'package:lawtonic/pages/login_signup_page.dart';
// import 'package:lawtonic/services/auth_service.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Load .env once
//   await dotenv.load(fileName: ".env");

//   // Initialize Firebase only if not already initialized
//   if (Firebase.apps.isEmpty) {
//     await Firebase.initializeApp(
//       options: await DefaultFirebaseOptions.currentPlatform,
//     );
//   }

//   runApp(const LawTonicApp());
// }

// class LawTonicApp extends StatelessWidget {
//   const LawTonicApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'LawTonic',
//       theme: ThemeData(useMaterial3: true),
//       localizationsDelegates: const [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: const [
//         Locale('en', ''), Locale('hi', ''),
//       ],
//       home: StreamBuilder(
//         stream: AuthService().user,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             return snapshot.hasData ? const HomePage() : const LoginSignupPage();
//           }
//           return const Scaffold(body: Center(child: CircularProgressIndicator()));
//         },
//       ),
//       routes: {
//         '/home': (_) => const HomePage(),
//         '/login_signup': (_) => const LoginSignupPage(),
//         // ... other routes
//       },
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:lawtonic/firebase_options.dart';
// import 'package:lawtonic/pages/home_page.dart';
// import 'package:lawtonic/pages/civil_law_page.dart';
// import 'package:lawtonic/pages/criminal_law_page.dart';
// import 'package:lawtonic/pages/traffic_law_page.dart';
// import 'package:lawtonic/pages/cyber_law_page.dart';
// import 'package:lawtonic/pages/daily_news_page.dart';
// import 'package:lawtonic/pages/about_page.dart';
// import 'package:lawtonic/pages/contact_us_page.dart';
// import 'package:lawtonic/pages/login_signup_page.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:lawtonic/pages/community_page.dart';
// import 'package:lawtonic/pages/bookmarks_page.dart';
// import 'package:lawtonic/pages/legal_resources_page.dart';
// import 'package:lawtonic/services/auth_service.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await dotenv.load(fileName: ".env"); // ✅ dotenv load here
//   await Firebase.initializeApp(
//     options: await DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const LawTonicApp());
// }

// class LawTonicApp extends StatelessWidget {
//   const LawTonicApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'LawTonic',
//       theme: ThemeData(
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.purple,
//           primary: Colors.purple[100],
//           secondary: Colors.purple[50],
//         ),
//       ),
//       localizationsDelegates: const [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: const [
//         Locale('en', ''),
//         Locale('hi', ''),
//       ],
//       home: StreamBuilder(
//         stream: AuthService().user,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             if (snapshot.hasData) {
//               return const HomePage();
//             }
//             return const LoginSignupPage();
//           }
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         },
//       ),
//       routes: {
//         '/home': (context) => const HomePage(),
//         '/civil_law': (context) => const CivilLawPage(),
//         '/criminal_law': (context) => const CriminalLawPage(),
//         '/traffic_law': (context) => const TrafficLawPage(),
//         '/cyber_law': (context) => const CyberLawPage(),
//         '/daily_news': (context) => const DailyNewsPage(),
//         '/about': (context) => const AboutPage(),
//         '/contact_us': (context) => const ContactUsPage(),
//         '/login_signup': (context) => const LoginSignupPage(),
//         '/community': (context) => const CommunityPage(),
//         '/bookmarks': (context) => BookmarksPage(),
//         '/legal_resources': (context) => const LegalResourcesPage(),
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lawtonic/firebase_options.dart';
import 'package:lawtonic/pages/home_page.dart';
import 'package:lawtonic/pages/civil_law_page.dart';
import 'package:lawtonic/pages/criminal_law_page.dart';
import 'package:lawtonic/pages/traffic_law_page.dart';
import 'package:lawtonic/pages/cyber_law_page.dart';
import 'package:lawtonic/pages/daily_news_page.dart';
import 'package:lawtonic/pages/about_page.dart';
import 'package:lawtonic/pages/contact_us_page.dart';
import 'package:lawtonic/pages/login_signup_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lawtonic/pages/community_page.dart';
import 'package:lawtonic/pages/bookmarks_page.dart';
import 'package:lawtonic/pages/legal_resources_page.dart';
import 'package:lawtonic/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: await DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const LawTonicApp());
}

class LawTonicApp extends StatelessWidget {
  const LawTonicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LawTonic',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          primary: Colors.purple[100],
          secondary: Colors.purple[50],
        ),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('hi', ''), // Hindi, no country code
      ],
      home: StreamBuilder(
        stream: AuthService().user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const HomePage();
            }
            return const LoginSignupPage();
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
      routes: {
        '/home': (context) => const HomePage(),
        '/civil_law': (context) => const CivilLawPage(),
        '/criminal_law': (context) => const CriminalLawPage(),
        '/traffic_law': (context) => const TrafficLawPage(),
        '/cyber_law': (context) => const CyberLawPage(),
        '/daily_news': (context) => const DailyNewsPage(),
        '/about': (context) => const AboutPage(),
        '/contact_us': (context) => const ContactUsPage(),
        '/login_signup': (context) => const LoginSignupPage(),
        '/community': (context) => const CommunityPage(),
        '/bookmarks': (context) => BookmarksPage(),
        '/legal_resources': (context) => const LegalResourcesPage(),
      },
    );
  }
}
