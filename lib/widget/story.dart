// lib/widgets/story.dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart'; // Import video_player
import '../models/story.dart';

class Story extends StatefulWidget {
  final StoryModel story;

  const Story({Key? key, required this.story}) : super(key: key);

  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.story.mediaType == 'video') {
      _controller = VideoPlayerController.network(widget.story.mediaUrl)
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized
          setState(() {});
        });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display the media based on type
        widget.story.mediaType == 'image'
            ? Image.network(widget.story.mediaUrl)
            : _controller != null && _controller!.value.isInitialized
            ? Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!),
            ),
            IconButton(
              icon: Icon(
                _controller!.value.isPlaying
                    ? Icons.pause
                    : Icons.play_arrow,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _controller!.value.isPlaying
                      ? _controller!.pause()
                      : _controller!.play();
                });
              },
            ),
          ],
        )
            : Container(
          height: 200,
          color: Colors.black, // Placeholder for loading
          child: Center(child: CircularProgressIndicator()),
        ),
        SizedBox(height: 5),
        Text(
          widget.story.text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(widget.story.textDescription),
        SizedBox(height: 5),
        Text(widget.story.timestamp),
        Divider(), // Optional divider between stories
      ],
    );
  }
}
