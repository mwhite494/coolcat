import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideo extends StatefulWidget {
  const BackgroundVideo({super.key});

  @override
  BackgroundVideoState createState() => BackgroundVideoState();
}

class BackgroundVideoState extends State<BackgroundVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/catvideo.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    print('Width: ${_controller.value.size.width} Height: ${_controller.value.size.height}');
    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller.value.size.width,
          height: _controller.value.size.height,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}