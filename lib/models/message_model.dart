class Message {
  final String id;
  final String contactId;
  final String text;
  final DateTime timestamp;
  final bool isSentByMe;

  Message({
    required this.id,
    required this.contactId,
    required this.text,
    required this.timestamp,
    required this.isSentByMe,
  });
}