import 'package:flutter/material.dart';
import 'package:skyline_messenger/models/contact.dart';
import 'package:skyline_messenger/models/message.dart';

class ChatProvider extends ChangeNotifier {
  final List<Contact> _contacts = [
    Contact(id: '1', name: 'Alex Rivera', imageUrl: 'https://i.pravatar.cc/150?u=1', isOnline: true, lastSeen: 'Active now'),
    Contact(id: '2', name: 'Sarah Chen', imageUrl: 'https://i.pravatar.cc/150?u=2', isOnline: false, lastSeen: '2m ago'),
    Contact(id: '3', name: 'Jordan Smith', imageUrl: 'https://i.pravatar.cc/150?u=3', isOnline: true, lastSeen: 'Active now'),
    Contact(id: '4', name: 'Maria Garcia', imageUrl: 'https://i.pravatar.cc/150?u=4', isOnline: false, lastSeen: '1h ago'),
  ];

  final Map<String, List<Message>> _messages = {
    '1': [
      Message(id: 'm1', senderId: '1', text: 'Hey, how is the project going?', timestamp: DateTime.now().subtract(const Duration(minutes: 5)), isMe: false),
      Message(id: 'm2', senderId: 'me', text: 'Going great! Just finished the UI.', timestamp: DateTime.now().subtract(const Duration(minutes: 2)), isMe: true),
    ],
  };

  List<Contact> get contacts => _contacts;

  List<Message> getMessages(String contactId) {
    return _messages[contactId] ?? [];
  }

  void sendMessage(String contactId, String text) {
    if (text.trim().isEmpty) return;
    
    final newMessage = Message(
      id: DateTime.now().toString(),
      senderId: 'me',
      text: text,
      timestamp: DateTime.now(),
      isMe: true,
    );

    if (_messages.containsKey(contactId)) {
      _messages[contactId]!.add(newMessage);
    } else {
      _messages[contactId] = [newMessage];
    }
    
    notifyListeners();
  }
}