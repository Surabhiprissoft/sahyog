import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddTraineeController extends GetxController
{
  RxString imagePath = "".obs;

  final List<String> centers = ['Center1', 'Center2', 'Ceneter3'];

  final RxString selectedCeneter= 'Center1'.obs;

  final List<String> discount = ['30%', '40%', '50%'];

  final RxString selectedDiscount= '30%'.obs;


  final List<String> level = ['Beginner', 'Intermediate', 'Advanced'];
  final RxString selectedLevel = 'Beginner'.obs;

  final GlobalKey<FormState> trainerFormKey = GlobalKey<FormState>();
  String fullName="",age="",mobileNumber="",email="",yearsofExperience="",address="";
  late TextEditingController fullNameController,ageController,mobileNumberController,emailController,yearsofExperienceController,addressController;



  @override
  void onInit() {
    fullNameController=TextEditingController();
    ageController=TextEditingController();
    mobileNumberController=TextEditingController();
    emailController=TextEditingController();
    yearsofExperienceController=TextEditingController();
    addressController=TextEditingController();
  }

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