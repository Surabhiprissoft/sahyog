import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/Screens/ForgotPassword.dart';
import 'package:sahyog/controller/LoginController.dart';
import 'package:sahyog/model/ResponseModel/LoginResponseModel.dart';
import 'package:sahyog/network/api_baseHelper.dart';
import 'package:sahyog/network/user_repository.dart';
import 'package:sahyog/utils/app_colors.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';
import 'package:sahyog/widgets/common_textfield.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

import '../utils/app_validation.dart';
import 'ChangePassword.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});


  final loginController = Get.find<LoginController>();

  //final LoginController loginController = Get.put(LoginController(UserRepository(ApiBaseHelper())));
  var date = DateTime.now();
  var customeDate = DateTime.now().add(Duration(days: 7));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      //getLoggedData();
      bool exit = await showExitDialog(context);
      return exit;
      // return exit(0);
    },
      child: Scaffold(

        body: GetBuilder<LoginController>(builder: (logic) {
          return Stack(
            children: [
              Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 30.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Top_bg.png'),
                      fit: BoxFit.cover, // Adjust the BoxFit as needed
                    ),
                    color: Colors.blue
                ),
                child:  Padding(
                  padding: EdgeInsets.only(left:6.w,bottom: 16.h,right: 6.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          "",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          )
                      ),


                    ],
                  ),
                ),


              )
          ),
              Positioned(
                  top: 140,
                  left: 0,
                  right: 0,
                  child: Container(
                    //height: 100.h,
                    padding: EdgeInsets.only(top: 13.h, left: 2.h, right: 2.h,),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Container(
                        height: 60.h,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 1, //Without GetX
                        margin: EdgeInsets.all(10.0),

                        child: Builder(
                            builder: (context) {
                              return Form(
                                key: loginController.loginFormKey,
                                //autovalidateMode: AutovalidateMode.onUserInteraction,
                                autovalidateMode: loginController
                                    .shouldValidate ? AutovalidateMode
                                    .onUserInteraction : AutovalidateMode
                                    .disabled,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Login", style: TextStyle(
                                        fontSize: 23.sp,
                                        color: AppColors.appThemeColor,
                                        fontWeight: FontWeight.w700),),
                                    const SizedBox(height: 25.0,),
                                    /*InputTextFormField(label: "Email ID",
                                        keyboardType: TextInputType
                                            .emailAddress,
                                        controller: loginController
                                            .emailController),*/
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Email ",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                  ),
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: loginController.emailController,
                                  validator: loginController.validateEmail,
                                ),
                                    const SizedBox(height: 20.0,),

                                    Obx(() {
                                      return TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: loginController.passController,
                                        validator: loginController.validatePassword,

                                        obscureText: loginController.isObscure.value, // Access the value using .value
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          ),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              // Choose the icon based on the value of isObscure
                                              loginController.isObscure.value ? Icons.visibility : Icons.visibility_off,
                                              color: AppColors.appThemeColor,
                                            ),
                                            onPressed: () {
                                              // Toggle the value of isObscure
                                              loginController.isObscure.toggle();
                                            },
                                          ),
                                        ),
                                      );
                                    }),

                                    /*InputTextFormField(label: "Password",
                                        keyboardType: TextInputType.text,
                                        controller: loginController
                                            .passController),*/
                                    const SizedBox(height: 5.0),

                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                        onTap: () {
                                          loginController
                                              .clearcontrollers();
                                          Get.delete();
                                          Get.to(() => ForgotPassword());
                                          // Implement your forgot password functionality here
                                        },
                                        child: const Text(
                                          "Forgot Password?",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              decoration: TextDecoration
                                                  .underline,
                                              color: AppColors
                                                  .appThemeColor),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    SizedBox(
                                      width: 100.w,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            loginController.onlogin();
                                            logic.update();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(10.0),
                                              ),
                                              backgroundColor: AppColors
                                                  .appThemeColor
                                          ),
                                          child: const Text("Login",
                                            style: TextStyle(
                                                color: Colors.white),)
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Haven't Registered yet? "),
                                        InkWell(onTap:(){selfRegisterDialog(context);},child: Text("Register Now!", style: TextStyle(color: AppColors.appThemeColor,decoration: TextDecoration.underline)))
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }
                        )
                    ),
                  )
              ),
              Positioned(
                  top: 70,
                  // Adjust this value to control the position of the card
                  left: 16,
                  right: 16,
                  child: SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Center(
                        child: Card(
                          elevation: 10.0,
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            radius: 75,
                            child: Image.asset(
                                "assets/images/india_khelenga_logo.png"),
                          ),
                        )

                    ),

                  )
              )
            ],
          );
        })

    )
    );
  }
}
