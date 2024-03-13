import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/Screens/AdminDashboard.dart';
import 'package:sahyog/controller/LoginController.dart';
import 'package:sahyog/model/ResponseModel/LoginResponseModel.dart';
import 'package:sahyog/network/api_baseHelper.dart';
import 'package:sahyog/network/user_repository.dart';
import 'package:sahyog/utils/app_colors.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';
import 'package:sahyog/widgets/common_textfield.dart';

class LoginScreen extends GetView<LoginController> {
   LoginScreen({super.key});


  final loginController  = Get.find<LoginController>();
  //final LoginController loginController = Get.put(LoginController(UserRepository(ApiBaseHelper())));
  var date = DateTime.now();
  var customeDate = DateTime.now().add(Duration(days: 7));

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Stack(
        children: [
          CustomTopBar(titleName: ""),
          Positioned  (
              top: 140,
              left: 0,
              right: 0,
              child: Container(
                  //height: 100.h,
                  padding: EdgeInsets.only(top: 13.h,left: 2.h,right: 2.h,),
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
                      Container(
                          height: Get.height*0.9,                          //With Getx
                          width: MediaQuery.of(context).size.width*1,      //Without GetX
                          margin: EdgeInsets.all(10.0),

                          child: Builder(
                              builder: (context) {
                                return Form(
                                  key: loginController.loginFormKey,
                                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                                  autovalidateMode: loginController.shouldValidate ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                                  child: Column(
                                    children: [
                                      Text("Login",style: TextStyle(fontSize: 23.sp,color: AppColors.appThemeColor,fontWeight: FontWeight.w700),),
                                      const SizedBox(height: 25.0,),
                                      InputTextFormField(label: "Email ID",
                                          keyboardType: TextInputType.emailAddress,controller: loginController.emailController),
                                      const SizedBox(height: 20.0,),

                                      InputTextFormField(label: "Password",
                                          keyboardType: TextInputType.text,controller: loginController.passController),
                                      const SizedBox(height: 5.0),

                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            // Implement your forgot password functionality here
                                          },
                                          child: Text(
                                            "Forgot Password?",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(decoration: TextDecoration.underline,color: AppColors.appThemeColor),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20.0),
                                      SizedBox(
                                        width: 100.w,
                                        child: ElevatedButton(
                                            onPressed: (){
                                              loginController.onlogin();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                              backgroundColor: AppColors.appThemeColor
                                            ),
                                            child: const Text("Login",style: TextStyle(color: Colors.white),)
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
      )

    );
  }
}
