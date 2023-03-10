import 'package:city_chennel_web/core/constants.dart';
import 'package:city_chennel_web/model/programmemodel.dart';
import 'package:city_chennel_web/presentation/catogorypage/catogoryscreenkasaragod.dart';
import 'package:city_chennel_web/presentation/catogorypage/catogoryscreenkerala.dart';
import 'package:city_chennel_web/presentation/catogorypage/catogoryscreennational.dart';
import 'package:city_chennel_web/presentation/catogorypage/catogoryscreenprogramme.dart';
import 'package:city_chennel_web/presentation/homepage/homepage.dart';
import 'package:city_chennel_web/presentation/homepage/youtubetest.dart';
import 'package:city_chennel_web/presentation/livetv/livetv.dart';
import 'package:city_chennel_web/presentation/login/loginpage.dart';
import 'package:city_chennel_web/presentation/video/videoscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class kasargodcontainer extends StatelessWidget {
  final kasargodimage;
  final kasargodtext;
  const kasargodcontainer(
      {Key? key, required this.kasargodimage, required this.kasargodtext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
            fit: BoxFit.cover,
            width: 150.w,
            height: 130.w,
            image: NetworkImage(kasargodimage)),
        Container(
          padding: EdgeInsets.only(left: 10.w),
          width: 221.w,
          child: Text(
            kasargodtext,
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            style: GoogleFonts.notoSerifMalayalam(
                fontSize: 20.sp, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class insiderecentnews extends StatelessWidget {
  final insideimage;
  final insidetext;
  const insiderecentnews(
      {Key? key, required this.insideimage, required this.insidetext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
            fit: BoxFit.cover,
            width: 140.w,
            height: 110.w,
            image: NetworkImage(insideimage)),
        Container(
          padding: EdgeInsets.only(left: 10.w),
          width: 250.w,
          child: Text(
            insidetext,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style: GoogleFonts.notoSerifMalayalam(
                fontSize: 20.sp, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class keralacontainer extends StatelessWidget {
  String keralaimage;
  String keralatext;
  String keraladiscription;

  keralacontainer(
      {Key? key,
      required this.keralaimage,
      required this.keralatext,
      required this.keraladiscription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410.w,
      width: 371.w,
      color: kwhitecolor,
      child: Column(
        children: [
          Container(
              height: 245.w,
              child:
                  Image(fit: BoxFit.cover, image: NetworkImage(keralaimage))),
          SizedBox(
            height: 8.w,
          ),
          Text(
            keralatext,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.notoSerifMalayalam(
                fontSize: 23.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5.w,
          ),
          Text(
            keraladiscription,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: GoogleFonts.notoSerifMalayalam(
                fontSize: 16.sp, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

class programesvideocontainer extends StatelessWidget {
  final index;
  programesvideocontainer({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('programme').snapshots(),
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
          final data =
              programmemodel.fromMap(snapshot.data!.docs[index].data());
          final url = data.programmeyoutubeurl;
          return GestureDetector(
            onTap: () => launchUrl(Uri.parse(url!)),
            child: Container(
              color: kblackcolor,
              width: 220.w,
              height: 220 * (9 / 16).w,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(data.programmeimageurl!),
              ),
            ),
          );
        });
  }
}

class nationalcontainer extends StatelessWidget {
  String nationalimage;
  String nationaltext;
  String nationaldiscription;
  nationalcontainer(
      {Key? key,
      required this.nationalimage,
      required this.nationaltext,
      required this.nationaldiscription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.w,
      width: 280.w,
      color: Color.fromARGB(255, 255, 255, 255),
      child: Column(
        children: [
          Image(
              height: 150.w,
              width: 280.w,
              fit: BoxFit.cover,
              image: NetworkImage(nationalimage)),
          SizedBox(
            height: 8.w,
          ),
          Text(
            nationaltext,
            style: GoogleFonts.notoSerifMalayalam(
                fontSize: 22.sp, fontWeight: FontWeight.w500),
            maxLines: 3,
          ),
          Text(
            nationaldiscription,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: GoogleFonts.notoSerifMalayalam(
                fontSize: 15.sp, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

class tablecontent extends StatelessWidget {
  final String title;
  const tablecontent({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 17.w, color: kblackcolor, fontWeight: FontWeight.bold),
    );
  }
}

class tablewidget extends StatelessWidget {
  const tablewidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      color: const Color.fromARGB(255, 232, 236, 253),
      height: 40.w,
      width: 1150.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.offAll(() => homePage()),
            child: const tablecontent(title: 'HOME'),
          ),
          // GestureDetector(
          //   onTap: () => Get.to(() => Videoscreen()),
          //   child: const tablecontent(title: 'VIDEOS'),
          // ),
          GestureDetector(
              onTap: () => Get.to(() => Categoryscreenkasargod()),
              child: const tablecontent(title: 'KASARAGOD')),
          GestureDetector(
              onTap: () => Get.to(() => Categoryscreenkerala()),
              child: const tablecontent(title: 'KERALA')),
          GestureDetector(
              onTap: () => Get.to(() => Categoryscreennational()),
              child: const tablecontent(title: 'NATIONAL')),
          GestureDetector(
              onTap: () => Get.to(() => programmescreen()),
              child: tablecontent(title: 'PROGRAME')),
          SizedBox(
            width: 180.w,
          ),
          const tablecontent(title: 'CONTACT US'),
        ],
      ),
    );
  }
}

class headwidget extends StatelessWidget {
  const headwidget({
    Key? key,
    // required this.screenwidth,
  }) : super(key: key);

  // final double screenwidth;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now().day;
    final day = (DateFormat('EEEE').format(DateTime.now())).toUpperCase();
    // print();
    final year = DateTime.now().year;
    final month = (DateFormat('MMM').format(DateTime.now())).toUpperCase();

    // print(date);
    return Container(
      height: 80.w,
      width: 1150.w,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: kwhitecolor,
            child: Image(
              width: 150.w,
              image: const AssetImage('assets/LOGO.jpg'),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  date.toString(),
                  style:
                      TextStyle(fontSize: 52.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$month $year',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$day',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 220.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => launchUrl(Uri.parse(
                      'https://www.facebook.com/citychannel.kanhangad.5?mibextid=LQQJ4d')),
                  child: Icon(
                    Icons.facebook,
                    size: 24.sp,
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.whatsapp,
                  size: 24.sp,
                ),
                // GestureDetector(onTap: () => Get.to(YoutubeAppDemo()),
                GestureDetector(
                  onTap: () => launchUrl(
                      Uri.parse('https://www.youtube.com/@citynewskhd')),
                  child: FaIcon(
                    FontAwesomeIcons.youtube,
                    size: 24.sp,
                  ),
                ),
                // ),
                FaIcon(
                  FontAwesomeIcons.instagram,
                  size: 24.sp,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(() => Livescreen()),
            child: Container(
              height: 80.w,
              width: 200.w,
              color: const Color.fromARGB(255, 187, 22, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.live_tv,
                    color: kwhitecolor,
                    size: 24.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'LIVE TV',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: kwhitecolor,
                        letterSpacing: 2.w),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 110.w,
            color: kblackcolor,
            child: GestureDetector(
              onTap: () => Get.to(() => Loginpage()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    color: kwhitecolor,
                    size: 40.sp,
                  ),
                  Text(
                    'LOGIN',
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

class bottumwidget extends StatelessWidget {
  const bottumwidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: kwhitecolor,
          height: 80.w,
          width: 1150.w,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: kwhitecolor,
                child: Image(
                  width: 150.w,
                  image: const AssetImage('assets/LOGO.jpg'),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                width: 750.w,
                child: Text(
                  'Cityksd.com, a news portal from house of City Channel.  The portal stands amount the very few non biased news portals from the state of kerala',
                  style: TextStyle(fontSize: 15.w),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 220.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.facebook,
                      size: 24.sp,
                    ),
                    FaIcon(
                      FontAwesomeIcons.whatsapp,
                      size: 24.sp,
                    ),
                    FaIcon(
                      FontAwesomeIcons.youtube,
                      size: 24.sp,
                    ),
                    FaIcon(
                      FontAwesomeIcons.instagram,
                      size: 24.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          child: Text(
            '?? www.cityksd.com',
            style: TextStyle(fontSize: 15.w, letterSpacing: 2),
          ),
        ),
        SizedBox(
          height: 20.w,
        ),
        SizedBox(
            child: Text(
          'Powered By Tradom Technologies',
          style: TextStyle(fontSize: 15.w, letterSpacing: 2),
        )),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
