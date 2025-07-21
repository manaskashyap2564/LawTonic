import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lawtonic/models/law_model.dart';
import 'package:lawtonic/models/news_model.dart';
import 'package:lawtonic/models/user_model.dart';
import 'package:lawtonic/models/community_post_model.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Laws
  Future<void> addLaw(Law law) {
    return _db.collection('laws').add({
      'title': law.title,
      'description': law.description,
      'category': law.category,
      'language': law.language,
    });
  }

  Stream<List<Law>> getLaws() {
    return _db.collection('laws').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Law(
          id: doc.id,
          title: doc['title'],
          description: doc['description'],
          category: doc['category'],
          language: doc['language'],
        )).toList());
  }

  // News
  Future<void> addNews(News news) {
    return _db.collection('news').add({
      'title': news.title,
      'summary': news.summary,
      'content': news.content,
      'url': news.url,
      'timestamp': news.timestamp,
    });
  }

  Stream<List<News>> getNews() {
    return _db.collection('news').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => News(
          id: doc.id,
          title: doc['title'],
          summary: doc['summary'],
          content: doc['content'],
          url: doc['url'],
          timestamp: (doc['timestamp'] as Timestamp).toDate(),
        )).toList());
  }

  // Users
  Future<void> addUser(UserModel user) {
    return _db.collection('users').doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'bookmarks': user.bookmarks,
      'language_pref': user.languagePref,
    });
  }

  Stream<UserModel> getUser(String id) {
    return _db.collection('users').doc(id).snapshots().map((snapshot) => UserModel(
      id: snapshot.id,
      email: snapshot['email'],
      name: snapshot['name'],
      bookmarks: List<String>.from(snapshot['bookmarks']),
      languagePref: snapshot['language_pref'],
    ));
  }

  Future<void> updateUser(UserModel user) {
    return _db.collection('users').doc(user.id).update({
      'email': user.email,
      'name': user.name,
      'bookmarks': user.bookmarks,
      'language_pref': user.languagePref,
    });
  }

  // Community Posts
  Future<void> addCommunityPost(CommunityPost post) {
    return _db.collection('community_posts').add({
      'title': post.title,
      'content': post.content,
      'author': post.author,
      'timestamp': post.timestamp,
    });
  }

  Stream<List<CommunityPost>> getCommunityPosts() {
    return _db.collection('community_posts')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => CommunityPost(
          id: doc.id,
          title: doc['title'],
          content: doc['content'],
          author: doc['author'],
          timestamp: (doc['timestamp'] as Timestamp).toDate(),
        )).toList());
  }
}
