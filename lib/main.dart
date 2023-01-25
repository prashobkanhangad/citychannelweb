import 'package:city_chennel_web/core/constants.dart';
import 'package:city_chennel_web/presentation/catogorypage/catogoryscreenkasaragod.dart';
import 'package:city_chennel_web/presentation/livetv/livetv.dart';
import 'package:city_chennel_web/presentation/newsinsidescreen/newsinsidescreen.dart';
import 'package:city_chennel_web/presentation/admin/adminhome/adminhome.dart';
import 'package:city_chennel_web/presentation/homepage/homepage.dart';
import 'package:city_chennel_web/presentation/login/loginpage.dart';
import 'package:city_chennel_web/presentation/video/videoscreen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    DevicePreview(builder: (context) {
      return const MyApp();
    }),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1536.0, 841.599),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            initialRoute: '/',
            routes: {
              '/livetv': (context) => Livescreen(),
            },
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: kwhitecolor,
              fontFamily: GoogleFonts.montserrat().fontFamily,
              primarySwatch: Colors.blue,
            ),
            home: homePage(),
          );
        });
  }
}
