import 'package:city_chennel_web/core/constants.dart';
import 'package:city_chennel_web/model/keralanewsmodel.dart';
import 'package:city_chennel_web/model/programmemodel.dart';
import 'package:city_chennel_web/presentation/homepage/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class programmescreen extends StatelessWidget {
  const programmescreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('programme')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return CircularProgressIndicator();
                            }
                            if (!snapshot.hasData) {
                              return Center(
                                child: Text(
                                  'Data not available',
                                ),
                              );
                            }

                            return Container(
                              width: (1150).w,

                              // height: 500.w,
                              child: GridView.count(
                                childAspectRatio: 1.32,
                                crossAxisCount: 5,
                                // crossAxisSpacing: 5.0.w,
                                // mainAxisSpacing: 5.0.w,
                                shrinkWrap: true,
                                children: List.generate(
                                  snapshot.data!.size < 20
                                      ? snapshot.data!.size
                                      : 20,
                                  (index) {
                                    final data = programmemodel.fromMap(
                                        snapshot.data!.docs[index].data());
                                        final url = data.programmeyoutubeurl;
                                    return Padding(
                                      padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w,top: 10.0.w),
                                      child: GestureDetector(onTap: () => launchUrl(Uri.parse(url!)),
                                        child: Container(
                                          // height: 100,
                                          // color: kgreycolor,
                                          child: Column(
                                            children: [
                                              Container(
                                                color: kashcolor,
                                                child: Image(
                                                    image: NetworkImage(
                                                        data.programmeimageurl!)),
                                              ),SizedBox(height: 2,),
                                              Text(data.programmetitle!,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          }),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 12.w),
                      //   child: Container(
                      //     width: (1150 * .25).w,
                      //     height: 500.w,
                      //     color: kgreycolor,
                      //     child: Center(
                      //       child: Text(
                      //         'Your ADVT Here',
                      //         style: TextStyle(fontSize: 14.sp),
                      //       ),
                      //     ),
                      //   ),
                      // )
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
