class LegalResource {
  final String id;
  final String title;
  final String summary;
  final String author;
  final DateTime date;
  final String url;
  final List<String> tags;

  LegalResource({
    required this.id,
    required this.title,
    required this.summary,
    required this.author,
    required this.date,
    required this.url,
    required this.tags,
  });
}
