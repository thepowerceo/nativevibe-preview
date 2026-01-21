import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chat_app/models/chat_model.dart';
import 'package:flutter_chat_app/screens/chat_screen.dart';
import 'package:flutter_chat_app/services/chat_service.dart';
import 'package:flutter_chat_app/widgets/chat_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Consumer<ChatService>(
        builder: (context, chatService, child) {
          final chats = chatService.chats;
          return ListView.separated(
            itemCount: chats.length,
            separatorBuilder: (context, index) => const Divider(height: 0.5),
            itemBuilder: (context, index) {
              final Chat chat = chats[index];
              return ChatListItem(
                chat: chat,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(chatId: chat.id),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}