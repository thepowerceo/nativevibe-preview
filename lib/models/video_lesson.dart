class VideoLesson {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String videoUrl;
  bool isWatched;

  VideoLesson({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.videoUrl,
    this.isWatched = false,
  });

  factory VideoLesson.fromJson(Map<String, dynamic> json) {
    // Extract the highest quality HLS or MP4 link
    final List download = json['download'] ?? [];
    final String streamUrl = download.isNotEmpty 
        ? download.first['link'] 
        : "";

    return VideoLesson(
      id: json['uri'].split('/').last,
      title: json['name'] ?? 'Untitled Lesson',
      description: json['description'] ?? '',
      thumbnailUrl: json['pictures']['sizes'][3]['link'] ?? '',
      videoUrl: streamUrl,
    );
  }
}