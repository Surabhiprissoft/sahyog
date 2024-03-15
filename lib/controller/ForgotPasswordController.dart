import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahyog/model/RequestModel/ForgotPasswordRequestModel.dart';
import 'package:sahyog/model/ResponseModel/ChangePasswordResponseModel.dart';
import 'package:sahyog/network/user_repository.dart';
import 'package:sahyog/widgets/DialogHelper.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

import '../Screens/LoginScreen.dart';

class ForgotPasswordController extends GetxController {
  final UserRepository userRepository;

  late GlobalKey<FormState> forgotPasswordFormKey;
  late TextEditingController emailController;
  late ChangePasswordResponseModel forgotPasswordResponseModel;

  bool shouldValidate = false;
  ForgotPasswordController(this.userRepository);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    forgotPasswordFormKey = GlobalKey<FormState>();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailController.dispose();
  }

  Future<ChangePasswordResponseModel> onEmailSubmit() async {
    final isValid = forgotPasswordFormKey.currentState!.validate();
    if (!isValid) {
      showSnackBar("Unable to proceed", "Enter all fields to proceed further");
      shouldValidate = true;
    } else {
      DialogHelper.showLoading();
      forgotPasswordFormKey.currentState!.save();
      ForgotPasswordRequestModel forgotPasswordRequestModel =
          ForgotPasswordRequestModel(
        email: emailController.text.toString(),
      );
      print(forgotPasswordRequestModel.toString());

      try {
        forgotPasswordResponseModel =
            await userRepository.ForgotUserPassword(forgotPasswordRequestModel);
        if (forgotPasswordResponseModel.status == 200) {
          DialogHelper.hideLoading();
          Get.back();
          showSnackBar(
              "Email Sent", "Email containing new password has been sent");
          //clearcontrollers();
        } else {
          DialogHelper.hideLoading();
          showSnackBar("Error", forgotPasswordResponseModel.message.toString());
        }
      } catch (e) {
        DialogHelper.hideLoading();
      }
    }

    return forgotPasswordResponseModel;
  }

  void clearcontrollers() {
    emailController.clear();
    forgotPasswordFormKey = GlobalKey<FormState>();
  }
}
