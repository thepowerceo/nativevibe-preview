import 'package:flutter/material.dart';
import 'package:skyline_messenger/models/contact.dart';

class ContactTile extends StatelessWidget {
  final Contact contact;
  final VoidCallback onTap;

  const ContactTile({super.key, required this.contact, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(contact.imageUrl),
          ),
          if (contact.isOnline)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 2),
                ),
              ),
            ),
        ],
      ),
      title: Text(contact.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(contact.lastSeen, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: const Text('12:45 PM', style: TextStyle(fontSize: 12, color: Colors.grey)),
    );
  }
}