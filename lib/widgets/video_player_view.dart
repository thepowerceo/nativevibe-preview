import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:vimeo_streamer/models/video_lesson.dart';
import 'package:vimeo_streamer/providers/video_provider.dart';

class VideoPlayerView extends StatefulWidget {
  final VideoLesson lesson;
  const VideoPlayerView({super.key, required this.lesson});

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    // Note: In a real Vimeo app, you'd use a package specifically for Vimeo 
    // or extract the .mp4 link. For this demo, we assume the URL is playable.
    _videoController = VideoPlayerController.networkUrl(Uri.parse(widget.lesson.videoUrl));
    
    await _videoController.initialize();
    
    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      autoPlay: true,
      looping: false,
      aspectRatio: 16 / 9,
      errorBuilder: (context, errorMessage) {
        return Center(child: Text('Video unavailable - Private Vimeo Link'));
      },
    );

    _videoController.addListener(() {
      if (_videoController.value.position >= _videoController.value.duration && 
          _videoController.value.duration != Duration.zero) {
        Provider.of<VideoProvider>(context, listen: false).markAsWatched(widget.lesson.id);
      }
    });

    setState(() {});
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_chewieController != null && _chewieController!.videoPlayerController.value.isInitialized) {
      return Chewie(controller: _chewieController!);
    }
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 10),
          Text('Loading Stream...'),
        ],
      ),
    );
  }
}