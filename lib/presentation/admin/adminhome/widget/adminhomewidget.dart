// import 'dart:math';

import 'dart:developer';

import 'package:city_chennel_web/controller/adminhomecontroller.dart';
import 'package:city_chennel_web/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class adminhomewidget extends StatelessWidget {
  final livestreamurlcontroller = TextEditingController();

  final newscardtitlecontroller = TextEditingController();

  // final livestreamurlcontroller = TextEditingController();
  String? newscardimgurl;

  // Function() picimageforhomenewscard;
  adminhomewidget({
    Key? key,
  }) : super(key: key);
  final getcontroller = Get.put(adminhomexontroller());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Home',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.w),
              Text('City News Time',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 10.w),
              SizedBox(
                height: 60.w,
                child: TextFormField(
                  controller: livestreamurlcontroller,
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
                      hintText: 'City News Time Youtube Link Paste Here',
                      hintStyle:
                          TextStyle(fontSize: 18.sp, color: kblackcolor)),
                ),
              ),
              SizedBox(height: 5.w),
              SizedBox(
                width: 150.w,
                height: 30.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kblackcolor,
                        foregroundColor: kwhitecolor),
                    onPressed: () {
                      adminhomexontroller().createnewstimeurl(
                          newstimeurl: livestreamurlcontroller.text);
                      livestreamurlcontroller.clear();
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 18.sp),
                    )),
              ),
              SizedBox(height: 10.w),
              Container(
                color: kblackcolor,
                height: 1.w,
              ),
              SizedBox(height: 10.w),
              Text(
                'Newscard',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.w),
              Row(
                children: [
                  GetBuilder<adminhomexontroller>(
                    builder: (context) {
                      return Container(
                        height: 250.w,
                        width: 200.w,
                        decoration:
                            BoxDecoration(border: Border.all(color: kblackcolor)),
                        child: getcontroller.homenewscardimg==null
                            ? SizedBox()
                            : Image(
                                image: MemoryImage(getcontroller.homenewscardimg!)),
                      );
                    }
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                    width: 617.w,
                    height: 250.w,
                    child: TextFormField(
                      controller: newscardtitlecontroller,
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
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        getcontroller.uploadimagefile();
                      },
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
                        backgroundColor: kblackcolor,
                        foregroundColor: kwhitecolor),
                    onPressed: () {
                      getcontroller.createshortnews(
                          shortnewsimgurl: getcontroller.newscardimagefileurl.toString(),
                          shortnewstitle: newscardtitlecontroller.text);
                          print('homenewscard img submitted');
                          log(getcontroller.newscardimagefileurl.toString());
                      // print(getcontroller.homenewscardimg);
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 18.sp),
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }
}
