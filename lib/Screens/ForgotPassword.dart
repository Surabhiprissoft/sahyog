import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/controller/ForgotPasswordController.dart';
import 'package:sahyog/utils/app_colors.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';
import 'package:sahyog/widgets/common_textfield.dart';

class ForgotPassword extends GetView<ForgotPasswordController> {
   ForgotPassword({super.key});

   final forgotPassController = Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomTopBar(titleName: ""),
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
                child: Column(
                  children: [
                    Container(
                        height: Get.height * 0.9, //With Getx
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 1, //Without GetX
                        margin: EdgeInsets.all(10.0),

                        child: Builder(
                            builder: (context) {
                              return Form(
                                key: forgotPassController.forgotPasswordFormKey,
                                //autovalidateMode: AutovalidateMode.onUserInteraction,
                                autovalidateMode: forgotPassController
                                    .shouldValidate ? AutovalidateMode
                                    .onUserInteraction : AutovalidateMode
                                    .disabled,
                                child: Column(
                                  children: [
                                    Text("Forgot Password", style: TextStyle(
                                        fontSize: 23.sp,
                                        color: AppColors.appThemeColor,
                                        fontWeight: FontWeight.w700),),
                                    const SizedBox(height: 25.0,),
                                    InputTextFormField(label: "Registered Email ID",
                                        keyboardType: TextInputType
                                            .emailAddress, controller: forgotPassController.emailController,
                                        ),

                                    const SizedBox(height: 5.0),
                                    Text("*credentials will be sent on registered Email ID",style: TextStyle(fontSize: 15.sp),),
                                    const SizedBox(height: 30.0),
                                    SizedBox(
                                      width: 100.w,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            forgotPassController.onEmailSubmit();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(10.0),
                                              ),
                                              backgroundColor: AppColors
                                                  .appThemeColor
                                          ),
                                          child: const Text("Submit",
                                            style: TextStyle(
                                                color: Colors.white),)
                                      ),
                                    ),

                                  ],
                                ),
                              );
                            }
                        )
                    ),
                  ],
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
      ),
    );
  }
}
