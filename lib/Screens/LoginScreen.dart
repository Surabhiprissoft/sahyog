import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/Screens/AdminDashboard.dart';
import 'package:sahyog/controller/LoginController.dart';
import 'package:sahyog/model/ResponseModel/LoginResponseModel.dart';
import 'package:sahyog/network/api_baseHelper.dart';
import 'package:sahyog/network/user_repository.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';

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
          CustomTopBar(titleName: "Login"),
          Positioned  (
              top: 100,
              left: 0,
              right: 0,
              child: Container(
                  //height: 100.h,
                  padding: EdgeInsets.only(top: 10.h,left: 2.h,right: 2.h,),
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
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            label: Text("Email"),
                                            border: OutlineInputBorder()
                                        ),
                                        controller: loginController.emailController,
                                        onSaved: (value){
                                          loginController.email=value!;
                                        },
                                        /*   validator: (value){
                              return loginController.validateEmail(value!);
                            },*/
                                      ),
                                      const SizedBox(height: 20.0),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            label: Text("Password"),
                                            border: OutlineInputBorder()
                                        ),
                                        controller: loginController.passController,
                                        onSaved: (value){
                                          loginController.password=value!;
                                        },
                                        validator: (value){
                                          return loginController.validatePass(value!);
                                        },
                                      ),
                                      const SizedBox(height: 20.0),
                                      OutlinedButton(
                                          onPressed: (){
                                             loginController.onlogin();
                                          },
                                          child: const Text("Login")
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
        ],
      )

    );
  }
}
