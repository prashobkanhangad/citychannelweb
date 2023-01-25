// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:city_chennel_web/core/constants.dart';
import 'package:city_chennel_web/presentation/homepage/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Videoscreen extends StatelessWidget {
  const Videoscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const headwidget(),
                  const tablewidget(),
                  SizedBox(
                    height: 20.w,
                  ),
                  Text(
                    'Videos',
                    style:
                        TextStyle(fontSize: 22.w, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Container(
                    width: 1150.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const videocategoryvideocontainer(),
                        const videocategoryvideocontainer(),
                        const videocategoryvideocontainer(),
                        const videocategoryvideocontainer(),
                      ],
                    ),
                  ),   SizedBox(
                    height: 20.w,
                  ),
                  Container(
                    width: 1150.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const videocategoryvideocontainer(),
                        const videocategoryvideocontainer(),
                        const videocategoryvideocontainer(),
                        const videocategoryvideocontainer(),
                      ],
                    ),
                  ),   SizedBox(
                    height: 20.w,
                  ),
                  Container(
                    width: 1150.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const videocategoryvideocontainer(),
                        const videocategoryvideocontainer(),
                        const videocategoryvideocontainer(),
                        const videocategoryvideocontainer(),
                      ],
                    ),
                  ),   SizedBox(
                    height: 20.w,
                  ),
                  Container(
                    width: 1150.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const videocategoryvideocontainer(),
                        const videocategoryvideocontainer(),
                        const videocategoryvideocontainer(),
                        const videocategoryvideocontainer(),
                      ],
                    ),
                  ),   SizedBox(
                    height: 20.w,
                  ),
                  Container(
                    width: 1150.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const videocategoryvideocontainer(),
                        const videocategoryvideocontainer(),
                        const videocategoryvideocontainer(),
                        const videocategoryvideocontainer(),
                      ],
                    ),
                  ),   SizedBox(
                    height: 20.w,
                  )
                  
                  
,                  const bottumwidget()
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class videocategoryvideocontainer extends StatelessWidget {
  const videocategoryvideocontainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      width: 270.w,
      height: 290.w,
      color: kgreycolor,
      child: Column(
        children: [
          Container(
            width: 250.w,
            height: 140.6.w,
            color: kwhitecolor,
          ),
          SizedBox(
            height: 10.w,
          ),
          Text(
            ktextnews,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
