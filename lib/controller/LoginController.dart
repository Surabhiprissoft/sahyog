import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahyog/Screens/AdminDashboard.dart';
import 'package:sahyog/Screens/ChangePassword.dart';
import 'package:sahyog/model/BaseListResponse.dart';
import 'package:sahyog/model/BaseSingleObjectResponse.dart';
import 'package:sahyog/model/RequestModel/LoginRequestModel.dart';
import 'package:sahyog/model/ResponseModel/CenterResponseModel.dart';
import 'package:sahyog/model/ResponseModel/LoginResponseModel.dart';
import 'package:sahyog/network/user_repository.dart';
import 'package:sahyog/utils/app_constants.dart';
import 'package:sahyog/utils/preference_utils.dart';
import 'package:sahyog/widgets/DialogHelper.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

import '../Screens/TraineeDashboard.dart';
import '../Screens/TrainerDashboard.dart';

class LoginController extends GetxController
{
  final UserRepository userRepository;

   late GlobalKey<FormState> loginFormKey;
  late TextEditingController emailController,passController;
  var email='',password='';
  bool shouldValidate = false;
  late SingleResponse<LoginResponseModel> loginResponseModel;
  LoginController(this.userRepository);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    emailController = TextEditingController();
    passController = TextEditingController();
    loginFormKey = GlobalKey<FormState>();
  }

 void clearcontrollers()
 {
     emailController.clear();
     passController.clear();
     loginFormKey = GlobalKey<FormState>();
     update();
     //loginFormKey.currentState!.reset();
 }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

    emailController.dispose();
    passController.dispose();
  }



  /*String? validateEmail(String value)
  {
    if(!GetUtils.isEmail(value))
    {
      return "Enter valid email";
    }
    return null;
  }*/

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



  Future<SingleResponse<LoginResponseModel>> onlogin() async {
    try {
      final isValid = loginFormKey.currentState!.validate();
      if (!isValid) {
        showSnackBar("Login Failed", "Enter all fields to login");
        shouldValidate = true;
      } else {
        loginFormKey.currentState!.save();
        LoginRequestModel loginRequestModel = LoginRequestModel(
          email: emailController.text.toString(),
          password: passController.text.toString(),
        );

        print(loginRequestModel.toString());

        DialogHelper.showLoading();

        loginResponseModel= await userRepository.checkLogin(loginRequestModel);

        if(loginResponseModel.status==200){
          DialogHelper.hideLoading();
          PreferenceUtils.setString(AppConstants.USER_TOKEN,loginResponseModel.data.sessionToken.toString());



          print(loginResponseModel.data.role);
          print(loginResponseModel.data.isFirsttime);
          String? email = loginResponseModel.data?.email;

          if(loginResponseModel.data.role!=3 && loginResponseModel.data.isFirsttime==true){
            print("inside "+email.toString());
            Get.to(()=>ChangePassword(),arguments: email);
          }else{
            if(loginResponseModel.data.role==1){
              Get.to(()=>TrainerDashboard());
            }
            else if(loginResponseModel.data.role==2)
            {
              Get.to(()=>TraineeDashboard());
            }
            else{
              Get.to(()=>AdminDasboard());
            }
          }

          clearcontrollers();
        }
        else{

          showSnackBar("Login Failed", loginResponseModel.message);
          DialogHelper.hideLoading();
        }
        return loginResponseModel;
      }
    }
    catch (error) {

      DialogHelper.hideLoading();
      print('Error during login: $error');
      showSnackBar("Login Failed", "Check your Username or Password");


      throw error;
    }

    return loginResponseModel;
    // Return null or an error response if login fails

  }


  void clearFieldsAndReset() {
    emailController.clear();
    passController.clear();
    loginFormKey.currentState!.reset();

  }
}