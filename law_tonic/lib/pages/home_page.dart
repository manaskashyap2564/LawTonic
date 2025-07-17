import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indian Laws Explained'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login_signup');
            },
            child: const Text('Login/Sign Up'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Hindi/English'),
              onTap: () {
                // Add language toggle logic here
              },
            ),
            ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text('Bookmarks'),
              onTap: () {
                // Add bookmark navigation logic here
              },
            ),
            ListTile(
              leading: const Icon(Icons.download),
              title: const Text('Download PDFs'),
              onTap: () {
                // Add PDF download logic here
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildGridCard(context, 'Civil Law', Icons.account_balance, '/civil_law'),
                  _buildGridCard(context, 'Criminal Law', Icons.gavel, '/criminal_law'),
                  _buildGridCard(context, 'Traffic Law', Icons.traffic, '/traffic_law'),
                  _buildGridCard(context, 'Cyber Law', Icons.security, '/cyber_law'),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Daily Law News',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildNewsCarouselItem(context, 'News 1', 'Snippet 1'),
                    _buildNewsCarouselItem(context, 'News 2', 'Snippet 2'),
                    _buildNewsCarouselItem(context, 'News 3', 'Snippet 3'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  child: const Text('About'),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/contact_us');
                  },
                  child: const Text('Contact Us'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridCard(BuildContext context, String title, IconData icon, String route) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48),
            const SizedBox(height: 16),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCarouselItem(BuildContext context, String title, String snippet) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/daily_news');
      },
      child: Container(
        width: 250,
        margin: const EdgeInsets.only(right: 16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(snippet),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
