import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chat/services/chat_service.dart';
import 'package:flutter_chat/widgets/contact_list_item.dart';
import 'package:flutter_chat/screens/chat_screen.dart';
import 'package:flutter_chat/models/contact_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatService = context.watch<ChatService>();
    final contacts = chatService.contacts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ContactListItem(
            contact: contact,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(contact: contact),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.message, color: Colors.black),
      ),
    );
  }
}