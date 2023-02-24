import 'package:city_chennel_web/core/constants.dart';
import 'package:city_chennel_web/model/kasaragodnewsmodel.dart';
import 'package:city_chennel_web/model/keralanewsmodel.dart';
import 'package:city_chennel_web/model/nationalnewsmodel.dart';
import 'package:city_chennel_web/presentation/homepage/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
                                style: GoogleFonts.notoSerifMalayalam(
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Container(
                                width: ((1150 * .65) - 20).w,
                                child: Image(image: NetworkImage(imageurl))),
                            SizedBox(
                              height: 10.w,
                            ),
                            SizedBox(
                              width: ((1150 * .65) - 20).w,
                              child: Text(
                                newsdescription,
                                // overflow: TextOverflow.ellipsis,
                                // maxLines: 6,
                                style: GoogleFonts.notoSerifMalayalam(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w500),
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
                            StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('keralanews')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return const CircularProgressIndicator();
                                  }
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: Text(
                                        'Data not available',
                                      ),
                                    );
                                  }
                                  final data = keralanewsmodel
                                      .fromMap(snapshot.data!.docs[0].data());
                                  return GestureDetector(
                                      onTap: () => Get.to(NewsinsideScreen(
                                          imageurl: data.keralaimageurl,
                                          newsdescription:
                                              data.keralanewsdescription,
                                          newstitle: data.keralanewstitle)),
                                      child: insiderecentnews(
                                          insideimage: data.keralaimageurl,
                                          insidetext: data.keralanewstitle));
                                }),
                            SizedBox(
                              height: 10.w,
                            ),
                            StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('kasaragodnews')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return const CircularProgressIndicator();
                                  }
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: Text(
                                        'Data not available',
                                      ),
                                    );
                                  }
                                  final data = kasaragodnewsmodel
                                      .fromMap(snapshot.data!.docs[0].data());
                                  return GestureDetector(
                                      onTap: () => Get.to(NewsinsideScreen(
                                          imageurl: data.kasaragodimageurl,
                                          newsdescription:
                                              data.kasaragodnewsdescription,
                                          newstitle: data.kasaragodnewstitle)),
                                      child: insiderecentnews(
                                          insideimage: data.kasaragodimageurl,
                                          insidetext: data.kasaragodnewstitle));
                                }),
                            SizedBox(
                              height: 10.w,
                            ),
                            StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('nationalnews')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return const CircularProgressIndicator();
                                  }
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: Text(
                                        'Data not available',
                                      ),
                                    );
                                  }
                                  final data = nationalnewsmodel
                                      .fromMap(snapshot.data!.docs[0].data());
                                  return GestureDetector(
                                      onTap: () => Get.to(NewsinsideScreen(
                                          imageurl: data.nationalimageurl,
                                          newsdescription:
                                              data.nationalnewsdescription,
                                          newstitle: data.nationalnewstitle)),
                                      child: insiderecentnews(
                                          insideimage: data.nationalimageurl,
                                          insidetext: data.nationalnewstitle));
                                }),
                            SizedBox(
                              height: 10.w,
                            ),
                            StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('keralanews')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return const CircularProgressIndicator();
                                  }
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: Text(
                                        'Data not available',
                                      ),
                                    );
                                  }
                                  final data = keralanewsmodel
                                      .fromMap(snapshot.data!.docs[1].data());
                                  return GestureDetector(
                                      onTap: () => Get.to(NewsinsideScreen(
                                          imageurl: data.keralaimageurl,
                                          newsdescription:
                                              data.keralanewsdescription,
                                          newstitle: data.keralanewstitle)),
                                      child: insiderecentnews(
                                          insideimage: data.keralaimageurl,
                                          insidetext: data.keralanewstitle));
                                }),
                            SizedBox(
                              height: 10.w,
                            ),
                            StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('kasaragodnews')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return const CircularProgressIndicator();
                                  }
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: Text(
                                        'Data not available',
                                      ),
                                    );
                                  }
                                  final data = kasaragodnewsmodel
                                      .fromMap(snapshot.data!.docs[1].data());
                                  return GestureDetector(
                                      onTap: () => Get.to(NewsinsideScreen(
                                          imageurl: data.kasaragodimageurl,
                                          newsdescription:
                                              data.kasaragodnewsdescription,
                                          newstitle: data.kasaragodnewstitle)),
                                      child: insiderecentnews(
                                          insideimage: data.kasaragodimageurl,
                                          insidetext: data.kasaragodnewstitle));
                                }),
                            SizedBox(
                              height: 10.w,
                            ),
                            StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('nationalnews')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return const CircularProgressIndicator();
                                  }
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: Text(
                                        'Data not available',
                                      ),
                                    );
                                  }
                                  final data = nationalnewsmodel
                                      .fromMap(snapshot.data!.docs[1].data());
                                  return GestureDetector(
                                      onTap: () => Get.to(NewsinsideScreen(
                                          imageurl: data.nationalimageurl,
                                          newsdescription:
                                              data.nationalnewsdescription,
                                          newstitle: data.nationalnewstitle)),
                                      child: insiderecentnews(
                                          insideimage: data.nationalimageurl,
                                          insidetext: data.nationalnewstitle));
                                }),
                            SizedBox(
                              height: 10.w,
                            ),
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
