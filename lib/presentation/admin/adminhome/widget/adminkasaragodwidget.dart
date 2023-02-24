import 'package:city_chennel_web/controller/adminhomecontroller.dart';
import 'package:city_chennel_web/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Adminkasaragodwidget extends StatelessWidget {
  Adminkasaragodwidget({
    Key? key,
  }) : super(key: key);

  final kasaragodnewstitle = TextEditingController();
  final kasaragodnewsdescription = TextEditingController();

  final getcontroller = Get.put(adminhomexontroller());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(10.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kasaragod',
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
          // SizedBox(height: 10.w),
          // Text('Videos',
          //     style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 10.w),
          SizedBox(
            height: 60.w,
            child: TextFormField(
              controller: kasaragodnewstitle,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 13.0.w,
                    horizontal: 10.0.w,
                  ),
                  border: OutlineInputBorder(
                    // borderSide:
                    //     const BorderSide(
                    //   color: Color.fromARGB(
                    //       255, 12, 3, 108),
                    // ),
                    borderRadius: BorderRadius.circular(5.w),
                  ),
                  hintText: 'News Title Enter Here',
                  hintStyle: TextStyle(fontSize: 18.sp, color: kblackcolor)),
            ),
          ),

          SizedBox(height: 10.w),
          Text(
            'Newscard',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.w),
          Row(
            children: [
              GetBuilder<adminhomexontroller>(builder: (context) {
                return Container(
                  height: 250.w,
                  width: 200.w,
                  decoration:
                      BoxDecoration(border: Border.all(color: kblackcolor)),
                  child: getcontroller.homenewscardimg == null
                      ? SizedBox()
                      : Image(
                          image: MemoryImage(getcontroller.homenewscardimg!)),
                );
              }),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                width: 600.w,
                height: 250.w,
                child: TextFormField(
                  controller: kasaragodnewsdescription,
                  maxLines: 20,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 13.0.w,
                        horizontal: 10.0.w,
                      ),
                      border: OutlineInputBorder(
                        // borderSide:
                        //     const BorderSide(
                        //   color: Color.fromARGB(
                        //       255, 12, 3, 108),
                        // ),
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      hintText: 'Enter News description Here',
                      hintStyle:
                          TextStyle(fontSize: 18.sp, color: kblackcolor)),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.w),
          Row(
            children: [
              Text(
                'Upload Newscard Image',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    getcontroller.uploadimagefile();
                  },
                  icon: Icon(
                    Icons.attach_file,
                    size: 24.w,
                  ))
            ],
          ),
          SizedBox(
            width: 150.w,
            height: 30.w,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kblackcolor, foregroundColor: kwhitecolor),
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      content: const Text('Are you sure you want to submit'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            kasaragodnewstitle.clear();
                            kasaragodnewsdescription.clear();
                            getcontroller.homenewscardimg = null;

                            Navigator.pop(context, 'Cancel');
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            getcontroller.kasaragodnewsurl(
                                kasaragodimageurl:
                                    getcontroller.newscardimagefileurl!,
                                kasaragodnewstitle: kasaragodnewstitle.text,
                                kasaragodnewsdescription:
                                    kasaragodnewsdescription.text);
                            Navigator.pop(context, 'submit');
                            kasaragodnewstitle.clear();
                            kasaragodnewsdescription.clear();
                            getcontroller.homenewscardimg = null;
                          },
                          child: const Text('submit'),
                        ),
                      ],
                    ),
                  );

                  print('KASARAGOD NEWS UPLOADED');
                },
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 18.sp),
                )),
          ),
        ],
      ),
    );
  }
}
