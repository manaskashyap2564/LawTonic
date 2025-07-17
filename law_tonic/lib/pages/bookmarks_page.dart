import 'package:flutter/material.dart';
import 'package:law_tonic/models/law_model.dart';
import 'package:law_tonic/models/news_model.dart';
import 'package:law_tonic/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  _BookmarksPageState createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  final DatabaseService _db = DatabaseService();
  final String? userId = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
      ),
      body: userId == null
          ? const Center(child: Text('Please log in to see your bookmarks.'))
          : StreamBuilder<List<dynamic>>(
              stream: _db.getUser(userId!).map((user) => user.bookmarks),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong.'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final bookmarks = snapshot.data!;
                return ListView.builder(
                  itemCount: bookmarks.length,
                  itemBuilder: (context, index) {
                    final bookmark = bookmarks[index];
                    if (bookmark.startsWith('law_')) {
                      return FutureBuilder<Law>(
                        future: _db.getLaws().map((laws) => laws.firstWhere((law) => law.id == bookmark.substring(4))),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const SizedBox.shrink();
                          }
                          final law = snapshot.data!;
                          return ListTile(
                            title: Text(law.title),
                            subtitle: Text(law.category),
                          );
                        },
                      );
                    } else if (bookmark.startsWith('news_')) {
                      return FutureBuilder<News>(
                        future: _db.getNews().map((news) => news.firstWhere((n) => n.id == bookmark.substring(5))),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const SizedBox.shrink();
                          }
                          final news = snapshot.data!;
                          return ListTile(
                            title: Text(news.title),
                            subtitle: Text(news.summary),
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                );
              },
            ),
    );
  }
}
