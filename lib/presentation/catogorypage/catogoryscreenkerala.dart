import 'package:city_chennel_web/core/constants.dart';
import 'package:city_chennel_web/presentation/homepage/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categoryscreenkerala extends StatelessWidget {
  const Categoryscreenkerala({super.key,});

  @override
  Widget build(BuildContext context) {
    print((1150 * .75) - 350);
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  headwidget(),
                  tablewidget(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: (1150 * .75).w,
                        // height: 500.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.w,
                            ),
                            Text(
                              'Kerala',
                              style: TextStyle(
                                  fontSize: 22.w, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      SizedBox(
                                          height: 250.w,
                                          width: 350.w,
                                          child: Image(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/nepal-edited.jpg'))),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        height: 250.w,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: 490.w,
                                              child: Text(
                                                ktext,
                                                style: TextStyle(
                                                    fontSize: 25.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.w,
                                            ),
                                            SizedBox(
                                              width: 490.w,
                                              // height: 180.w,
                                              child: Text(
                                                ktextnews,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 7,
                                                style:
                                                    TextStyle(fontSize: 18.sp),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 12.0.w),
                                    child: Container(
                                      height: 1.w,
                                      color: kgreycolor,
                                    ),
                                  );
                                },
                                itemCount: 10),
                            SizedBox(
                              height: 10.w,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.w),
                        child: Container(
                          width: (1150 * .25).w,
                          height: 500.w,
                          color: kgreycolor,
                          child: Center(
                            child: Text('Your ADVT Here',style: TextStyle(fontSize: 14.sp),),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.w,
          ),
          bottumwidget()
        ],
      ),
    );
  }
}
