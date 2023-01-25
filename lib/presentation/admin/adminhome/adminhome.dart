import 'package:city_chennel_web/controller/adminhomecontroller.dart';
import 'package:city_chennel_web/core/constants.dart';
import 'package:city_chennel_web/presentation/admin/adminhome/widgets.dart';
import 'package:city_chennel_web/presentation/homepage/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class adminHome extends StatelessWidget {
  adminHome({super.key});

  // int selectedoption = 0;
  final getcontroller = Get.put(adminhomexontroller());

  @override
  Widget build(BuildContext context) {
    // print(getcontroller.selectedoption);
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  adminheadwidget(),
                  Container(
                    height: 2.w,
                    color: kblackcolor,
                    width: 1150.w,
                  ),
                  Row(
                    children: [
                      GetBuilder<adminhomexontroller>(builder: (getdata) {
                        return Container(
                          width: 300.w,
                          height: 700.w,
                          child: Column(
                            children: [
                              GestureDetector(
                                  onTap: () => getcontroller.changeoption(0),
                                  child: leftsideselectionwidget(
                                    title: 'Home',
                                    selectedcolor:
                                        getcontroller.selectedoption == 0
                                            ? kgreycolor
                                            : kashcolor,
                                  )),
                              heigh5,
                              GestureDetector(
                                  onTap: () => getcontroller.changeoption(1),
                                  child: leftsideselectionwidget(
                                    title: 'Live Tv',
                                    selectedcolor:
                                        getcontroller.selectedoption == 1
                                            ? kgreycolor
                                            : kashcolor,
                                  )),
                              heigh5,
                              GestureDetector(
                                  onTap: () => getcontroller.changeoption(2),
                                  child: leftsideselectionwidget(
                                    title: 'Videos',
                                    selectedcolor:
                                        getcontroller.selectedoption == 2
                                            ? kgreycolor
                                            : kashcolor,
                                  )),
                              heigh5,
                              GestureDetector(
                                  onTap: () => getcontroller.changeoption(3),
                                  child: leftsideselectionwidget(
                                    title: 'Kerala',
                                    selectedcolor:
                                        getcontroller.selectedoption == 3
                                            ? kgreycolor
                                            : kashcolor,
                                  )),
                              heigh5,
                              GestureDetector(
                                  onTap: () => getcontroller.changeoption(4),
                                  child: leftsideselectionwidget(
                                    title: 'Kasargod',
                                    selectedcolor:
                                        getcontroller.selectedoption == 4
                                            ? kgreycolor
                                            : kashcolor,
                                  )),
                              heigh5,
                              GestureDetector(
                                  onTap: () => getcontroller.changeoption(5),
                                  child: leftsideselectionwidget(
                                    title: 'National',
                                    selectedcolor:
                                        getcontroller.selectedoption == 5
                                            ? kgreycolor
                                            : kashcolor,
                                  )),
                              heigh5,
                              GestureDetector(
                                  onTap: () => getcontroller.changeoption(6),
                                  child: leftsideselectionwidget(
                                    title: 'Programme',
                                    selectedcolor:
                                        getcontroller.selectedoption == 6
                                            ? kgreycolor
                                            : kashcolor,
                                  )),
                              heigh5,
                            ],
                          ),
                        );
                      }),
                      Container(
                        color: kblackcolor,
                        height: 700.w,
                        width: 2.w,
                      ),
                      GetBuilder<adminhomexontroller>(
                        builder: (getdata) {
                          return Container(
                              height: 700.w,
                              width: 848.w,
                              child: getcontroller.selectedoption == 0
                                  ? adminhomewidget(
                                      picimageforhomenewscard: () =>
                                          print('object')
                                      // getcontroller.picimageforhomenewscard,
                                      )
                                  : getcontroller.selectedoption == 1
                                      ? adminlivetvwidget()
                                      : getcontroller.selectedoption == 2
                                          ? adminvideoswidget()
                                          : getcontroller.selectedoption == 3
                                              ? adminkeralaswidget()
                                              : getcontroller.selectedoption ==
                                                      4
                                                  ? Adminkasaragodwidget()
                                                  : getcontroller
                                                              .selectedoption ==
                                                          5
                                                      ? Adminnationalwidget()
                                                      : Adminprogrammewidget());
                        },
                      )
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
