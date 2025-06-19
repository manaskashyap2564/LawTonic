import 'package:flutter/material.dart';
import 'package:law_tonic/pages/about_page.dart';
import 'package:law_tonic/pages/civil_law_page.dart';
import 'package:law_tonic/pages/contact_us_page.dart';
import 'package:law_tonic/pages/criminal_law_page.dart';
import 'package:law_tonic/pages/cyber_law_page.dart';
import 'package:law_tonic/pages/daily_news_page.dart';
import 'package:law_tonic/pages/login_signup_page.dart';
import 'package:law_tonic/pages/traffic_law_page.dart';
// import 'package:law_tonic/widgets/custom_card.dart'; // Assuming a reusable card widget

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isEnglish = true;

  void _toggleLanguage() {
    setState(() {
      _isEnglish = !_isEnglish;
    });
    // In a real app, you would also save this preference and update localization.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(_isEnglish ? 'Language set to English' : 'भाषा हिंदी में सेट है')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Indian Laws Explained'),
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.login),
            label: const Text('Login/Sign Up'),
            onPressed: () {
              Navigator.pushNamed(context, LoginSignupPage.routeName);
            },
            style: TextButton.styleFrom(
                foregroundColor: theme.appBarTheme.foregroundColor),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Settings',
                    style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _isEnglish ? 'Language:' : 'भाषा:',
                        style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer),
                      ),
                      Switch(
                        value: _isEnglish,
                        onChanged: (value) {
                          _toggleLanguage();
                           Navigator.pop(context); // Close drawer after toggle
                        },
                        activeTrackColor: theme.colorScheme.primary,
                        inactiveThumbColor: theme.colorScheme.outline,
                      ),
                      Text(
                        _isEnglish ? 'EN' : 'हिं',
                         style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.bookmarks_outlined),
              title: Text(_isEnglish ? 'Bookmarks' : 'बुकमार्क'),
              onTap: () {
                // Navigate to Bookmarks page or show dialog
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Bookmarks page coming soon!')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.download_outlined),
              title: Text(_isEnglish ? 'Download PDFs' : 'पीडीएफ डाउनलोड करें'),
              onTap: () {
                // Implement PDF download functionality
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('PDF Downloads coming soon!')),
                );
              },
            ),
            const Divider(),
             ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text(_isEnglish ? 'About App' : 'ऐप के बारे में'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.pushNamed(context, AboutPage.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail_outlined),
              title: Text(_isEnglish ? 'Contact Us' : 'हमसे संपर्क करें'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.pushNamed(context, ContactUsPage.routeName);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _isEnglish ? 'Law Categories' : 'कानून श्रेणियां',
              style: theme.textTheme.titleLarge
                  ?.copyWith(color: theme.colorScheme.onBackground),
            ),
            const SizedBox(height: 16.0),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: <Widget>[
                _buildLawCategoryCard(
                  context,
                  title: _isEnglish ? 'Civil Law' : 'नागरिक कानून',
                  icon: Icons.account_balance,
                  routeName: CivilLawPage.routeName,
                  theme: theme,
                ),
                _buildLawCategoryCard(
                  context,
                  title: _isEnglish ? 'Criminal Law' : 'आपराधिक कानून',
                  icon: Icons.gavel,
                  routeName: CriminalLawPage.routeName,
                  theme: theme,
                ),
                _buildLawCategoryCard(
                  context,
                  title: _isEnglish ? 'Traffic Law' : 'यातायात कानून',
                  icon: Icons.traffic,
                  routeName: TrafficLawPage.routeName,
                  theme: theme,
                ),
                _buildLawCategoryCard(
                  context,
                  title: _isEnglish ? 'Cyber Law' : 'साइबर कानून',
                  icon: Icons.security,
                  routeName: CyberLawPage.routeName,
                  theme: theme,
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            Text(
              _isEnglish ? 'Daily Law News' : 'दैनिक कानून समाचार',
              style: theme.textTheme.titleLarge
                  ?.copyWith(color: theme.colorScheme.onBackground),
            ),
            const SizedBox(height: 16.0),
            _buildNewsCarousel(context, theme),
            const SizedBox(height: 24.0),
            // Moved About and Contact Us to Drawer, but can keep buttons if desired
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     ElevatedButton.icon(
            //       icon: const Icon(Icons.info_outline),
            //       label: Text(_isEnglish ? 'About App' : 'ऐप के बारे में'),
            //       onPressed: () {
            //         Navigator.pushNamed(context, AboutPage.routeName);
            //       },
            //     ),
            //     ElevatedButton.icon(
            //       icon: const Icon(Icons.contact_mail_outline),
            //       label: Text(_isEnglish ? 'Contact Us' : 'हमसे संपर्क करें'),
            //       onPressed: () {
            //         Navigator.pushNamed(context, ContactUsPage.routeName);
            //       },
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildLawCategoryCard(BuildContext context,
      {required String title,
      required IconData icon,
      required String routeName,
      required ThemeData theme}) {
    // This could be extracted to a reusable widget: lib/widgets/custom_category_card.dart
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        borderRadius: BorderRadius.circular(12), // Match Card's shape
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 48.0, color: theme.colorScheme.primary),
              const SizedBox(height: 12.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium
                    ?.copyWith(color: theme.colorScheme.onSurface),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewsCarousel(BuildContext context, ThemeData theme) {
    // Placeholder for news carousel
    return SizedBox(
      height: 180.0, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Placeholder item count
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Navigate to specific news article in DailyNewsPage
              // For now, just opens the page. Pass article ID in real app.
              Navigator.pushNamed(context, DailyNewsPage.routeName, arguments: {'newsId': index});
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 250.0, // Adjust width as needed
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'News Headline ${index + 1}',
                      style: theme.textTheme.titleSmall
                          ?.copyWith(color: theme.colorScheme.onSurface, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Brief snippet of the news article will go here. This is placeholder text...',
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                     const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Read more...',
                        style: theme.textTheme.labelSmall
                            ?.copyWith(color: theme.colorScheme.primary),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
