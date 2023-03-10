import 'package:city_chennel_web/core/constants.dart';
import 'package:city_chennel_web/presentation/homepage/widget.dart';
import 'package:city_chennel_web/presentation/homepage/youtubetest.dart';
import 'package:city_chennel_web/presentation/livetv/youtubelive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Livescreen extends StatelessWidget {
  Livescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    headwidget(),
                    tablewidget(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 12.w, right: 12.w),
                          child: Container(
                            color: Colors.indigo[600],
                            height: 477.w,
                            width: 848.w,
                            child: Youtubelive(videourl: 'https://www.youtube.com/watch?v=Nq2wYlWFucg')
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12.w),
                          child: Container(
                            width: 290.w,
                            height: 477.w,
                            color: kgreycolor,
                            child: Center(
                              child: Text(
                                'Your ADVT Here',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 320.w,
                    ),
                    bottumwidget()
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
