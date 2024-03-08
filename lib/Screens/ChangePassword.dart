import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/controller/ChangePasswordController.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';

class ChangePassword extends GetView<ChangePasswordController> {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomTopBar(titleName: "Change Password"),
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
                  child: Column(

                    children: [

                    ],
                  )
              )
          ),

        ],
      ),
    );
  }
}
