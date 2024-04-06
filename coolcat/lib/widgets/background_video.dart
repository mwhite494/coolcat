import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideo extends StatefulWidget {
  const BackgroundVideo({super.key});

  @override
  BackgroundVideoState createState() => BackgroundVideoState();
}

class BackgroundVideoState extends State<BackgroundVideo> {
  late VideoPlayerController _controller;

  String currentVideo = 'assets/videos/catvideo.mp4';
  final String forwardVideo = 'assets/videos/catvideo.mp4';
  final String reverseVideo = 'assets/videos/catvideo_reversed.mp4';

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    _controller = VideoPlayerController.asset(currentVideo)
      ..initialize().then((_) {
        _controller.play();
        _controller.addListener(_checkVideo);
        setState(() {});
      });
  }

  void _checkVideo() {
    if (_controller.value.position == _controller.value.duration) {
      // When video finishes, switch the video source
      setState(() {
        currentVideo = currentVideo == forwardVideo ? reverseVideo : forwardVideo;
      });
      _controller.removeListener(_checkVideo);
      _controller.dispose();
      _initializeVideoPlayer();
    }
  }

  @override
  Widget build(BuildContext context) {
      //   return _controller.value.isInitialized
  //       ? AspectRatio(
  //           aspectRatio: _controller.value.aspectRatio,
  //           child: VideoPlayer(_controller),
  //         )
  //       : Container();
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
    _controller.removeListener(_checkVideo);
    _controller.dispose();
    super.dispose();
  }

}