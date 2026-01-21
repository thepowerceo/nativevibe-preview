import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_chat/models/contact_model.dart';
import 'package:flutter_chat/services/chat_service.dart';

class ContactListItem extends StatelessWidget {
  final Contact contact;
  final VoidCallback onTap;

  const ContactListItem({super.key, required this.contact, required this.onTap});

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDate = DateTime(timestamp.year, timestamp.month, timestamp.day);

    if (today == messageDate) {
      return DateFormat.jm().format(timestamp); // e.g., 5:30 PM
    } else if (today.difference(messageDate).inDays == 1) {
      return 'Yesterday';
    } else {
      return DateFormat.yMd().format(timestamp); // e.g., 10/3/2023
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatService = context.watch<ChatService>();
    final lastMessage = chatService.getLastMessageForContact(contact.id);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(contact.imageUrl),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact.name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      lastMessage?.text ?? 'No messages yet',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              if (lastMessage != null)
                Text(
                  _formatTimestamp(lastMessage.timestamp),
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}