

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/app_colors.dart';
import '../utils/app_validation.dart';

class MyTextFormField extends StatelessWidget {
  final String labelText;
  final Function(String?) validator;
  final Function(String?) onSaved;


  const MyTextFormField({
    required this.labelText,
    required this.validator,
    required this.onSaved,

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      validator: (value){
        return AppValidation.validateEmail(value!);
      },
      onSaved: onSaved,
    );
  }
}


class InputFormField extends StatefulWidget {
  final String lableText;
  final String? hintText;
  final TextEditingController textcontroller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final VoidCallback? onFieldSubmitted;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool enableField;
  final AutovalidateMode autovalidateMode;
  final Color focusedBorderColor;
  final String? svgIcon;

  const InputFormField({
    Key? key,
    required this.textcontroller, required this.lableText, required this.validator,
    this.focusNode, this.onFieldSubmitted, required this.keyboardType,required this.obscureText, this.autovalidateMode = AutovalidateMode.onUserInteraction, required this.focusedBorderColor,
    this.svgIcon, this.hintText,this.enableField=true,
  }) : super(key: key);

  @override
  _InputFormFieldState createState() => _InputFormFieldState();
}

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
        border: OutlineInputBorder(),
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
            return AppValidation.validateforrequiredfield(value, label);
          }



      },

    );
  }
}


class _InputFormFieldState extends State<InputFormField> {
  late  bool  _isPasswordVisible = true;


  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: TextFormField(
        enabled: widget.enableField,
        style: TextStyle(
          fontFamily: GoogleFonts.archivo().fontFamily,
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          color:widget.enableField==true? Colors.black87:Colors.black45, // Adjust text color
        ),
        decoration:  InputDecoration(
          errorStyle: TextStyle(fontSize:13.sp,fontWeight: FontWeight.w400,),
          fillColor: Colors.white,
         hintText: widget.hintText,

         hintStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.sp,color: AppColors.hintText1),
         label: RichText(
           text:  TextSpan(
               text: widget.lableText,
               style: TextStyle(
                 fontFamily: GoogleFonts.archivo().fontFamily,
                 color:widget.enableField==true? Colors.black87:Colors.black26,
                 fontWeight: FontWeight.w400,
                 fontSize: 14.sp,
               ),
               /*children: [
                 TextSpan(
                     text: "\*",
                     style: TextStyle(color: Colors.red,fontSize: 14.sp,fontWeight: FontWeight.w400)),
               ]*/
           ),
         ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade800,
              width: 1// Set border color when not focused
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: widget.focusedBorderColor,width: 1), // Set focused border color
            borderRadius: BorderRadius.circular(6.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45,width: 1), // Set focused border color
            borderRadius: BorderRadius.circular(6.0),
          ),
          border:  OutlineInputBorder(
            borderSide: BorderSide(color: widget.focusedBorderColor,width: 1),
            borderRadius: BorderRadius.circular(6.0),
          ),

          suffixIcon: widget.keyboardType == TextInputType.visiblePassword
              ? IconButton(
               icon: Icon(
              _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          )
              : widget.svgIcon != null
              ? Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(widget.svgIcon!),
          )
              : null,

      ),
        controller: widget.textcontroller,
        validator: widget.validator,
        focusNode: widget.focusNode,
        obscureText: widget.keyboardType == TextInputType.visiblePassword && _isPasswordVisible,
        keyboardType: widget.keyboardType,
        autovalidateMode: widget.autovalidateMode,

        onFieldSubmitted: (value) {
          widget.onFieldSubmitted?.call();
        },

      ),
    );
  }
}


