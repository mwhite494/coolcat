import 'package:coolcat/constants/index.dart' show Numbers;
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

      // Video must be muted for autoplay to work on Chrome
      _forwardController.setVolume(0);
      _reverseController.setVolume(0);

      setState(() {
        // print('Both controllers initialized');
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

  // void _onVideoEnd() {
  //   if (_forwardController.value.isInitialized && _reverseController.value.isInitialized) {
  //     if ((_playingForward && _forwardController.value.position >= _forwardController.value.duration) ||
  //         (!_playingForward && _reverseController.value.position >= _reverseController.value.duration)) {

  //       print('Switching playback to ${_playingForward ? 'Reverse' : 'Forward'}');
  //       print('forwardController position: ${_forwardController.value.position} reverseController position: ${_reverseController.value.position}');
  //       print('\n');

  //       // When the current video ends, switch to the other video
  //       setState(() {
  //         _playingForward = !_playingForward;
  //         // Play the next video
  //         if (_playingForward) {
  //           _forwardController.play();
  //           _reverseController.pause();
  //           _reverseController.seekTo(Duration.zero);
  //         } else {
  //           _reverseController.play();
  //           _forwardController.pause();
  //           _forwardController.seekTo(Duration.zero);
  //         }
  //       });
  //     }
  //   }
  // }

  void _onVideoEnd() {
    if (_forwardController.value.isInitialized && _reverseController.value.isInitialized) {
      VideoPlayerController currentController = _playingForward ? _forwardController : _reverseController;
      VideoPlayerController nextController = _playingForward ? _reverseController : _forwardController;

      // Determine if the current video has ended
      bool videoEnded = currentController.value.position >= currentController.value.duration;
      if (videoEnded) {
        setState(() {
          _playingForward = !_playingForward; // Switch the flag to play the other video
          // Immediately play the next video
          nextController.play();
        });

        // Introduce a delay before seeking to give time for the UI to update
        Future.delayed(Duration(milliseconds: 100), () {
          // Ensure the widget is still mounted before updating the state
          if (mounted) {
            currentController.pause().then((_) {
              currentController.seekTo(Duration.zero);
              // print('Seeked previous controller to zero');
            });
          }
        });

        // print('Switched playback to ${_playingForward ? 'Forward' : 'Reverse'}');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    // print('inside build method with playback in ${_playingForward ? 'Forward' : 'Reverse'}');
    // print('inside build method forwardController initialized: ${_forwardController.value.isInitialized} reverseController intialized: ${_reverseController.value.isInitialized}');
    // print('inside build method forwardController hasError: ${_forwardController.value.hasError} reverseController hasError: ${_reverseController.value.hasError}');
    // print('inside build method forwardController errorDescription: ${_forwardController.value.errorDescription} reverseController errorDescription: ${_reverseController.value.errorDescription}');
    
    VideoPlayerController currentController = _playingForward ? _forwardController : _reverseController;

    return (_forwardController.value.isInitialized && _reverseController.value.isInitialized)
      ? SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: currentController.value.size.width,
              height: currentController.value.size.height,
              child: VideoPlayer(currentController),
            ),
          ),
        )
      : Container(
        color: Colors.black,
      );
    // Show forward and reverse videos side by side (for debugging)
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     // Check if the forward controller is initialized and display the video
    //     if (_forwardController.value.isInitialized)
    //       Expanded(
    //         child: AspectRatio(
    //           aspectRatio: _forwardController.value.aspectRatio,
    //           child: VideoPlayer(_forwardController),
    //         ),
    //       ),

    //     // Check if the reverse controller is initialized and display the video
    //     if (_reverseController.value.isInitialized)
    //       Expanded(
    //         child: AspectRatio(
    //           aspectRatio: _reverseController.value.aspectRatio,
    //           child: VideoPlayer(_reverseController),
    //         ),
    //       ),
    //   ],
    // );
  }


  @override
  void dispose() {
    _forwardController.dispose();
    _reverseController.dispose();
    super.dispose();
  }

}