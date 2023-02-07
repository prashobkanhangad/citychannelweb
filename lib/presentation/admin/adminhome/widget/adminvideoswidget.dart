import 'package:city_chennel_web/controller/adminhomecontroller.dart';
import 'package:city_chennel_web/core/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class adminvideoswidget extends StatelessWidget {
  adminvideoswidget({
    Key? key,
  }) : super(key: key);
  final youtubevideolinkcontroller = TextEditingController();
  final youtubevideodescrptioncontroller = TextEditingController();
  final getcontroller = Get.put(adminhomexontroller());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Videos',
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
          // SizedBox(height: 10.w),
          // Text('Videos',
          //     style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 10.w),
          SizedBox(
            height: 60.w,
            child: TextFormField(
              controller: youtubevideolinkcontroller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 13.0.w,
                    horizontal: 10.0.w,
                  ),
                  border: OutlineInputBorder(
                    // borderSide:
                    //     const BorderSide(
                    //   color: Color.fromARGB(
                    //       255, 12, 3, 108),
                    // ),
                    borderRadius: BorderRadius.circular(5.w),
                  ),
                  hintText: 'Videos Youtube link paste Here',
                  hintStyle: TextStyle(fontSize: 18.sp, color: kblackcolor)),
            ),
          ),
          SizedBox(
            height: 10.w,
          ),
          SizedBox(
            width: 617.w,
            height: 250.w,
            child: TextFormField(
              controller: youtubevideodescrptioncontroller,
              maxLines: 20,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 13.0.w,
                    horizontal: 10.0.w,
                  ),
                  border: OutlineInputBorder(
                    // borderSide:
                    //     const BorderSide(
                    //   color: Color.fromARGB(
                    //       255, 12, 3, 108),
                    // ),
                    borderRadius: BorderRadius.circular(5.w),
                  ),
                  hintText: 'Enter News description Here',
                  hintStyle: TextStyle(fontSize: 18.sp, color: kblackcolor)),
            ),
          ),
          SizedBox(height: 10.w),
          SizedBox(
            width: 150.w,
            height: 30.w,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kblackcolor, foregroundColor: kwhitecolor),
                onPressed: () {
                  getcontroller.createvideosectionurl(
                      youtubeviddeourl: youtubevideolinkcontroller.text,
                      youtubevideodescription: youtubevideodescrptioncontroller.text);
                },
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 18.sp),
                )),
          ),
        ],
      ),
    );
  }
}
