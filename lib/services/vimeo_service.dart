import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vimeo_streamer/models/video_lesson.dart';

class VimeoService {
  static const String _token = 'acd18855e9f8713fe04b829d977bfd1d';
  static const List<String> _videoIds = [
    '1149343961',
    '1153332904',
    '1153332904', // Re-using or adding others based on prompt
    '1153396796',
    '1153399384'
  ];

  Future<List<VideoLesson>> fetchLessons() async {
    List<VideoLesson> lessons = [];
    
    for (String id in _videoIds) {
      try {
        final response = await http.get(
          Uri.parse('https://api.vimeo.com/videos/$id'),
          headers: {
            'Authorization': 'bearer $_token',
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          lessons.add(VideoLesson.fromJson(jsonDecode(response.body)));
        }
      } catch (e) {
        print('Error fetching video $id: $e');
      }
    }
    return lessons;
  }
}