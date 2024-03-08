import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahyog/Screens/AdminDashboard.dart';
import 'package:sahyog/model/BaseSingleObjectResponse.dart';
import 'package:sahyog/model/RequestModel/LoginRequestModel.dart';
import 'package:sahyog/model/ResponseModel/LoginResponseModel.dart';
import 'package:sahyog/network/user_repository.dart';

class LoginController extends GetxController
{
  final UserRepository userRepository;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
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
        Get.snackbar(
          "Login Failed",
          "Enter all fields to login",
          snackPosition: SnackPosition.BOTTOM,
        );
        shouldValidate = true;
      } else {
        loginFormKey.currentState!.save();
        LoginRequestModel loginRequestModel = LoginRequestModel(
          email: emailController.text.toString(),
          password: passController.text.toString(),
        );

        // Call the login method and await its result
       // Get.to(AdminDasboard());

        loginResponseModel= await userRepository.checkLogin(loginRequestModel);
        if(loginResponseModel.status==200){
          Get.to(AdminDasboard());
        }
        else{
          Get.snackbar("Login Failed", loginResponseModel.message);
        }
        // Construct SingleResponse object from the login response


       // print("LoginResponseModel"+loginResponseModel.)
        // Navigate to AdminDashboard after successful login

        // Return the SingleResponse object
        return loginResponseModel;
      }
    } catch (error) {
      // Handle any errors that occurred during the login process
      print('Error during login: $error');
      // You can throw the error or return an error response here if needed
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