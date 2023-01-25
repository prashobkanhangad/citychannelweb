import 'package:city_chennel_web/controller/homecontroller.dart';
import 'package:city_chennel_web/core/constants.dart';
import 'package:city_chennel_web/presentation/newsinsidescreen/newsinsidescreen.dart';
import 'package:city_chennel_web/presentation/homepage/widget.dart';
import 'package:city_chennel_web/presentation/login/loginpage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Homeview extends GetResponsiveView {}

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    print(screenwidth * 0.07);
    return Scaffold(
      backgroundColor: kwhitecolor,
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   width: (screenwidth / 8),
              // ),
              Column(
                children: [
                  headwidget(),
                  tablewidget(),
                  Container(
                    color: kwhitecolor,
                    width: 1150.w,
                    // height: (screenwidth - ((screenwidth / 4)))*0.5625,
                    padding: EdgeInsets.symmetric(vertical: 20.w),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10.w),
                              color: kblackcolor,
                              width: 720.w,
                              height: 35.w,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      'CITY NEWS TIME ',
                                      style: TextStyle(
                                          color: kwhitecolor, fontSize: 18.sp),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.indigo[600],
                              height: 405.w,
                              width: 720.w,
                              child: const Center(child: Text('Video Screen')),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          width: 410.w,
                          height: 440.w,
                          color: const Color.fromARGB(255, 97, 97, 97),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 1150.w,
                    height: 460.w,
                    color: kwhitecolor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed('/livetv'),
                          child: Container(
                            height: 460.w,
                            width: 371.w,
                            color: kwhitecolor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30.w,
                                  child: Text(
                                    'Latest News',
                                    style: TextStyle(
                                        fontSize: 22.w,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Image(
                                    image:
                                        AssetImage('assets/nepal-edited.jpg')),
                                SizedBox(
                                  height: 8.w,
                                ),
                                Text(
                                  ktext,
                                  style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ktextnews,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 6,
                                  style: TextStyle(fontSize: 15.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 460.w,
                          width: 371.w,
                          color: kwhitecolor,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30.w,
                              ),
                              const Image(
                                  image: AssetImage('assets/nepal-edited.jpg')),
                              SizedBox(
                                height: 8.w,
                              ),
                              Text(
                                ktext,
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ktextnews,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 6,
                                style: TextStyle(fontSize: 15.sp),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 460.w,
                          width: 371.w,
                          color: kwhitecolor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30.w,
                                child: Text(
                                  'Kasargod',
                                  style: TextStyle(
                                      fontSize: 22.w,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              kasargodcontainer(),
                              SizedBox(
                                height: 10.w,
                              ),
                              kasargodcontainer(),
                              SizedBox(
                                height: 10.w,
                              ),
                              kasargodcontainer(),
                              SizedBox(
                                height: 8.w,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Container(
                    width: 1150.w,
                    height: 150.w,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  SizedBox(
                    width: 1150.w,
                    child: Text(
                      'Kerala',
                      style: TextStyle(
                          fontSize: 22.w, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    width: 1150.w,
                    height: 450.w,
                    color: kwhitecolor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        keralacontainer(),
                        keralacontainer(),
                        keralacontainer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 1150.w,
                        child: Text(
                          'Programmes',
                          style: TextStyle(
                              fontSize: 22.w, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7.w,
                  ),
                  SizedBox(
                    width: 1150.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        programesvideocontainer(),
                        programesvideocontainer(),
                        programesvideocontainer(),
                        programesvideocontainer(),
                        programesvideocontainer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 1150.w,
                    child: Text(
                      'National',
                      style: TextStyle(
                          fontSize: 22.w, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5.w),
                    width: 1150.w,
                    height: 420.w,
                    color: kwhitecolor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        national_container(),
                        national_container(),
                        national_container(),
                        national_container(),
                      ],
                    ),
                  ),
                  bottumwidget()
                ],
              ),
              // SizedBox(
              //   width: (screenwidth / 10),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
