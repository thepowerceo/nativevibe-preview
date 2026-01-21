import 'package:flutter_chat_app/models/message_model.dart';

class Chat {
  final String id;
  final String contactName;
  final String contactAvatarUrl;
  final List<Message> messages;

  Chat({
    required this.id,
    required this.contactName,
    required this.contactAvatarUrl,
    required this.messages,
  });

  Message get lastMessage => messages.first;
}