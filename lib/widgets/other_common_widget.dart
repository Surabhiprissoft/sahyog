

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
        fontSize: 15.sp,fontWeight: FontWeight.w400,fontFamily: GoogleFonts.archivo().fontFamily,
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

///// Common button  /////
typedef SubmitCallback = void Function();
class CommonFormButton extends StatelessWidget {
   final SubmitCallback onSubmit;
  final String buttonText;
  final VoidCallback onPressed;

  final Color  backgroundcolor;
   final Color borderColor;
  final GlobalKey<FormState> formKey;


  const CommonFormButton({
    required this.buttonText,
    required this.onPressed,
    required this.backgroundcolor,
    required this.borderColor,
    required this.formKey,
    required this.onSubmit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          // Uncomment the next line if you want to navigate to DashBoard
          // Get.to(() => DashBoard(), transition: Transition.rightToLeft);
          onSubmit();
          onPressed();

        }

      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0,),
          side: BorderSide(color: borderColor),
        ),
      ),
      child:  Text(buttonText,style: TextStyle(
        fontFamily: GoogleFonts.archivo().fontFamily,
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400),),
    );
  }
}


//////////////

typedef VerificationSubmitCallback = void Function();

class VerificationButton extends StatelessWidget {
  final SubmitCallback onSubmit;
  final String buttonText;
  final VoidCallback onPressed;
  final Color backgroundcolor;
  final Color borderColor;
  final GlobalKey<FormState> formKey;
  final bool isEmailValid;
  final bool isMobileValid;

  const VerificationButton({
    required this.buttonText,
    required this.onPressed,
    required this.backgroundcolor,
    required this.borderColor,
    required this.formKey,
    required this.onSubmit,
    required this.isEmailValid,
    required this.isMobileValid,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (isEmailValid && isMobileValid) ? () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          onSubmit();
          onPressed();
        }
      } : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: borderColor),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontFamily: GoogleFonts.archivo().fontFamily,
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}




