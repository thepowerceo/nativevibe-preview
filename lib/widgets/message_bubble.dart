import 'package:flutter/material.dart';
import 'package:flutter_chat/models/message_model.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSentByMe = message.isSentByMe;

    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isSentByMe
              ? theme.colorScheme.primary
              : theme.cardTheme.color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft:
                isSentByMe ? const Radius.circular(20) : const Radius.circular(0),
            bottomRight:
                isSentByMe ? const Radius.circular(0) : const Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message.text,
              style: TextStyle(
                fontSize: 16,
                color: isSentByMe ? Colors.black : Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              DateFormat.jm().format(message.timestamp),
              style: TextStyle(
                fontSize: 10,
                color: isSentByMe ? Colors.black54 : Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}