import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideo extends StatefulWidget {
  const BackgroundVideo({super.key});

  @override
  BackgroundVideoState createState() => BackgroundVideoState();
}

class BackgroundVideoState extends State<BackgroundVideo> {
  late VideoPlayerController _forwardController;
  late VideoPlayerController _reverseController;
  bool _playingForward = true; // A flag to indicate which video to show

  @override
  void initState() {
    super.initState();
    // Initialize both video player controllers
    // _forwardController = VideoPlayerController.asset('assets/videos/catvideo.mp4')
    //   ..initialize().then((_) => setState(() {
    //     print('${_forwardController.value.isInitialized}');
    //     print('forwardController initialized');
    //   }));
    // _reverseController = VideoPlayerController.asset('assets/videos/catvideo_reversed.mp4')
    //   ..initialize().then((_) => setState(() {
    //     print('reverseController initialized');
    //   }));

    // _forwardController.addListener(_onVideoEnd);
    // _reverseController.addListener(_onVideoEnd);

    // _forwardController.play();
    _initializeVideoControllers();
  }

  Future<void> _initializeVideoControllers() async {
    try {
      _forwardController = VideoPlayerController.asset('assets/videos/catvideo.mp4');
      _reverseController = VideoPlayerController.asset('assets/videos/catvideo_reversed.mp4');

      await Future.wait([
        _forwardController.initialize(),
        _reverseController.initialize(),
      ]);

      _forwardController.pause();
      _reverseController.play();
      _reverseController.pause();
      _forwardController.seekTo(Duration.zero);
      _reverseController.seekTo(Duration.zero);

      setState(() {
        print('Both controllers initialized');
        _forwardController.setVolume(0);
        _reverseController.setVolume(0);
        _forwardController.play(); // Start playing the first video if initialization is successful
      });

      // Add Listeners
      _forwardController.addListener(_onVideoEnd);
      _reverseController.addListener(_onVideoEnd);
    } catch (error) {
      print('An error occurred during video initialization: $error');
      // Handle the error appropriately here. For example, showing an error message on the UI.
    }
  }

  void _onVideoEnd() {
    if (_forwardController.value.isInitialized && _reverseController.value.isInitialized) {
      if ((_playingForward && _forwardController.value.position >= _forwardController.value.duration) ||
          (!_playingForward && _reverseController.value.position >= _reverseController.value.duration)) {

        print('Switching playback to ${_playingForward ? 'Reverse' : 'Forward'}');
        print('forwardController position: ${_forwardController.value.position} reverseController position: ${_reverseController.value.position}');
        print('\n');

        // When the current video ends, switch to the other video
        setState(() {
          _playingForward = !_playingForward;
          // Play the next video
          if (_playingForward) {
            _forwardController.play();
            _reverseController.pause();
            _reverseController.seekTo(Duration.zero);
          } else {
            _reverseController.play();
            _forwardController.pause();
            _forwardController.seekTo(Duration.zero);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // print('forwardController initialized: ${_forwardController.value.isInitialized} reverseController initialized: ${_reverseController.value.isInitialized}');
    return (_forwardController.value.isInitialized && _reverseController.value.isInitialized)
      ? SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _playingForward ? _forwardController.value.size.width : _reverseController.value.size.width,
              height: _playingForward ? _forwardController.value.size.height : _reverseController.value.size.height,
              child: VideoPlayer(_playingForward ? _forwardController : _reverseController),
            ),
          ),
        )
      : Container();
  }

  @override
  void dispose() {
    _forwardController.dispose();
    _reverseController.dispose();
    super.dispose();
  }

}