import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoRoute extends StatefulWidget{

  @override
  _VideoRouteState createState() => _VideoRouteState();
}

class _VideoRouteState extends State<VideoRoute> {

  VideoPlayerController _controller;

  Future _videoPlayerInitializeFuture;


  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
       "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");

    _controller.setLooping(true);
    _videoPlayerInitializeFuture = _controller.initialize();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
      future: _videoPlayerInitializeFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done){
          _controller.play();
          return Center(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                  children: [
                    VideoPlayer(_controller)
                  ]
              ),
            )
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }
}