// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:city_chennel_web/core/constants.dart';
import 'package:city_chennel_web/model/videosectionmodel.dart';
import 'package:city_chennel_web/presentation/homepage/widget.dart';
import 'package:city_chennel_web/presentation/homepage/youtubetest.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Videoscreen extends StatelessWidget {
  const Videoscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                headwidget(),
                tablewidget(),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('videolist')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return CircularProgressIndicator();
                      }
                      if (!snapshot.hasData) {
                        return Center(
                          child: Text(
                            'Data not available',
                          ),
                        );
                      }
                      // final videodatalength =
                      //     videosectiomodel.fromMap(snapshot.data!.docs.length);
                      // final int length = videodatalength;
                      // print(videodatalength);
                      return Container(
                        width: 1150.w,
                        child: GridView.builder(
                          shrinkWrap: true,
                          // itemCount: 20,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1.27, crossAxisCount: 4),
                          itemBuilder: (BuildContext context, int index) {
                            final data = videosectiomodel
                                .fromMap(snapshot.data!.docs[index].data());
                            return videocategoryvideocontainer(
                              videourl: data.youtubeviddeourl,
                            );
                          },
                          itemCount: snapshot.data!.size,
                        ),
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class videocategoryvideocontainer extends StatelessWidget {
  String videourl;
  videocategoryvideocontainer({Key? key, required this.videourl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      width: 270.w,
      // height: 200.w,
      color: kwhitecolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300.w,
            height: 153.8.w,
            color: kwhitecolor,
            child: YoutubeAppDemo(videourl: videourl),
          ),
          Container(
            color: kwhitecolor,
            height: 5.w,
          ),
          Container(
            // height: 50,
            color: kwhitecolor,
            child: Text(
              'City Programmes testCity Programmes testCity Programmes testCity Programmes test',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
