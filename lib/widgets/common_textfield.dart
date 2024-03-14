

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/app_colors.dart';
import '../utils/app_validation.dart';

class InputTextFormField extends StatelessWidget {
  final String label;
  final bool readOnlyValue ;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final List<TextInputFormatter> inputFormatters;


  InputTextFormField({

    required this.label,
    this.keyboardType = TextInputType.text,
    this.readOnlyValue = false,
    this.inputFormatters = const [],
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      controller: controller,
      readOnly: readOnlyValue,
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
            return AppValidation.validateforrequiredfield(value, label);
          }



      },

    );
  }
}



