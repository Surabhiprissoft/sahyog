
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

class ChangePasswordController extends GetxController{
  final GlobalKey<FormState> changePasswordKey = GlobalKey<FormState>();
  late TextEditingController currentPassController,newPassController,confPassController;
  var currentPassword='',newPassword='',confirmPassword='';
  bool shouldValidate = false;


  void onInit() {
    // TODO: implement onInit
    super.onInit();

    currentPassController = TextEditingController();
    newPassController = TextEditingController();
    confPassController = TextEditingController();
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