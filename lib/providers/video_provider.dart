import 'package:flutter/material.dart';
import 'package:vimeo_streamer/models/video_lesson.dart';
import 'package:vimeo_streamer/services/vimeo_service.dart';

class VideoProvider with ChangeNotifier {
  final VimeoService _service = VimeoService();
  
  List<VideoLesson> _lessons = [];
  VideoLesson? _selectedLesson;
  bool _isLoading = false;

  List<VideoLesson> get lessons => _lessons;
  VideoLesson? get selectedLesson => _selectedLesson;
  bool get isLoading => _isLoading;

  Future<void> loadLessons() async {
    _isLoading = true;
    notifyListeners();

    _lessons = await _service.fetchLessons();
    if (_lessons.isNotEmpty) {
      _selectedLesson = _lessons.first;
    }

    _isLoading = false;
    notifyListeners();
  }

  void selectLesson(VideoLesson lesson) {
    _selectedLesson = lesson;
    notifyListeners();
  }

  void markAsWatched(String id) {
    final index = _lessons.indexWhere((l) => l.id == id);
    if (index != -1) {
      _lessons[index].isWatched = true;
      notifyListeners();
    }
  }
}