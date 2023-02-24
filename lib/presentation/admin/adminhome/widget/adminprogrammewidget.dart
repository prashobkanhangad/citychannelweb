import 'package:city_chennel_web/controller/adminhomecontroller.dart';
import 'package:city_chennel_web/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Adminprogrammewidget extends StatelessWidget {
  Adminprogrammewidget({
    Key? key,
  }) : super(key: key);

  final programmelinktitlecontroller = TextEditingController();
  final programmetitle = TextEditingController();

  final getcontroller = Get.put(adminhomexontroller());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Programme',
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
          // SizedBox(height: 10.w),
          // Text('Videos',
          //     style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 10.w),
          SizedBox(
            height: 60.w,
            child: TextFormField(
              controller: programmetitle,
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
                  hintText: 'Programme title Here',
                  hintStyle: TextStyle(fontSize: 18.sp, color: kblackcolor)),
            ),
          ),
          SizedBox(height: 10.w),

          Row(
            children: [
              Container(
                height: 180.w,
                width: 320.w,
                decoration:
                    BoxDecoration(border: Border.all(color: kblackcolor)),
                child: getcontroller.homenewscardimg == null
                    ? SizedBox()
                    : Image(image: MemoryImage(getcontroller.homenewscardimg!)),
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
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
            height: 60.w,
            child: TextFormField(
              controller: programmelinktitlecontroller,
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
                  hintText: 'Programme Video Youtube link paste Here',
                  hintStyle: TextStyle(fontSize: 18.sp, color: kblackcolor)),
            ),
          ),
          SizedBox(height: 5.w),
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
                      content: const Text('Are you sure you want to submit?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            programmelinktitlecontroller.clear();

                            Navigator.pop(context, 'Cancel');
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            getcontroller.programmeurl(
                                programmeimageurl: getcontroller.newscardimagefileurl!,
                                programmetitle: programmetitle.text,
                                programmedescription: programmelinktitlecontroller.text);
                            Navigator.pop(context, 'submit');

                            programmetitle.clear();
                            programmelinktitlecontroller.clear();
                            getcontroller.homenewscardimg = null;
                          },
                          child: const Text('submit'),
                        ),
                      ],
                    ),
                  );
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
