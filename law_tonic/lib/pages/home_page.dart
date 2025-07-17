import 'package:flutter/material.dart';
import 'package:law_tonic/models/news_model.dart';
import 'package:law_tonic/services/auth_service.dart';
import 'package:law_tonic/services/database_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indian Laws Explained'),
        actions: [
          StreamBuilder(
            stream: auth.user,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () async {
                    await auth.signOut();
                  },
                );
              } else {
                return TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login_signup');
                  },
                  child: const Text('Login/Sign Up'),
                );
              }
            },
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
                Navigator.pushNamed(context, '/bookmarks');
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
              LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.count(
                    crossAxisCount: constraints.maxWidth > 600 ? 4 : 2,
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
                  );
                },
              ),
              const SizedBox(height: 24),
              const Text(
                'Daily Law News',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildDailyNewsCarousel(),
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

  Widget _buildDailyNewsCarousel() {
    final DatabaseService db = DatabaseService();
    return SizedBox(
      height: 150,
      child: StreamBuilder<List<News>>(
        stream: db.getNews(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong.'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final news = snapshot.data!;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: news.length,
            itemBuilder: (context, index) {
              final item = news[index];
              return _buildNewsCarouselItem(context, item.title, item.summary);
            },
          );
        },
      ),
    );
  }
}
