import 'package:city_chennel_web/core/constants.dart';
import 'package:city_chennel_web/model/kasaragodnewsmodel.dart';
import 'package:city_chennel_web/presentation/homepage/widget.dart';
import 'package:city_chennel_web/presentation/newsinsidescreen/newsinsidescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Categoryscreenkasargod extends StatelessWidget {
  const Categoryscreenkasargod({
    super.key,
  });

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
                              'Kasaragod',
                              style: TextStyle(
                                  fontSize: 22.w, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('kasaragodnews')
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

                                  return ListView.separated(
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        final data = kasaragodnewsmodel.fromMap(
                                            snapshot.data!.docs[index].data());
                                        return GestureDetector(
                                          onTap: () => Get.to(NewsinsideScreen(
                                              imageurl: data.kasaragodimageurl,
                                              newsdescription: data.kasaragodnewsdescription,
                                              newstitle: data.kasaragodnewstitle)),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                  height: 250.w,
                                                  width: 350.w,
                                                  child: Image(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(data
                                                          .kasaragodimageurl!))),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w),
                                                height: 250.w,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      width: 490.w,
                                                      child: Text(
                                                        data.kasaragodnewstitle!,
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 23.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.w,
                                                    ),
                                                    SizedBox(
                                                      width: 490.w,
                                                      // height: 180.w,
                                                      child: Text(
                                                        data.kasaragodnewsdescription!,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 6,
                                                        style: TextStyle(
                                                            fontSize: 18.sp),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12.0.w),
                                          child: Container(
                                            height: 1.w,
                                            color: kgreycolor,
                                          ),
                                        );
                                      },
                                      itemCount: snapshot.data!.size < 20
                                          ? snapshot.data!.size
                                          : 20);
                                }),
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
                            child: Text(
                              'Your ADVT Here',
                              style: TextStyle(fontSize: 14.sp),
                            ),
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
