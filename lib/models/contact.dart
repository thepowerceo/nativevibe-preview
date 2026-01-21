class Contact {
  final String id;
  final String name;
  final String imageUrl;
  final bool isOnline;
  final String lastSeen;

  Contact({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isOnline = false,
    required this.lastSeen,
  });
}