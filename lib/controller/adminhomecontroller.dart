import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

class adminhomexontroller extends GetxController {
  int selectedoption = 0;

  XFile? homenewscardimg;

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
}
