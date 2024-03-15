

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/controller/LoginController.dart';

import '../utils/app_colors.dart';
import '../utils/app_validation.dart';

class InputTextFormField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final List<TextInputFormatter> inputFormatters;


  InputTextFormField({

    required this.label,
    this.keyboardType = TextInputType.text,
    this.inputFormatters = const [],
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      controller: controller,
      validator: (value) {
        if(label=="Mobile Number")
          {
             return AppValidation.validateMobileNumber(value!!);
          }
        else if(label=="Email ID")
          {
            return AppValidation.validateEmail(value!!);
          }
        else
          {
            return AppValidation.validateforrequiredfield(value!!, label);
          }



      },

    );
  }
}

/*class PasswordTextFormField extends StatelessWidget {
  final String label;
  final bool isObscure;
  final TextEditingController controller;


  PasswordTextFormField(
      this.label, this.isObscure, this.controller);

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(

          ),
        ),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),

      obscureText: isObscure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: (value) {
        return AppValidation.validatePassword(value!!);
      },

    );
  }
}*/



