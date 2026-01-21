import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vimeo_streamer/providers/video_provider.dart';
import 'package:vimeo_streamer/widgets/video_player_view.dart';
import 'package:vimeo_streamer/widgets/lesson_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => 
      Provider.of<VideoProvider>(context, listen: false).loadLessons()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<VideoProvider>(builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.lessons.isEmpty) {
          return const Center(child: Text('No lessons found. Check API Token.'));
        }

        return Row(
          children: [
            // Main Video Player Area
            Expanded(
              flex: 7,
              child: Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Expanded(
                      child: VideoPlayerView(
                        key: ValueKey(provider.selectedLesson?.id),
                        lesson: provider.selectedLesson!,
                      ),
                    ),
                    _buildVideoDetails(provider.selectedLesson!),
                  ],
                ),
              ),
            ),
            // Playlist Sidebar
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(left: BorderSide(color: Colors.grey.withOpacity(0.2))),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Course Content',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: provider.lessons.length,
                        itemBuilder: (context, index) {
                          final lesson = provider.lessons[index];
                          return LessonListItem(
                            lesson: lesson,
                            isSelected: provider.selectedLesson?.id == lesson.id,
                            onTap: () => provider.selectLesson(lesson),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildVideoDetails(dynamic lesson) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lesson.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            lesson.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}