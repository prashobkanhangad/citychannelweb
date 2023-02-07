
import 'package:city_chennel_web/core/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class adminlivetvwidget extends StatelessWidget {
  const adminlivetvwidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Live TV',
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.w),
          Text('City Channel Live Streaming',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 10.w),
          SizedBox(
            height: 60.w,
            child: TextFormField(
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
                  hintText: 'City Channel Live Streaming link Paste Here',
                  hintStyle: TextStyle(fontSize: 18.sp, color: kblackcolor)),
            ),
          ),
          SizedBox(height: 5.w),
          SizedBox(
            width: 150.w,
            height: 30.w,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kblackcolor, foregroundColor: kwhitecolor),
                onPressed: () {},
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