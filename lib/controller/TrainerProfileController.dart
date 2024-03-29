
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahyog/model/RequestModel/UpdateTrainerRequestModel.dart';
import 'package:sahyog/model/ResponseModel/TrainerListResponseModel.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

import '../model/RequestModel/AddTrainerRequestModel.dart';
import '../model/ResponseModel/TrainerTraineeResponseModel.dart';
import '../network/user_repository.dart';
import '../utils/AppCommonMethods.dart';
import '../widgets/DialogHelper.dart';

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

  late final RxBool trainerStatus;
  RxString userProfileImage ="".obs;
  late final userId;

  final UserRepository userRepository;
  TrainerProfileController(this.userRepository);

  @override
  void onInit() {
    TrainerListResponseModel trainer = Get.arguments;
    print(trainer.toString());
    final String recivedGender = trainer.gender.toString();
    final bool? recivedStatus = trainer.isActive;

   // imagePath = trainer.profilePhoto.toString().obs;
    firstNameController = TextEditingController()..text=trainer.firstName.toString();
    lastNameController = TextEditingController()..text=trainer.lastName.toString();
    ageController = TextEditingController()..text=trainer.dob.toString();
    mobileNumberController = TextEditingController()..text=trainer.phone.toString();
    emailController = TextEditingController()..text=trainer.email.toString();
    yearsofExperienceController = TextEditingController()..text=trainer.yearOfExperience.toString();
    addressController = TextEditingController()..text=trainer.address.toString();
    selectedGender = recivedGender.obs;
    trainerStatus = recivedStatus!.obs;
    userProfileImage = "http://192.168.0.117:8000${trainer.profilePhoto.toString()}".obs;
    userId=trainer.id;
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

  Future<void> onUpdateTrainer() async {
    final isValid = trainerProfileFormKey.currentState!.validate();
    if (isValid) {
      DialogHelper.showLoading();
      trainerProfileFormKey.currentState!.save();

      UpdateTrainerRequestModel updateTrainerData = UpdateTrainerRequestModel(
          firstName: firstNameController.text.toString(),
          lastName: lastNameController.text.toString(),
          gender: selectedGender.value.toString(),
          dob: ageController.text.toString(),
          profilePhoto: imagePath.value == null
              ? await AppCommonMethods().getImageBase64FromUrl(userProfileImage.value)
              : AppCommonMethods().getBase64Image(imagePath.value),

          phone: mobileNumberController.text.toString(),
          email: emailController.text.toString(),
          address: addressController.text.toString(),
          isActive: trainerStatus.value,
          yearOfExperience:
          num.tryParse(yearsofExperienceController.text.toString()));


        final response = await  userRepository.updateTrainerData(updateTrainerData,userId);
        if(response.status==200){
          DialogHelper.hideLoading();
          showSnackBar("Data Updated","Trainer data updated successfully");
        }
    }
    else{
      showSnackBar("All fileds are mandatory", "Please fill the data in all fields");
    }

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