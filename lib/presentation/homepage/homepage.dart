import 'dart:developer';

import 'package:city_chennel_web/controller/adminhomecontroller.dart';
import 'package:city_chennel_web/controller/homecontroller.dart';
import 'package:city_chennel_web/core/constants.dart';
import 'package:city_chennel_web/model/kasaragodnewsmodel.dart';
import 'package:city_chennel_web/model/keralanewsmodel.dart';
import 'package:city_chennel_web/model/newscardmodel.dart';
import 'package:city_chennel_web/model/newstimemodel.dart';
import 'package:city_chennel_web/presentation/homepage/youtubetest.dart';
import 'package:city_chennel_web/presentation/newsinsidescreen/newsinsidescreen.dart';
import 'package:city_chennel_web/presentation/homepage/widget.dart';
import 'package:city_chennel_web/presentation/login/loginpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class Homeview extends GetResponsiveView {}

class homePage extends StatelessWidget {
  // final AsyncSnapshot snapshot;

  homePage({
    super.key,
  });

  // List<Newstimemodel> basketitems = [];

  final livestreamurlcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // fetchnewstimeurl() async {
    //   var records =
    //       await FirebaseFirestore.instance.collection('citynewstime').get();
    // }

    // mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    //   var _list = records.docs
    //       .map(
    //         (newstimemodel) => Newstimemodel(
    //             newstimeurl: newstimemodel['newstimeurl'],
    //             uid: newstimemodel.id),
    //       )
    //       .toList();
    //   basketitems = _list;
    // }

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'iLnmTe5Q2Qw',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );

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
                  const headwidget(),
                  const tablewidget(),
                  Container(
                    color: kwhitecolor,
                    width: 1150.w,
                    // height: (screenwidth - ((screenwidth / 4)))*0.5625,
                    padding: EdgeInsets.symmetric(vertical: 20.w),
                    child: Row(
                      children: [
                        // StreamBuilder(
                        //     stream: FirebaseFirestore.instance
                        //         .collection('citynewstime')
                        //         .snapshots(),
                        //     builder: (context, snapshot) {
                        // final length = snapshot.data!.size;

                        // final citynewsdata = Newstimemodel.fromJson(
                        //     snapshot.data!.docs[length - 1].data());

                        // // log(citynewsdata.toString());

                        // final docUser = FirebaseFirestore.instance
                        //     .collection('peoples')
                        //     .doc(citynewsdata.uid);
                        // return
                        Column(children: [
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
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('citynewstime')
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
                                final data = Newstimemodel.fromJson(
                                    snapshot.data!.docs[0].data());
                                return Container(
                                    color: Colors.indigo[600],
                                    height: 405.w,
                                    width: 720.w,
                                    child: YoutubeAppDemo(
                                      videourl: data.newstimeurl,
                                    ));
                              }),
                        ]
                            // );
                            // }
                            ),
                        SizedBox(
                          width: 20.w,
                        ),
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('shortnews')
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

                              final length = snapshot.data!.docs.length;
                              final data = Shortnewsmodel.fromMap(
                                  snapshot.data!.docs[0].data());
                              // final docUser = FirebaseFirestore.instance
                              //     .collection('peoples')
                              //     .doc(data.uid);
                              print(data.shortnewsimgurl);

                              //             final citynewsdata = Newstimemodel.fromJson(
                              // snapshot.data!.docs[0].data());
                              return Container(
                                width: 410.w,
                                height: 440.w,
                                color: Color.fromARGB(255, 239, 199, 199),
                                child: Image(
                                    image: NetworkImage(data.shortnewsimgurl)),
                              );
                            })
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
                          child: StreamBuilder(
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
                                final data = kasaragodnewsmodel
                                    .fromMap(snapshot.data!.docs[0].data());
                                return Container(
                                  height: 460.w,
                                  width: 371.w,
                                  color: kwhitecolor,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      Container(
                                        height: 200.w,
                                        child: Image(
                                            image: NetworkImage(
                                                data.kasaragodimageurl!)),
                                      ),
                                      SizedBox(
                                        height: 8.w,
                                      ),
                                      Text(
                                        data.kasaragodnewstitle!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5.w,
                                      ),
                                      Text(
                                        data.kasaragodnewsdescription!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 6,
                                        style: TextStyle(fontSize: 15.sp),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('keralanews')
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
                              final data = keralanewsmodel
                                  .fromMap(snapshot.data!.docs[0].data());
                              return Container(
                                height: 460.w,
                                width: 371.w,
                                color: kwhitecolor,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30.w,
                                    ),
                                    SizedBox(
                                      height: 200.w,
                                      child: Image(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              data.keralaimageurl!)),
                                    ),
                                    SizedBox(
                                      height: 8.w,
                                    ),
                                    Text(
                                      data.keralanewstitle!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5.w,
                                    ),
                                    Text(
                                      data.keralanewsdescription!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 6,
                                      style: TextStyle(fontSize: 15.sp),
                                    )
                                  ],
                                ),
                              );
                            }),
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
                              final data0 = kasaragodnewsmodel
                                  .fromMap(snapshot.data!.docs[1].data());
                              final data1 = kasaragodnewsmodel
                                  .fromMap(snapshot.data!.docs[2].data());
                              final data2 = kasaragodnewsmodel
                                  .fromMap(snapshot.data!.docs[3].data());
                              return Container(
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
                                    kasargodcontainer(
                                        kasargodimage: data0.kasaragodimageurl,
                                        kasargodtext: data0.kasaragodnewstitle),
                                    SizedBox(
                                      height: 10.w,
                                    ),
                                    kasargodcontainer(
                                        kasargodimage: data1.kasaragodimageurl,
                                        kasargodtext: data1.kasaragodnewstitle),
                                    SizedBox(
                                      height: 10.w,
                                    ),
                                    kasargodcontainer(
                                        kasargodimage: data2.kasaragodimageurl,
                                        kasargodtext: data2.kasaragodnewstitle),
                                    SizedBox(
                                      height: 8.w,
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 5.w,
                  // ),
                  Container(
                    width: 1150.w,
                    height: 150.w,
                    decoration:
                        BoxDecoration(border: Border.all(color: kblackcolor)),
                    // color: Colors.black,
                    child: Center(child: Text('Your ADVT Comes Here')),
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
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('keralanews')
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
                        final data0 = keralanewsmodel
                            .fromMap(snapshot.data!.docs[1].data());
                        final data1 = keralanewsmodel
                            .fromMap(snapshot.data!.docs[2].data());
                        final data2 = keralanewsmodel
                            .fromMap(snapshot.data!.docs[3].data());
                        return Container(
                          padding: const EdgeInsets.only(top: 5),
                          width: 1150.w,
                          height: 450.w,
                          color: kwhitecolor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              keralacontainer(
                                  keralaimage: data0.keralaimageurl!,
                                  keralatext: data0.keralanewstitle!,
                                  keraladiscription:
                                      data0.keralanewsdescription!),
                              keralacontainer(
                                  keralaimage: data1.keralaimageurl!,
                                  keralatext: data1.keralanewstitle!,
                                  keraladiscription:
                                      data1.keralanewsdescription!),
                              keralacontainer(
                                  keralaimage: data2.keralaimageurl!,
                                  keralatext: data2.keralanewstitle!,
                                  keraladiscription:
                                      data2.keralanewsdescription!),
                            ],
                          ),
                        );
                      }),
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
                  const SizedBox(
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
                  const bottumwidget()
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
