import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/controller/ChangePasswordController.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';
import 'package:sahyog/widgets/common_textfield.dart';

class ChangePassword extends GetView<ChangePasswordController> {
   ChangePassword({super.key});

  final changePasswordController  = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomTopBar(titleName: "Change Password"),
          Positioned  (
              top: 140,
              left: 0,
              right: 0,
              child: Container(
                  height: 100.h,
                  padding: EdgeInsets.all(2.h),
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
                                  InputTextFormField(label: "Current Password",keyboardType: TextInputType.text,controller: changePasswordController.currentPassController),
                                  const SizedBox(height: 20.0,),

                                  InputTextFormField(label: "New Password", keyboardType: TextInputType.text,controller: changePasswordController.newPassController),
                                  const SizedBox(height: 20.0,),

                                  InputTextFormField(label: "Confirm Password", keyboardType: TextInputType.text,controller: changePasswordController.confPassController),
                                  const SizedBox(height: 20.0),
                                  OutlinedButton(
                                      onPressed: (){
                                        changePasswordController.onSubmit();
                                      },
                                      child: const Text("Submit")
                                  ),

                                ],
                              ),
                            );
                          }
                      )
                  ),
              )
          ),

        ],
      ),
    );
  }
}
