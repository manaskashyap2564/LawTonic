import 'package:flutter/material.dart';

// Placeholder for a NewsArticle model. In a real app, this would be in lib/models/news_article.dart
class NewsArticle {
  final String id;
  final String title;
  final String snippet;
  final DateTime date;
  final String fullContent;

  NewsArticle({
    required this.id,
    required this.title,
    required this.snippet,
    required this.date,
    required this.fullContent,
  });
}

class DailyNewsPage extends StatefulWidget {
  const DailyNewsPage({super.key});
  static const String routeName = '/daily_news';

  @override
  State<DailyNewsPage> createState() => _DailyNewsPageState();
}

class _DailyNewsPageState extends State<DailyNewsPage> {
  // Sample news data
  final List<NewsArticle> _newsArticles = List.generate(
    10,
    (index) => NewsArticle(
      id: 'news_${index + 1}',
      title: 'Important Legal Update ${index + 1}: New Regulation Passed',
      snippet: 'A brief overview of the new regulation concerning area X. This change will impact Y and Z sectors significantly. Citizens are advised to take note of these changes which come into effect from next month.',
      date: DateTime.now().subtract(Duration(days: index)),
      fullContent: 'This is the full detailed content for News Article ${index + 1}. It would contain several paragraphs explaining the legal update, its implications, and expert opinions. For now, it is just a placeholder to demonstrate navigation and data handling.',
    ),
  );

  NewsArticle? _selectedArticle;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Check if we navigated here with a specific news item ID (e.g., from home page carousel)
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (arguments != null && arguments.containsKey('newsId')) {
      final newsId = arguments['newsId'];
      // In a real app, you'd fetch the article by ID. Here we simulate it.
      // The ID from carousel is an index, so we find by that.
      if (newsId is int && newsId >= 0 && newsId < _newsArticles.length) {
          _selectedArticle = _newsArticles[newsId];
      }
    }
  }

  void _viewArticle(NewsArticle article) {
    setState(() {
      _selectedArticle = article;
    });
    // In a more complex app, you might navigate to a new screen for the full article
    // For now, we'll display it within this page or show a dialog.
    // Or, if already on a "details" view triggered by arguments, this might do nothing new.
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedArticle == null ? 'Daily Law News' : _selectedArticle!.title),
        leading: _selectedArticle != null
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _selectedArticle = null; // Go back to the list view
                  });
                },
              )
            : null,
      ),
      body: _selectedArticle == null
          ? _buildNewsList(theme)
          : _buildArticleDetail(_selectedArticle!, theme),
    );
  }

  Widget _buildNewsList(ThemeData theme) {
    if (_newsArticles.isEmpty) {
      return const Center(child: Text('No news articles available at the moment.'));
    }
    return ListView.builder(
      itemCount: _newsArticles.length,
      itemBuilder: (context, index) {
        final article = _newsArticles[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ListTile(
            title: Text(
              article.title,
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4.0),
                Text(
                  article.snippet,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 8.0),
                Text(
                  '${article.date.day}/${article.date.month}/${article.date.year}',
                  style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.outline),
                ),
              ],
            ),
            isThreeLine: true, // Adjust if snippet makes it taller
            onTap: () => _viewArticle(article),
          ),
        );
      },
    );
  }

  Widget _buildArticleDetail(NewsArticle article, ThemeData theme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article.title,
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.onBackground),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Published: ${article.date.day}/${article.date.month}/${article.date.year}',
            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.outline),
          ),
          const SizedBox(height: 16.0),
          Text(
            article.fullContent,
            style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onBackground, height: 1.5),
          ),
          const SizedBox(height: 24.0),
          ElevatedButton.icon(
            icon: const Icon(Icons.list_alt),
            label: const Text('Back to News List'),
            onPressed: () {
              setState(() {
                _selectedArticle = null;
              });
            },
          )
        ],
      ),
    );
  }
}
