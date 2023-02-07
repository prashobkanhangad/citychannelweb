import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class homecontroller extends GetxController {
  getvalue() {
    FirebaseFirestore.instance
        .collection('citynewstime')
        .doc()
        .get()
        .then((value) {
      print(value);
    });
  }

  youtubeplayer() {
    refresh();
   return YoutubePlayer(
      controller: YoutubePlayerController(
          initialVideoId:
              YoutubePlayer.convertUrlToId('arQviLPxDus').toString(),
          flags: const YoutubePlayerFlags(
              showLiveFullscreenButton: true,
              autoPlay: false,
              hideControls: false)),
      showVideoProgressIndicator: true,
      bottomActions: [],
      aspectRatio: 16 / 9,
    );
  }
  
}
