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
                const SizedBox(
                  width: 5,
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
              onTap: () => Get.to(() => homePage()),
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




class Adminnationalwidget extends StatelessWidget {
  const Adminnationalwidget({
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
            'National',
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
          // SizedBox(height: 10.w),
          // Text('Videos',
          //     style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
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
                  hintText: 'News Video Youtube link paste Here',
                  hintStyle: TextStyle(fontSize: 18.sp, color: kblackcolor)),
            ),
          ),

          SizedBox(height: 10.w),
          Text(
            'Newscard',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.w),
          Row(
            children: [
              Container(
                height: 250.w,
                width: 200.w,
                decoration:
                    BoxDecoration(border: Border.all(color: kblackcolor)),
              ),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                width: 617.w,
                height: 250.w,
                child: TextFormField(
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
                      hintStyle:
                          TextStyle(fontSize: 18.sp, color: kblackcolor)),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.w),
          Row(
            children: [
              Text(
                'Upload Newscard Image',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.attach_file,
                    size: 24.w,
                  ))
            ],
          ),
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

class Adminprogrammewidget extends StatelessWidget {
  const Adminprogrammewidget({
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
            'Programme',
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
          // SizedBox(height: 10.w),
          // Text('Videos',
          //     style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
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
                  hintText: 'Videos Youtube link paste Here',
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
