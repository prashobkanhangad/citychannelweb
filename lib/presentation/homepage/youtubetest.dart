// Copyright 2020 Sarbagya Dhaubanjar. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

///
class yiutubeplayer extends StatefulWidget {
  final String videoid;

  const yiutubeplayer({super.key, required this.videoid});
  @override
  _yiutubeplayerState createState() => _yiutubeplayerState();
}

class _yiutubeplayerState extends State<yiutubeplayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showVideoAnnotations: false,
        strictRelatedVideos: true,
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );

    // final _controller = YoutubePlayerController.fromVideoId(
    //   videoId: '9IQ8X3r0Ow0',
    //   autoPlay: false,
    // );

    // _controller = YoutubePlayerController(
    //   params: const YoutubePlayerParams(),
    // );

    _controller.setFullScreenListener(
      (isFullScreen) {
        log('${isFullScreen ? 'Entered' : 'Exited'} Fullscreen.');
      },
    );
    _controller.cueVideoById(videoId: widget.videoid);
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) {
        return Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (kIsWeb && constraints.maxWidth > 750) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          player,
                          // const VideoPositionIndicator(),
                        ],
                      ),
                    ),
                    // const Expanded(
                    //   flex: 2,
                    //   child: SingleChildScrollView(
                    //       // child: Controls(),
                    //       ),
                    // ),
                  ],
                );
              }

              return ListView(
                children: [
                  player,
                  // const VideoPositionIndicator(),
                  // const Controls(),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
