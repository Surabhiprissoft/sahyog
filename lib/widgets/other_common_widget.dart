

import 'dart:convert';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/Screens/LoginScreen.dart';
import 'package:sahyog/model/ResponseModel/LoginResponseModel.dart';
import 'package:sahyog/utils/app_constants.dart';
import 'package:sahyog/utils/preference_utils.dart';

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




