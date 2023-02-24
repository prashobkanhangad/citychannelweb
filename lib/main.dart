import 'package:city_chennel_web/core/constants.dart';
import 'package:city_chennel_web/presentation/admin/adminhome/adminhome.dart';
import 'package:city_chennel_web/presentation/livetv/livetv.dart';
import 'package:city_chennel_web/presentation/homepage/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Firebase.initializeApp();
  runApp(const MyApp());
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
            title: 'City Channel',
            theme: ThemeData(
              scaffoldBackgroundColor: kwhitecolor,
              fontFamily: GoogleFonts.montserrat().fontFamily,
              primarySwatch: Colors.blue,
            ),
            home:
             homePage(),
          );
        });
  }
}
