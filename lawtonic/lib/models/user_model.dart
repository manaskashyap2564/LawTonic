class UserModel {
  final String id;
  final String email;
  final String name;
  final List<String> bookmarks;
  final String languagePref;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.bookmarks,
    required this.languagePref,
  });
}
