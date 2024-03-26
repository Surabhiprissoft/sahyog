

import 'dart:convert';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/Screens/AddTrainer.dart';
import 'package:sahyog/Screens/LoginScreen.dart';
import 'package:sahyog/model/ResponseModel/LoginResponseModel.dart';
import 'package:sahyog/utils/app_constants.dart';
import 'package:sahyog/utils/preference_utils.dart';

import '../Screens/AddTrainee.dart';
import '../utils/app_colors.dart';


class HeaderText extends StatelessWidget {

  final String header;

  const HeaderText({super.key, required this.header,
  });

  @override
  Widget build(BuildContext context) {
    return Text(header,style: TextStyle(
      fontSize: 22.sp,
      fontFamily: GoogleFonts.archivo().fontFamily,
      fontWeight: FontWeight.w700,
      color: AppColors.subHeader,
    ),textAlign: TextAlign.center,);
  }
}
class SubHeaderText extends StatelessWidget {
  final String sub_header;
  const SubHeaderText({super.key, required this.sub_header,});

  @override
  Widget build(BuildContext context) {
    return Text(sub_header,
      style: TextStyle(
        fontSize: 17.sp,fontWeight: FontWeight.w700,fontFamily: GoogleFonts.archivo().fontFamily,
      ),
    );
  }
}


class NormalText extends StatelessWidget {
  final String sub_header;
  const NormalText({super.key, required this.sub_header,});

  @override
  Widget build(BuildContext context) {
    return Text(sub_header,
      style: TextStyle(
        fontSize: 16.sp,fontWeight: FontWeight.w500,fontFamily: GoogleFonts.archivo().fontFamily,
      ),
    );
  }
}

class RichTextWidget extends StatelessWidget {
  final String mainText;
  final String highlightedText;
  final VoidCallback onTap;

  const RichTextWidget({
    required this.mainText,
    required this.highlightedText,
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text:  TextSpan(
          text: mainText,
          style: TextStyle(
            fontFamily: GoogleFonts.archivo().fontFamily,
            color: AppColors.hintText,
            fontWeight: FontWeight.w400,
            fontSize: 15.sp,
          ),
          children: [
            TextSpan(
                recognizer: TapGestureRecognizer()..onTap = onTap,
                text: highlightedText,
                style: TextStyle(color: AppColors.textLink,
                    fontFamily: GoogleFonts.archivo().fontFamily,
                    fontSize: 14.sp,fontWeight: FontWeight.w400)),
          ]),
    );
  }
}

Widget buildRadio(String value,  final RxString selectedValue) {
  return Row(
    children: [
      Obx(() => Radio<String>(
        value: value,
        groupValue: selectedValue.value,
        onChanged: (newValue) {
          selectedValue.value = newValue!;
          print("Selected Value"+selectedValue.value);
        },
      )),
      Text(value,style: TextStyle(fontSize: 10),),
    ],
  );
}



showSnackBar(
  String title,
  String message
  ){
  return
    Get.snackbar(
      title,message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10.0)
    );
}


Future<bool> showExitDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Exit App',style: TextStyle(fontFamily: GoogleFonts.archivo().fontFamily,fontWeight: FontWeight.w500),),
      content: Text('Are you sure you want to exit?',style: TextStyle(fontFamily: GoogleFonts.archivo().fontFamily),),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:AppColors.buttonColors,
                fixedSize:  Size(22.w, 2.h),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            onPressed: () {
              exit(0);
            },
            child: Text(
              "Yes".toUpperCase(), style: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.w800,fontFamily: GoogleFonts.archivo().fontFamily),)),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:AppColors.thirdButtonColors,
                fixedSize:  Size(20.w, 2.h),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(
              "no".toUpperCase(), style: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.w800,fontFamily: GoogleFonts.archivo().fontFamily),)),
      ],
    ),
  ) ?? false;
}

Future<bool> showLogoutDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Confirm Logout',style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.w500),),
      content: Text('Are you sure you want to Logout?',style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:AppColors.buttonColors,
                fixedSize:  Size(22.w, 2.h),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            onPressed: () {
              PreferenceUtils.clearAll();
              Get.offAll(LoginScreen());
            },
            child: Text(
              "yes".toUpperCase(), style: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.w800,fontFamily: GoogleFonts.archivo().fontFamily),)),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:AppColors.thirdButtonColors,
                fixedSize:  Size(20.w, 2.h),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(
              "no".toUpperCase(), style: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.w800,fontFamily: GoogleFonts.archivo().fontFamily),)),
      ],
    ),
  ) ?? false;
}

Future<bool> selfRegisterDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      surfaceTintColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.0),
      contentPadding: EdgeInsets.zero,
      title: Center(
        child: Text(
          'Choose from below',
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop(false);
                Get.to(() => AddTrainee());
              },
              child: Container(
                margin: EdgeInsets.only(left: 2.w, right: 2.w, bottom: 1.h,top: 2.h),
                child: Card(
                  surfaceTintColor: AppColors.cardBack,
                  elevation: 5.0,
                  child: Column(
                    children: [
                      Container(
                        width: 25.w,
                        height: 10.h,
                        padding: EdgeInsets.all(20.0),
                        child: SvgPicture.asset("assets/images/trainee_dialoge.svg"),
                      ),
                      Text("Trainee",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),),
                      SizedBox(height: 1.h,)

                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop(false);
                Get.to(() => AddTrainer());
              },
              child: Container(
                margin: EdgeInsets.only(left: 2.w, right: 2.w, bottom: 3.h,top: 1.h),
                child: Card(
                  surfaceTintColor: Colors.white,
                  elevation: 5.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 25.w,
                        height: 10.h,
                        padding: EdgeInsets.all(20.0),
                        child: SvgPicture.asset("assets/images/trainer_dialoge.svg"),
                      ),
                      Text("Trainer",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),),
                      SizedBox(height: 1.h,)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ) ?? false;
}

//content: Text('Thank you for registering on KHELO INDIA. We have received your registration request and forward it to the admin. upon reviewing your application we will notify you on your registered mail address.',style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),),

Future<bool> selfRegisteredSuccessDialog() async {
  return await Get.defaultDialog(
      title: 'Registered Successfully',
      titlePadding: EdgeInsets.all(20.0),
      contentPadding: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0),
      content: Text('Thank you for registering on KHELO INDIA. We have received your registration request and forward it to the admin. upon reviewing your application we will notify you on your registered mail address.'),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.offAll(()=>LoginScreen()); // Close the dialog
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius
                          .circular(10.0),
                    ),
                    backgroundColor: AppColors
                        .appThemeColor
                ),
                child: const Text("Okay",
                  style: TextStyle(
                      color: Colors.white),)
            ),
          ],
        ),
      ],
      barrierDismissible: false// Make the barrier transparent
  )
      ?? false;
}




Future<bool> showSessionExpiredDialog() async {
  return await Get.defaultDialog(
    title: 'Session Expired',
    titlePadding: EdgeInsets.all(20.0),
    contentPadding: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0),
    content: Text('Your session has been expired, Please login again to continue using app'),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.offAll(()=>LoginScreen()); // Close the dialog
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
        ],
      ),
    ],
    barrierDismissible: false// Make the barrier transparent
  )
  ?? false;
}





