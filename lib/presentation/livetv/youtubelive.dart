// Copyright 2020 Sarbagya Dhaubanjar. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

///
class Youtubelive extends StatefulWidget {
  final String videourl;

  const Youtubelive({super.key, required this.videourl});
  @override
  _YoutubeliveState createState() => _YoutubeliveState();
}

class _YoutubeliveState extends State<Youtubelive> {
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

    _controller.setFullScreenListener(
      (isFullScreen) {
        log('${isFullScreen ? 'Entered' : 'Exited'} Fullscreen.');
      },
    );
    _controller.loadVideo(widget.videourl);
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
