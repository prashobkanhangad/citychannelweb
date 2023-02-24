import 'package:city_chennel_web/controller/adminhomecontroller.dart';
import 'package:city_chennel_web/core/constants.dart';
import 'package:city_chennel_web/presentation/homepage/homepage.dart';
import 'package:city_chennel_web/presentation/login/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class adminheadwidget extends StatelessWidget {
  const adminheadwidget({
    Key? key,
    // required this.screenwidth,
  }) : super(key: key);

  // final double screenwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.w,
      width: 1150.w,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: kwhitecolor,
            // child: Image(
            //   width: 150.w,
            //   image: const AssetImage('assets/LOGO.jpg'),
            // ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '12',
                  style:
                      TextStyle(fontSize: 52.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'JAN 2020',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'MONDAY',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: 110.w,
            color: kblackcolor,
            child: GestureDetector(
              onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  content: const Text('Are you sure you want to Logout'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Get.to(homePage()),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    color: kwhitecolor,
                    size: 40.sp,
                  ),
                  Text(
                    'LOGOUT',
                    style: TextStyle(color: kwhitecolor, fontSize: 12.sp),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class leftsideselectionwidget extends StatelessWidget {
  final title;
  final selectedcolor;
  const leftsideselectionwidget(
      {Key? key, required this.title, required this.selectedcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 50.w,
      color: selectedcolor,
      padding: EdgeInsets.all(10.w),
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
