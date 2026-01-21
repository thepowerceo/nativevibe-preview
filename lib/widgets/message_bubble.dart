import 'package:flutter/material.dart';
import 'package:flutter_chat_app/models/message_model.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMe = message.isSentByMe;

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          decoration: BoxDecoration(
            color: isMe
                ? theme.colorScheme.primaryContainer
                : theme.colorScheme.secondaryContainer,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(18),
              topRight: const Radius.circular(18),
              bottomLeft: isMe ? const Radius.circular(18) : const Radius.circular(4),
              bottomRight: isMe ? const Radius.circular(4) : const Radius.circular(18),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            message.text,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: isMe
                  ? theme.colorScheme.onPrimaryContainer
                  : theme.colorScheme.onSecondaryContainer,
            ),
          ),
        ),
      ],
    );
  }
}