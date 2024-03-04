import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddTrainerController extends GetxController
{
  RxString imagePath = "".obs;

  Future openCamera() async{
    final ImagePicker openCameraPicker = ImagePicker();
    final image = await openCameraPicker.pickImage(source: ImageSource.camera);
    if(image!=null){
      imagePath.value = image.path.toString();
    }
  }

  Future openGallery() async{
    final ImagePicker openCameraPicker = ImagePicker();
    final image = await openCameraPicker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      imagePath.value = image.path.toString();
    }
  }
}