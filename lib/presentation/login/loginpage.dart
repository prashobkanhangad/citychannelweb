import 'package:city_chennel_web/core/constants.dart';
import 'package:city_chennel_web/presentation/admin/adminhome/adminhome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});

  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500.w,
          // color: Color.fromARGB(255, 235, 233, 246),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(
              //   height: 210,
              // ),
              Text(
                'Admin Login',
                style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              SizedBox(
                height: 30.w,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60.w,
                      child: TextFormField(
                        controller: usernamecontroller,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 13.0.w,
                              horizontal: 10.0.w,
                            ),
                            prefixIcon: Icon(Icons.email,
                                size: 24.sp,
                                color: const Color.fromARGB(255, 12, 3, 108)),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 12, 3, 108),
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hintText: 'USER NAME',
                            hintStyle: TextStyle(
                                fontSize: 18.sp,
                                color: const Color.fromARGB(255, 12, 3, 108))),
                      ),
                    ),
                    SizedBox(height: 20.w),
                    SizedBox(
                      height: 60.w,
                      child: TextFormField(obscureText: true,
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 13.0.w,
                              horizontal: 10.0.w,
                            ),
                            prefixIcon: Icon(Icons.vpn_key,
                                size: 24.sp,
                                color: const Color.fromARGB(255, 12, 3, 108)),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 12, 3, 108),
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hintText: 'PASSWORD',
                            hintStyle: TextStyle(
                                fontSize: 18.sp,
                                color: const Color.fromARGB(255, 12, 3, 108))),
                      ),
                    ),
                    SizedBox(
                      height: 34.w,
                    ),
                    SizedBox(
                      height: 40.w,
                      width: double.maxFinite,
                      child: ElevatedButton(
                          onPressed: () {
                            if (usernamecontroller.text == 'admin' &&
                                passwordcontroller.text == 'admin@9988') {
                              Get.to(() => adminHome());
                            }
                            //  else {
                            //   Fluttertoast.showToast(
                            //       msg: "This is Center Short Toast",
                            //       toastLength: Toast.LENGTH_SHORT,
                            //       gravity: ToastGravity.CENTER,
                            //       timeInSecForIosWeb: 1,
                            //       backgroundColor: Colors.red,
                            //       textColor: Colors.white,
                            //       fontSize: 16.0);
                            // }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 12, 3, 108),
                              foregroundColor:
                                  const Color.fromARGB(255, 255, 255, 255)),
                          child: Text(
                            'Log In',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.sp),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
