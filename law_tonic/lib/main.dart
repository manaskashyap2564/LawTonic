import 'package:flutter/material.dart';
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

void main() {
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
          primary: Colors.purple[700],
          secondary: Colors.purple[400],
          surface: Colors.purple[50],
          background: Colors.white,
          error: Colors.red[700],
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.purple[900],
          onBackground: Colors.purple[900],
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.purple[50],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple[100],
          foregroundColor: Colors.purple[900],
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.purple[900],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        cardTheme: CardTheme(
          elevation: 2,
          margin: const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Colors.purple[100]?.withOpacity(0.7),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple[600],
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.purple[700],
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.purple[300]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.purple[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.purple[700]!, width: 2),
          ),
          labelStyle: TextStyle(color: Colors.purple[700]),
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.purple[50],
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.purple[700],
          unselectedItemColor: Colors.purple[300],
          backgroundColor: Colors.purple[100],
        ),
        // typography: Typography.material2021(platform: TargetPlatform.android).copyWith(
        //   bodyLarge: TextStyle(color: Colors.purple[800]),
        //   bodyMedium: TextStyle(color: Colors.purple[700]),
        //   displayLarge: TextStyle(color: Colors.purple[900]),
        //   // etc.
        // ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        CivilLawPage.routeName: (context) => const CivilLawPage(),
        CriminalLawPage.routeName: (context) => const CriminalLawPage(),
        TrafficLawPage.routeName: (context) => const TrafficLawPage(),
        CyberLawPage.routeName: (context) => const CyberLawPage(),
        DailyNewsPage.routeName: (context) => const DailyNewsPage(),
        AboutPage.routeName: (context) => const AboutPage(),
        ContactUsPage.routeName: (context) => const ContactUsPage(),
        LoginSignupPage.routeName: (context) => const LoginSignupPage(),
        CommunityPage.routeName: (context) => const CommunityPage(),
      },
    );
  }
}
