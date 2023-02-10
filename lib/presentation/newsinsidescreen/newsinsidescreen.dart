import 'package:city_chennel_web/core/constants.dart';
import 'package:city_chennel_web/presentation/homepage/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsinsideScreen extends StatelessWidget {
  final imageurl;
  final newstitle;
  final newsdescription;
  const NewsinsideScreen(
      {super.key,
      required this.imageurl,
      required this.newsdescription,
      required this.newstitle});

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
                  headwidget(),
                  tablewidget(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        // height: 500,
                        width: (1150 * .65).w,
                        child: Column(
                          children: [
                            SizedBox(
                              width: ((1150 * .65) - 20).w,
                              child: Text(
                                newstitle,
                                                       style:GoogleFonts.notoSerifMalayalam(fontSize: 28.sp, fontWeight: FontWeight.w500),

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: ((1150 * .65) - 20).w,
                                child: Image(
                                    image:
                                        NetworkImage(imageurl))),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: ((1150 * .65) - 20).w,
                              child: Text(
                                newsdescription,
                                // overflow: TextOverflow.ellipsis,
                                // maxLines: 6,
                                      style:GoogleFonts.notoSerifMalayalam(fontSize: 19.sp, fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        // height: 500.w,
                        width: (1150 * .35).w,
                        color: kwhitecolor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.w,
                            ),
                            SizedBox(
                              height: 30.w,
                              child: Text(
                                'Recent News',
                                style: TextStyle(
                                    fontSize: 22.w,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            // kasargodcontainer(),
                            // SizedBox(
                            //   height: 10.w,
                            // ),
                            // kasargodcontainer(),
                            // SizedBox(
                            //   height: 10.w,
                            // ),
                            // kasargodcontainer(),
                            // SizedBox(
                            //   height: 10.w,
                            // ),
                            // kasargodcontainer(),
                            // SizedBox(
                            //   height: 10.w,
                            // ),
                            // kasargodcontainer(),
                            // SizedBox(
                            //   height: 10.w,
                            // ),
                            // kasargodcontainer(),
                            // SizedBox(
                            //   height: 10.w,
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                  bottumwidget()
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
