import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/models/chat_model.dart';
import 'package:flutter_chat_app/models/message_model.dart';

class ChatService with ChangeNotifier {
  final List<Chat> _chats = [
    Chat(
      id: '1',
      contactName: 'Alice',
      contactAvatarUrl: 'https://i.pravatar.cc/150?u=alice',
      messages: [
        Message(id: 'm1', text: 'Hey, how are you?', timestamp: DateTime.now().subtract(const Duration(minutes: 5)), isSentByMe: false),
        Message(id: 'm2', text: 'I am good, thanks! What about you?', timestamp: DateTime.now().subtract(const Duration(minutes: 4)), isSentByMe: true),
      ],
    ),
    Chat(
      id: '2',
      contactName: 'Bob',
      contactAvatarUrl: 'https://i.pravatar.cc/150?u=bob',
      messages: [
        Message(id: 'm3', text: 'See you tomorrow!', timestamp: DateTime.now().subtract(const Duration(hours: 1)), isSentByMe: false),
      ],
    ),
    Chat(
      id: '3',
      contactName: 'Charlie',
      contactAvatarUrl: 'https://i.pravatar.cc/150?u=charlie',
      messages: [
        Message(id: 'm4', text: 'That sounds like a plan.', timestamp: DateTime.now().subtract(const Duration(days: 1)), isSentByMe: true),
      ],
    ),
     Chat(
      id: '4',
      contactName: 'Diana',
      contactAvatarUrl: 'https://i.pravatar.cc/150?u=diana',
      messages: [
        Message(id: 'm5', text: 'Can you send me the file?', timestamp: DateTime.now().subtract(const Duration(days: 2)), isSentByMe: false),
      ],
    ),
  ];

  List<Chat> get chats => _chats;

  Chat getChatById(String id) {
    return _chats.firstWhere((chat) => chat.id == id);
  }

  void sendMessage(String chatId, String text) {
    final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
    if (chatIndex != -1) {
      final newMessage = Message(
        id: 'msg_${Random().nextInt(10000)}',
        text: text,
        timestamp: DateTime.now(),
        isSentByMe: true,
      );
      _chats[chatIndex].messages.insert(0, newMessage);
      // Move the chat with the new message to the top of the list
      final updatedChat = _chats.removeAt(chatIndex);
      _chats.insert(0, updatedChat);
      notifyListeners();
    }
  }
}