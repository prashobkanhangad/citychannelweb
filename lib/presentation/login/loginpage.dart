import 'package:city_chennel_web/core/constants.dart';
import 'package:city_chennel_web/presentation/admin/adminhome/adminhome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

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
                            hintText: 'EMAIL',
                            hintStyle: TextStyle(
                                fontSize: 18.sp,
                                color: const Color.fromARGB(255, 12, 3, 108))),
                      ),
                    ),
                    SizedBox(height: 20.w),
                    SizedBox(
                      height: 60.w,
                      child: TextFormField(
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
                            Get.to(() => adminHome());
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
