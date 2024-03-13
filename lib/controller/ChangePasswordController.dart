
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahyog/Screens/ChangePassword.dart';
import 'package:sahyog/model/RequestModel/ChangePasswordRequestModel.dart';
import 'package:sahyog/widgets/DialogHelper.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

import '../model/ResponseModel/TrainerTraineeResponseModel.dart';
import '../network/user_repository.dart';

class ChangePasswordController extends GetxController{


  final GlobalKey<FormState> changePasswordKey = GlobalKey<FormState>();
  late TextEditingController currentPassController,newPassController,confPassController;
  var currentPassword='',newPassword='',confirmPassword='';
  bool shouldValidate = false;
   late String email="";
  late TrainerTraineeResponseModel changePasswordResponseModel;
  final UserRepository userRepository;
  ChangePasswordController(this.userRepository);


  void onInit() {
    // TODO: implement onInit
    super.onInit();

    currentPassController = TextEditingController();
    newPassController = TextEditingController();
    confPassController = TextEditingController();


    email= Get.arguments;

  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

    currentPassController.dispose();
    newPassController.dispose();
    confPassController.dispose();
  }

  String? validatePass(String value)
  {
    if(!GetUtils.isGreaterThan(value.length, 6))
    {
      return "Password must be 7 character long";
    }
    else
    {
      return null;
    }

  }



  onSubmit(){
    final isValid = changePasswordKey.currentState!.validate();
    if (!isValid) {
      showSnackBar("Unable to proceed", "Enter all fields to proceed further");
      shouldValidate = true;
    } else {
      if(newPassController.text==confPassController.text){

      }
      else{
        showSnackBar("Error", "Password does not matches");
      }
    }
  }





}