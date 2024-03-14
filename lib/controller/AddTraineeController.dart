import 'dart:convert';

import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahyog/Screens/AdminDashboard.dart';
import 'package:sahyog/model/BaseListResponse.dart';
import 'package:sahyog/model/RequestModel/AddTraineeRequestModel.dart';
import 'package:sahyog/model/ResponseModel/CenterResponseModel.dart';
import 'package:sahyog/model/ResponseModel/TrainerTraineeResponseModel.dart';
import 'package:sahyog/network/user_repository.dart';
import 'package:sahyog/utils/AppCommonMethods.dart';
import 'package:sahyog/widgets/DialogHelper.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

class AddTraineeController extends GetxController
{
  RxString imagePath = "".obs;

 // final List<String> centers = ['Center1', 'Center2', 'Ceneter3'];

 // final RxString selectedCeneter= 'Center1'.obs;


  final RxBool isSubmitted = false.obs;

  final List<String> discount = ['30%', '40%', '50%'];

  final RxString selectedDiscount= '30%'.obs;


  final List<String> level = ['Beginner', 'Intermediate', 'Advanced'];
  late final RxString selectedLevel;
  late final Rx<CenterResponseModel?> selectedCenter ;

  final List<String> Gender = ['Male', 'Female', 'Other'];
  late final RxString selectedGender ;

  late ListResponse<CenterResponseModel> centerResponseModel;
  List<CenterResponseModel> centerlist=[];
  GlobalKey<FormState> traineeFormKey = GlobalKey<FormState>();
  String fullName="",age="",mobileNumber="",email="",yearsofExperience="",address="";
  late TextEditingController firstNameController,lastNameController,ageController,mobileNumberController,emailController,yearsofExperienceController,addressController;
  late TrainerTraineeResponseModel traineeResponseModel;
  final UserRepository userRepository;


  AddTraineeController(this.userRepository);

  @override
  void onInit() {
    getCenterList();
    firstNameController=TextEditingController();
    lastNameController=TextEditingController();
    ageController=TextEditingController();
    mobileNumberController=TextEditingController();
    emailController=TextEditingController();
    yearsofExperienceController=TextEditingController();
    addressController=TextEditingController();
    selectedCenter=Rx<CenterResponseModel?>(null);
    selectedLevel = ''.obs;
    selectedGender = ''.obs;

  }

  void clearControllers() {
    firstNameController.clear();
    lastNameController.clear();
    ageController.clear();
    mobileNumberController.clear();
    emailController.clear();
    yearsofExperienceController.clear();
    addressController.clear();
    traineeFormKey = GlobalKey<FormState>();
    selectedGender= ''.obs;
    selectedLevel = ''.obs;


  }

  Future openCamera() async{
    final ImagePicker openCameraPicker = ImagePicker();
    final image = await openCameraPicker.pickImage(source: ImageSource.camera);
    if(image!=null)
    {
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
  Future<TrainerTraineeResponseModel> addTrainee() async
  {
    final isValid = traineeFormKey.currentState!.validate();
    if(isValid)
    {
      DialogHelper.showLoading();
      traineeFormKey.currentState!.save();
      AddTraineeRequestModel addTraineeRequestModel = AddTraineeRequestModel(
          firstName: firstNameController.text.toString(),
          lastName: lastNameController.text.toString(),
          gender: selectedGender.value.toString(),
          dob: ageController.text.toString(),
          username: emailController.text.toString(),
          password: AppCommonMethods().getRandomString(8),
          profilePhoto: imagePath.value!=null?AppCommonMethods().getBase64Image(imagePath.value):null,
          phone: mobileNumberController.text.toString(),
          email: emailController.text.toString(),
          address:addressController.text.toString(),
          role: 2,
         //center: selectedCeneter.value.toString(),
         center: selectedCenter.value?.id,
        discount: 0.0,
        trainingType: selectedLevel.value.toString(),
      );
      print("TRAINEE REQUEST MODEL"+addTraineeRequestModel.toString());
    /*  traineeResponseModel= await userRepository.addTrainee(addTraineeRequestModel);
      if(traineeResponseModel.status==200){
        DialogHelper.hideLoading();
       Get.snackbar("Trainee Created!",traineeResponseModel.message.toString(),snackPosition: SnackPosition.BOTTOM);
       Get.to(AdminDasboard());
      }
      else
        {
          DialogHelper.hideLoading();
          Get.snackbar("Something went wrong!",traineeResponseModel.message.toString(),snackPosition: SnackPosition.BOTTOM);
        }*/

    }

    return traineeResponseModel;
    print("isValid"+isValid.toString());
  }

   Future<void> getCenterList() async {
  //  DialogHelper.showLoading();
    try {
      centerResponseModel = await userRepository.getCenters();

      if (centerResponseModel.status == 200) {
        centerlist = centerResponseModel.data;
        // Notify listeners about the change in centerlist
        update();

      }
      else {
        DialogHelper.hideLoading();
        if(centerResponseModel.status==401)
          {
            showSnackBar("Session has been Expired !", "");
          }
       else
         {
           Get.snackbar(
             "Error",
             centerResponseModel.message ?? "Failed to fetch center list",
             snackPosition: SnackPosition.BOTTOM,
           );
         }

      }
    } catch (e) {
     // DialogHelper.hideLoading();
      Get.snackbar(
        "Error",
        "Failed to fetch center list: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
    }

  }

}