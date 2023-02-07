import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:city_chennel_web/model/kasaragodnewsmodel.dart';
import 'package:city_chennel_web/model/keralanewsmodel.dart';
import 'package:city_chennel_web/model/livestreammodel.dart';
import 'package:city_chennel_web/model/videosectionmodel.dart';
import 'package:path_provider/path_provider.dart';

import 'package:city_chennel_web/model/newscardmodel.dart';
import 'package:city_chennel_web/model/newstimemodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

class adminhomexontroller extends GetxController {
  int selectedoption = 0;

  String? newscardimagefileurl;

  Uint8List? homenewscardimg;
  changeoption(count) {
    selectedoption = count;
    print(selectedoption);
    refresh();
  }

  // Future picimageforhomenewscard() async {
  //   XFile? pickedfile = await ImagePickerWeb.getMultiImagesAsFile();
  //       // await ImagePicker().pickImage(source: ImageSource.gallery);
  //   homenewscardimg = pickedfile;

  //   print('object');
  //   refresh();
  // }

  Future createnewstimeurl({required String newstimeurl}) async {
    final docUrl = FirebaseFirestore.instance.collection('citynewstime').doc();

    final newstime = Newstimemodel(
      uid: docUrl.id,
      newstimeurl: newstimeurl,
    );

    final json = newstime.toMap();

    await docUrl.set(json);
  }

  Future createshortnews(
      {required String shortnewsimgurl, required String shortnewstitle}) async {
    final docUrl = FirebaseFirestore.instance.collection('shortnews').doc();

    final shortnews = Shortnewsmodel(
        shortnewstitle: shortnewstitle,
        shortnewsimgurl: shortnewsimgurl,
        uid: docUrl.id);

    final json = shortnews.toMap();

    await docUrl.set(json);
  }

  Future createlivestreamurl({
    required String livestreamurl,
  }) async {
    final docUrl = FirebaseFirestore.instance.collection('liveurl').doc();

    final livestream =
        LiveStreammodel(livestreamurl: livestreamurl, uid: docUrl.id);

    final json = livestream.toMap();

    await docUrl.set(json);
  }

  uploadimagefile() async {
    final uploadimgkey = DateTime.now().microsecondsSinceEpoch;

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirectoryImages = referenceRoot.child('newscardimage/');
    Reference referenceImageToUpload =
        referenceDirectoryImages.child(uploadimgkey.toString());

    // Uint8List uploadfile = result.files.single.bytes;

    print('uploadimg file called');
    if (result != null) {
      homenewscardimg = result.files.single.bytes;

// Uint8List imageInUnit8List = // store unit8List image here ;
      // final tempDir = await getTemporaryDirectory();
      // File file = await File('${tempDir.path}/image.png').create();
      // file.writeAsBytesSync(homenewscardimg!);
      // log(file.path.toString());

      try {
        await referenceImageToUpload.putData(homenewscardimg!);

        newscardimagefileurl = await referenceImageToUpload.getDownloadURL();
        print('imageurl $newscardimagefileurl');
      } catch (e) {
        log(e.toString());
      }
    } else {
      // User canceled the picker
    }
    refresh();
  }

  Future createvideosectionurl(
      {required String youtubeviddeourl,
      required String youtubevideodescription}) async {
    final docUrl = FirebaseFirestore.instance.collection('videolist').doc();

    final videolist = videosectiomodel(
        youtubevideodescription: youtubevideodescription,
        youtubeviddeourl: youtubeviddeourl,
        uid: docUrl.id);

    final json = videolist.toMap();

    await docUrl.set(json);
  }

  Future kasaragodnewsurl(
      {required String kasaragodimageurl,
      required String kasaragodnewstitle,
      required String kasaragodnewsdescription}) async {
    final docUrl = FirebaseFirestore.instance.collection('kasaragodnews').doc();

    final shortnews = kasaragodnewsmodel(
        kasaragodimageurl: kasaragodimageurl,
        kasaragodnewsdescription: kasaragodnewsdescription,
        kasaragodnewstitle: kasaragodnewstitle,
        uid: docUrl.id);

    final json = shortnews.toMap();

    await docUrl.set(json);
  }

  Future keralanewsurl(
      {required String keralaimageurl,
      required String keralanewstitle,
      required String keralanewsdescription}) async {
    final docUrl = FirebaseFirestore.instance.collection('keralanews').doc();

    final shortnews = keralanewsmodel(
        keralaimageurl: keralaimageurl,
        keralanewsdescription: keralanewsdescription,
        keralanewstitle: keralanewstitle,
        uid: docUrl.id);

    final json = shortnews.toMap();

    await docUrl.set(json);
  }
}
