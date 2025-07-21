import 'package:flutter/material.dart';

class DailyNewsPage extends StatelessWidget {
  const DailyNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Law News'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('News Article ${index + 1}'),
            subtitle: const Text('Snippet of the news article...'),
            trailing: const Text('2023-10-27'),
            onTap: () {
              // Navigate to full article page
            },
          );
        },
      ),
    );
  }
}
