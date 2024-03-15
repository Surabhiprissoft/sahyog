import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/controller/ChangePasswordController.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';
import 'package:sahyog/widgets/common_textfield.dart';

import '../utils/app_colors.dart';

class ChangePassword extends GetView<ChangePasswordController> {
   ChangePassword({super.key});

  final changePasswordController  = Get.find<ChangePasswordController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomTopBar(titleName: ""),
          Positioned  (
              top: 140,
              left: 0,
              right: 0,
              child: Container(
                  height: 100.h,
                padding: EdgeInsets.only(top: 13.h,left: 2.h,right: 2.h,),
                width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Container(
                      height: Get.height*0.9,                          //With Getx
                      width: MediaQuery.of(context).size.width*1,      //Without GetX
                      margin: const EdgeInsets.all(10.0),

                      child: Builder(
                          builder: (context) {
                            return Form(
                              key: changePasswordController.changePasswordKey,
                              //autovalidateMode: AutovalidateMode.onUserInteraction,
                              autovalidateMode: changePasswordController.shouldValidate ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                              child: Column(
                                children: [
                                  Text("Change Password",style: TextStyle(fontSize: 23.sp,color: AppColors.appThemeColor,fontWeight: FontWeight.w700),),
                                  const SizedBox(height: 20.0,),
                                  Obx(() {
                                    return TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: changePasswordController.currentPassController,
                                      obscureText: changePasswordController.isOldPassObscure.value, // Access the value using .value
                                      decoration: InputDecoration(
                                        labelText: 'Current Password',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            // Choose the icon based on the value of isObscure
                                            changePasswordController.isOldPassObscure.value ? Icons.visibility : Icons.visibility_off,
                                            color: AppColors.appThemeColor,
                                          ),
                                          onPressed: () {
                                            // Toggle the value of isObscure
                                            changePasswordController.isOldPassObscure.toggle();
                                          },
                                        ),
                                      ),
                                    );
                                  }),
                                  const SizedBox(height: 20.0,),
                                  Obx(() {
                                    return TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: changePasswordController.newPassController,
                                      obscureText: changePasswordController.isNewPassObscure.value, // Access the value using .value
                                      decoration: InputDecoration(
                                        labelText: 'New Password',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            // Choose the icon based on the value of isObscure
                                            changePasswordController.isNewPassObscure.value ? Icons.visibility : Icons.visibility_off,
                                            color: AppColors.appThemeColor,
                                          ),
                                          onPressed: () {
                                            // Toggle the value of isObscure
                                            changePasswordController.isNewPassObscure.toggle();
                                          },
                                        ),
                                      ),
                                    );
                                  }),
                                  const SizedBox(height: 20.0,),
                                  Obx(() {
                                    return TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: changePasswordController.confPassController,
                                      obscureText: changePasswordController.isConfirmPassObscure.value, // Access the value using .value
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            // Choose the icon based on the value of isObscure
                                            changePasswordController.isConfirmPassObscure.value ? Icons.visibility : Icons.visibility_off,
                                            color: AppColors.appThemeColor,
                                          ),
                                          onPressed: () {
                                            // Toggle the value of isObscure
                                            changePasswordController.isConfirmPassObscure.toggle();
                                          },
                                        ),
                                      ),
                                    );
                                  }),
                                  const SizedBox(height: 20.0),

                                  SizedBox(
                                    width: 100.w,
                                    child: ElevatedButton(
                                        onPressed: (){
                                          changePasswordController.onSubmit();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            backgroundColor: AppColors.appThemeColor
                                        ),
                                        child: const Text("Save",style: TextStyle(color: Colors.white),)
                                    ),
                                  ),


                                ],
                              ),
                            );
                          }
                      )
                  ),
              )
          ),
          Positioned(
              top: 70, // Adjust this value to control the position of the card
              left: 16,
              right: 16,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child:Center(
                    child: Card(
                      elevation: 10.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        radius: 75,
                        child: Image.asset("assets/images/india_khelenga_logo.png"),
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
