import 'package:flutter/material.dart';
import 'package:relish_style_booking/models/hairstyle_service.dart';

/// A card widget to display a single hairstyle service.
class ServiceCard extends StatelessWidget {
  final HairstyleService service;
  final VoidCallback onTap;

  const ServiceCard({super.key, required this.service, required this.onTap});

  // A map to associate image keys with icons
  static const Map<String, IconData> _iconMap = {
    'cut': Icons.content_cut,
    'beard': Icons.face_retouching_natural,
    'color': Icons.color_lens,
    'kids': Icons.child_care,
  };

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: 150,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: colorScheme.outlineVariant),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(_iconMap[service.imageUrl] ?? Icons.cut, size: 40, color: colorScheme.primary),
                const Spacer(),
                Text(
                  service.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${service.price.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: colorScheme.primary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}