
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahyog/model/ResponseModel/TraineeListResponseModel.dart';

import '../model/BaseListResponse.dart';
import '../model/ResponseModel/CenterResponseModel.dart';
import '../network/user_repository.dart';
import '../widgets/DialogHelper.dart';
import '../widgets/other_common_widget.dart';

class TraineeProfileController extends GetxController{

  RxString imagePath = "".obs;

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
  GlobalKey<FormState> profileTraineeFormKey = GlobalKey<FormState>();
  String fullName="",age="",mobileNumber="",email="",yearsofExperience="",address="";
  late TextEditingController firstNameController,lastNameController,ageController,mobileNumberController,emailController,yearsofExperienceController,addressController;

  final UserRepository userRepository;
  TraineeProfileController(this.userRepository);



  void onInit() {
    TraineeListResponseModel trainee = Get.arguments;
    final String recivedGender = trainee.gender.toString();
    final String recivedLevel = trainee.trainingType.toString();
    getCenterList();
    firstNameController=TextEditingController()..text = trainee.firstName.toString();
    lastNameController=TextEditingController()..text = trainee.lastName.toString();
    ageController=TextEditingController()..text = trainee.dob.toString();
    mobileNumberController=TextEditingController()..text = trainee.phone.toString();
    emailController=TextEditingController()..text = trainee.email.toString();
    yearsofExperienceController=TextEditingController();
    addressController=TextEditingController()..text = trainee.address.toString();
    selectedCenter=Rx<CenterResponseModel?>(null);
    selectedLevel = recivedLevel.obs;
    selectedGender = recivedGender.obs;

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
    profileTraineeFormKey = GlobalKey<FormState>();
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
          showSnackBar("Error", centerResponseModel.message ?? "Failed to fetch center list",);
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


}