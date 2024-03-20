
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahyog/model/ResponseModel/TrainerListResponseModel.dart';

class TrainerProfileController extends GetxController{
  RxString imagePath = "".obs;

  GlobalKey<FormState> trainerProfileFormKey = GlobalKey<FormState>();
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

  RxBool isReadOnly = true.obs;
  final RxBool isSubmitted = false.obs;
  final List<String> Gender = ['Male', 'Female', 'Other'];

  late final RxString selectedGender;


  @override
  void onInit() {
    TrainerListResponseModel trainer = Get.arguments;
    print(trainer.toString());
    final String recivedGender = trainer.gender.toString();
    imagePath = trainer.profilePhoto.toString().obs;

    firstNameController = TextEditingController()..text=trainer.firstName.toString();
    lastNameController = TextEditingController()..text=trainer.lastName.toString();
    ageController = TextEditingController()..text="";
    mobileNumberController = TextEditingController()..text=trainer.phone.toString();
    emailController = TextEditingController()..text=trainer.email.toString();
    yearsofExperienceController = TextEditingController()..text=trainer.yearOfExperience.toString();
    addressController = TextEditingController()..text=trainer.address.toString();
    selectedGender = recivedGender.obs;
  }




}