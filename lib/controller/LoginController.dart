import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahyog/Screens/AdminDashboard.dart';

class LoginController extends GetxController{
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController,passController;
  var email='',password='';
  bool shouldValidate = false;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    emailController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

    emailController.dispose();
    passController.dispose();
  }

  String? validateEmail(String value)
  {
    if(!GetUtils.isEmail(value))
    {
      return "Enter valid email";
    }
    return null;
  }

  String? validatePass(String value)
  {
    if(!GetUtils.isGreaterThan(value.length, 6))
    {
      return "Password must be 7 character long";
    }
    return null;
  }

  checkLogin()
  {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      Get.snackbar("Login Failed", "Enter all field to login",snackPosition: SnackPosition.BOTTOM);
      shouldValidate=true;
      return false;
    }
    loginFormKey.currentState!.save();
    Get.to(AdminDasboard());

    //clearFieldsAndReset();

    /*email="";
    password="";

    Future.delayed(const Duration(milliseconds: 100), () {

      loginFormKey.currentState!.reset();
    });*/

  }

  void clearFieldsAndReset() {
    emailController.clear();
    passController.clear();
    loginFormKey.currentState!.reset();

  }
}