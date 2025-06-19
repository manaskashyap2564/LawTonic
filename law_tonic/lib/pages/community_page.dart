import 'package:flutter/material.dart';

// Placeholder for a Post model. In a real app, this would be in lib/models/post.dart
class Post {
  final String id;
  final String userName;
  final String userImageUrl; // Placeholder, could use a default icon
  final String content;
  final DateTime timestamp;
  final int likes;
  final int comments;

  Post({
    required this.id,
    required this.userName,
    required this.userImageUrl,
    required this.content,
    required this.timestamp,
    this.likes = 0,
    this.comments = 0,
  });
}

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});
  static const String routeName = '/community';

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  // Sample posts data
  final List<Post> _posts = [
    Post(
      id: 'post1',
      userName: 'LegalEagle101',
      userImageUrl: '', // Placeholder
      content: 'Just learned about a fascinating aspect of contract law regarding digital signatures. Does anyone have experience with enforcing such contracts in India?',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      likes: 15,
      comments: 4,
    ),
    Post(
      id: 'post2',
      userName: 'LawStudent22',
      userImageUrl: '', // Placeholder
      content: 'Preparing for my criminal law exam. Any tips on understanding the nuances between culpable homicide and murder under the IPC?',
      timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      likes: 22,
      comments: 8,
    ),
    Post(
      id: 'post3',
      userName: 'CitizenRightsAdvocate',
      userImageUrl: '', // Placeholder
      content: 'Traffic challans seem to be on the rise in my city. Is there a proper procedure to contest a wrongly issued challan? Sharing experiences would be helpful.',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      likes: 30,
      comments: 12,
    ),
     Post(
      id: 'post4',
      userName: 'CyberAware',
      userImageUrl: '', // Placeholder
      content: 'What are the key provisions under the IT Act, 2000 for data protection that every individual should be aware of?',
      timestamp: DateTime.now().subtract(const Duration(days: 2, hours: 3)),
      likes: 18,
      comments: 5,
    ),
  ];

  void _addNewPost() {
    // In a real app, this would navigate to a new post creation screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('New Post creation feature coming soon!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Forum'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: theme.colorScheme.secondaryContainer,
                        child: Icon(Icons.person, color: theme.colorScheme.onSecondaryContainer),
                        // backgroundImage: post.userImageUrl.isNotEmpty ? NetworkImage(post.userImageUrl) : null,
                        // onBackgroundImageError: post.userImageUrl.isNotEmpty ? (_, __) {} : null, // Handle error if image fails
                      ),
                      const SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.userName,
                            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface),
                          ),
                          Text(
                            '${post.timestamp.hour}:${post.timestamp.minute.toString().padLeft(2, '0')} - ${post.timestamp.day}/${post.timestamp.month}/${post.timestamp.year}',
                            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    post.content,
                    style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant, height: 1.4),
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        icon: Icon(Icons.thumb_up_alt_outlined, size: 18, color: theme.colorScheme.primary),
                        label: Text('${post.likes}', style: TextStyle(color: theme.colorScheme.primary)),
                        onPressed: () { /* Implement like functionality */ },
                      ),
                      const SizedBox(width: 12.0),
                      TextButton.icon(
                        icon: Icon(Icons.comment_outlined, size: 18, color: theme.colorScheme.secondary),
                        label: Text('${post.comments}', style: TextStyle(color: theme.colorScheme.secondary)),
                        onPressed: () { /* Implement comment functionality */ },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addNewPost,
        label: const Text('New Post'),
        icon: const Icon(Icons.edit_outlined),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
    );
  }
}
