import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:law_tonic/firebase_options.dart';
import 'package:law_tonic/pages/home_page.dart';
import 'package:law_tonic/pages/civil_law_page.dart';
import 'package:law_tonic/pages/criminal_law_page.dart';
import 'package:law_tonic/pages/traffic_law_page.dart';
import 'package:law_tonic/pages/cyber_law_page.dart';
import 'package:law_tonic/pages/daily_news_page.dart';
import 'package:law_tonic/pages/about_page.dart';
import 'package:law_tonic/pages/contact_us_page.dart';
import 'package:law_tonic/pages/login_signup_page.dart';
import 'package:law_tonic/pages/community_page.dart';

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
      home: const HomePage(),
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
        '/bookmarks': (context) => const BookmarksPage(),
      },
    );
  }
}
