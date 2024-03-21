import 'dart:convert';

import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahyog/Screens/AdminDashboard.dart';
import 'package:sahyog/Screens/ManageTrainee.dart';
import 'package:sahyog/Screens/TraineeDashboard.dart';
import 'package:sahyog/Screens/TrainerDashBoard.dart';
import 'package:sahyog/controller/AdminDashboardController.dart';
import 'package:sahyog/controller/ManageTraineeController.dart';
import 'package:sahyog/model/BaseListResponse.dart';
import 'package:sahyog/model/RequestModel/AddTraineeRequestModel.dart';
import 'package:sahyog/model/ResponseModel/CenterResponseModel.dart';
import 'package:sahyog/model/ResponseModel/TrainerTraineeResponseModel.dart';
import 'package:sahyog/network/user_repository.dart';
import 'package:sahyog/utils/AppCommonMethods.dart';
import 'package:sahyog/widgets/DialogHelper.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

import '../Screens/LoginScreen.dart';
import '../utils/app_constants.dart';
import '../utils/preference_utils.dart';

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
    selectedCenter=Rx<CenterResponseModel?>(null);
    selectedGender= ''.obs;
    selectedLevel = ''.obs;
    addressController.clear();
    traineeFormKey = GlobalKey<FormState>();



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
    if(isValid && formIsValid())
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

      try
          {
            traineeResponseModel= await userRepository.addTrainee(addTraineeRequestModel);
            if(traineeResponseModel.status==200){
              DialogHelper.hideLoading();
              Get.snackbar("Trainee Created!",traineeResponseModel.message.toString(),snackPosition: SnackPosition.BOTTOM);
              var controller = Get.find<ManageTraineeController>();
              controller.getTraineeList();
              var adminController = Get.find<AdminDashboardController>();
              adminController.centerList.clear();
              adminController.getAdminDashboardData();

              int? role = PreferenceUtils.getInt(AppConstants.ROLE);
              print("Role from PreferenceUtils: $role"); // Add this debug print
              if (role != null) {
                if (role == 1) {
                  Get.off(()=>TrainerDashboard());
                } else if(role==3) {
                  Get.off(()=>AdminDasboard());
                }
                else{
                  Get.off(LoginScreen());
                }
              }
              else{
                Get.off(LoginScreen());
              }

              clearControllers();
            }
            else
            {
              DialogHelper.hideLoading();
              Get.snackbar("Something went wrong!",traineeResponseModel.message.toString(),snackPosition: SnackPosition.BOTTOM);
            }
          }
          catch(e)
    {
       DialogHelper.hideLoading();
    }

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
        centerlist.removeAt(0);
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
      DialogHelper.hideLoading();
     // DialogHelper.hideLoading();
    /*  Get.snackbar(
        "Error",
        "Failed to fetch center list: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );*/
    }


  }


  bool formIsValid() {
    // Perform form validation logic here
    // For example, check if all required fields are filled out
    bool isGenderSelected = selectedGender.value.isNotEmpty;
    bool isLevelSelected = selectedLevel.value.isNotEmpty;
    bool isCenterSelected = selectedCenter.value != null;
    // Add more validation as needed

    // Return true only if all conditions are met
    return isGenderSelected && isLevelSelected && isCenterSelected;
  }

}