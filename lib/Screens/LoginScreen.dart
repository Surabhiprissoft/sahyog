import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sahyog/Screens/AdminDashboard.dart';
import 'package:sahyog/controller/LoginController.dart';
import 'package:sahyog/model/ResponseModel/LoginResponseModel.dart';
import 'package:sahyog/network/api_baseHelper.dart';
import 'package:sahyog/network/user_repository.dart';

class LoginScreen extends GetView<LoginController> {
   LoginScreen({super.key});



  final LoginController loginController = Get.put(LoginController(UserRepository(ApiBaseHelper())));
  var date = DateTime.now();
  var customeDate = DateTime.now().add(Duration(days: 7));

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Login"),
      ),

      body: SingleChildScrollView(
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
      ),
    );
  }
}
