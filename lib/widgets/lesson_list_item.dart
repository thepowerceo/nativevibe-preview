import 'package:flutter/material.dart';
import 'package:vimeo_streamer/models/video_lesson.dart';

class LessonListItem extends StatelessWidget {
  final VideoLesson lesson;
  final bool isSelected;
  final VoidCallback onTap;

  const LessonListItem({
    super.key,
    required this.lesson,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return ListTile(
      onTap: onTap,
      selected: isSelected,
      selectedTileColor: primaryColor.withOpacity(0.1),
      leading: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              lesson.thumbnailUrl,
              width: 80,
              height: 45,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(color: Colors.grey, width: 80, height: 45),
            ),
          ),
          if (lesson.isWatched)
            Container(
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(4),
              ),
              width: 80,
              height: 45,
              child: const Icon(Icons.check_circle, color: Colors.green, size: 24),
            ),
        ],
      ),
      title: Text(
        lesson.title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? primaryColor : null,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: lesson.isWatched 
          ? const Icon(Icons.done_all, size: 16, color: Colors.green)
          : const Icon(Icons.play_circle_outline, size: 16),
    );
  }
}