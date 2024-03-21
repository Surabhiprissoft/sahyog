import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahyog/Screens/AdminDashboard.dart';
import 'package:sahyog/Screens/ManageTrainer.dart';
import 'package:sahyog/controller/ManageTrainerController.dart';
import 'package:sahyog/model/RequestModel/AddTrainerRequestModel.dart';
import 'package:sahyog/model/ResponseModel/TrainerTraineeResponseModel.dart';
import 'package:sahyog/network/user_repository.dart';
import 'package:sahyog/utils/AppCommonMethods.dart';
import 'package:sahyog/widgets/DialogHelper.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

import 'AdminDashboardController.dart';

class AddTrainerController extends GetxController {
  RxString imagePath = "".obs;

  GlobalKey<FormState> trainerFormKey = GlobalKey<FormState>();
  String fullName = "",
      age = "",
      mobileNumber = "",
      email = "",
      yearsofExperience = "",
      address = "";
  late TextEditingController firstNameController,
      lastNameController,
      ageController,
      mobileNumberController,
      emailController,
      yearsofExperienceController,
      addressController;
  final UserRepository userRepository;
  final RxBool isSubmitted = false.obs;
  final List<String> Gender = ['Male', 'Female', 'Other'];
  late final RxString selectedGender;

  late TrainerTraineeResponseModel trainerresponseModel;

  AddTrainerController(this.userRepository);

  @override
  void onInit() {
    imagePath = "".obs;
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    ageController = TextEditingController();
    mobileNumberController = TextEditingController();
    emailController = TextEditingController();
    yearsofExperienceController = TextEditingController();
    addressController = TextEditingController();
    selectedGender = ''.obs;
  }

  void clearControllers() {
    trainerFormKey = GlobalKey<FormState>();
    firstNameController.clear();
    lastNameController.clear();
    ageController.clear();
    mobileNumberController.clear();
    emailController.clear();
    yearsofExperienceController.clear();
    addressController.clear();
    selectedGender = ''.obs;
    imagePath="".obs;
  }

  Future openCamera() async {
    final ImagePicker openCameraPicker = ImagePicker();
    final image = await openCameraPicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }

  Future openGallery() async {
    final ImagePicker openCameraPicker = ImagePicker();
    final image = await openCameraPicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }

  Future<TrainerTraineeResponseModel> onAddTrainer() async {
    final isValid = trainerFormKey.currentState!.validate();
    if (isValid && formIsValid()) {
      DialogHelper.showLoading();
      trainerFormKey.currentState!.save();

      AddTrainerRequestModel addTrainerRequestModel = AddTrainerRequestModel(
          firstName: firstNameController.text.toString(),
          lastName: lastNameController.text.toString(),
          gender: selectedGender.value.toString(),
          dob: ageController.text.toString(),
          username: emailController.text.toString(),
          password: AppCommonMethods().getRandomString(8),
          profilePhoto: imagePath.value != null
              ? AppCommonMethods().getBase64Image(imagePath.value)
              : null,
          phone: mobileNumberController.text.toString(),
          email: emailController.text.toString(),
          address: addressController.text.toString(),
          role: 1,
          yearOfExperience:
          num.tryParse(yearsofExperienceController.text.toString()));
      try
      {
        trainerresponseModel =
        await userRepository.addTrainer(addTrainerRequestModel);
        if (trainerresponseModel.status == 200) {
          DialogHelper.hideLoading();
          imagePath="".obs;
          update();
          showSnackBar(
              "Trainer Created!", trainerresponseModel.message.toString());

          var controller = Get.find<ManageTrainerController>();
          controller.getTrainerList();
          var adminController = Get.find<AdminDashboardController>();
          adminController.centerList.clear();
          adminController.getAdminDashboardData();
          Get.off(() => ManageTrainer());
          clearControllers();
        } else {
          DialogHelper.hideLoading();
          showSnackBar(
              "Something went wrong!", trainerresponseModel.message.toString());
        }
      }
      catch(e)
    {
      DialogHelper.hideLoading();
    }


    print(addTrainerRequestModel);

    }
    return trainerresponseModel;
  }

  bool formIsValid() {
    // Perform form validation logic here
    // For example, check if all required fields are filled out
    bool isGenderSelected = selectedGender.value.isNotEmpty;

    // Add more validation as needed

    // Return true only if all conditions are met
    return isGenderSelected;
  }
}
