import 'package:flutter/material.dart';
import 'package:flutter_chat/models/contact_model.dart';
import 'package:flutter_chat/models/message_model.dart';
import 'dart:math';

class ChatService extends ChangeNotifier {
  final List<Contact> _contacts = [
    const Contact(id: '1', name: 'Alice', imageUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026704d'),
    const Contact(id: '2', name: 'Bob', imageUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026704e'),
    const Contact(id: '3', name: 'Charlie', imageUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026704f'),
    const Contact(id: '4', name: 'Diana', imageUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026704a'),
  ];

  final Map<String, List<Message>> _messages = {
    '1': [
      Message(id: 'm1', contactId: '1', text: 'Hey, how are you?', timestamp: DateTime.now().subtract(const Duration(minutes: 5)), isSentByMe: false),
      Message(id: 'm2', contactId: '1', text: 'I am good, thanks! How about you?', timestamp: DateTime.now().subtract(const Duration(minutes: 4)), isSentByMe: true),
      Message(id: 'm3', contactId: '1', text: 'Doing great! Wanna catch up later?', timestamp: DateTime.now().subtract(const Duration(minutes: 3)), isSentByMe: false),
    ],
    '2': [
      Message(id: 'm4', contactId: '2', text: 'Did you see the new Flutter update?', timestamp: DateTime.now().subtract(const Duration(hours: 1)), isSentByMe: true),
      Message(id: 'm5', contactId: '2', text: 'Oh yes, it looks amazing!', timestamp: DateTime.now().subtract(const Duration(minutes: 58)), isSentByMe: false),
    ],
    '3': [],
    '4': [
       Message(id: 'm6', contactId: '4', text: 'See you tomorrow!', timestamp: DateTime.now().subtract(const Duration(days: 1)), isSentByMe: false),
    ],
  };

  List<Contact> get contacts => _contacts;

  List<Message> getMessagesForContact(String contactId) {
    return _messages[contactId]?..sort((a, b) => b.timestamp.compareTo(a.timestamp)) ?? [];
  }

  Message? getLastMessageForContact(String contactId) {
    final contactMessages = getMessagesForContact(contactId);
    return contactMessages.isNotEmpty ? contactMessages.first : null;
  }

  void sendMessage(String contactId, String text) {
    if (text.trim().isEmpty) return;

    final newMessage = Message(
      id: 'm${Random().nextInt(1000)}',
      contactId: contactId,
      text: text,
      timestamp: DateTime.now(),
      isSentByMe: true,
    );
    _messages[contactId]?.add(newMessage);
    notifyListeners();

    // Simulate a reply
    Future.delayed(const Duration(seconds: 2), () {
      final reply = Message(
        id: 'm${Random().nextInt(1000)}',
        contactId: contactId,
        text: 'Sounds good!',
        timestamp: DateTime.now(),
        isSentByMe: false,
      );
      _messages[contactId]?.add(reply);
      notifyListeners();
    });
  }
}