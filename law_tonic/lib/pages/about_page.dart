import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  static const String routeName = '/about';

  // In a real app, you might get this from package_info_plus or similar
  final String appVersion = '1.0.0';
  final String buildNumber = '1';

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('About LawTonic'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'LawTonic',
              style: theme.textTheme.headlineMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Simplifying Indian Laws for Students & Citizens.',
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Our mission is to make legal information accessible and understandable to everyone in India. Whether you are a law student, a professional, or a curious citizen, LawTonic aims to be your go-to resource for clear and concise explanations of Indian legal frameworks.',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onBackground.withOpacity(0.85),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle('Key Features:', theme),
            const SizedBox(height: 8.0),
            _buildFeatureListItem('Categorized explanations of Civil, Criminal, Traffic, and Cyber laws.', theme),
            _buildFeatureListItem('Daily legal news updates to keep you informed.', theme),
            _buildFeatureListItem('Community forum for discussions and knowledge sharing.', theme),
            _buildFeatureListItem('User-friendly interface with Material 3 design.', theme),
            // Add more features as they are developed
            const SizedBox(height: 24.0),
            _buildSectionTitle('Version Information:', theme),
            const SizedBox(height: 8.0),
            Text(
              'App Version: $appVersion',
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onBackground),
            ),
            Text(
              'Build Number: $buildNumber',
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onBackground),
            ),
            // In a real app, you might also include copyright info or links to privacy policy/terms of service.
            const SizedBox(height: 32.0),
            Center(
              child: Text(
                '© ${DateTime.now().year} LawTonic App',
                style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.outline),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, ThemeData theme) {
    return Text(
      title,
      style: theme.textTheme.titleMedium?.copyWith(
        color: theme.colorScheme.secondary,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildFeatureListItem(String text, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle_outline, size: 18.0, color: theme.colorScheme.primary),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onBackground.withOpacity(0.75)),
            ),
          ),
        ],
      ),
    );
  }
}
