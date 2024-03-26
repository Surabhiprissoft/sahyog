import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahyog/Screens/AdminDashboard.dart';
import 'package:sahyog/Screens/ChangePassword.dart';
import 'package:sahyog/model/BaseListResponse.dart';
import 'package:sahyog/model/BaseSingleObjectResponse.dart';
import 'package:sahyog/model/Centers.dart';
import 'package:sahyog/model/RequestModel/LoginRequestModel.dart';
import 'package:sahyog/model/ResponseModel/CenterResponseModel.dart';
import 'package:sahyog/model/ResponseModel/LoginResponseModel.dart';
import 'package:sahyog/network/user_repository.dart';
import 'package:sahyog/utils/app_constants.dart';
import 'package:sahyog/utils/preference_utils.dart';
import 'package:sahyog/widgets/DialogHelper.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

import '../Screens/TraineeDashboard.dart';
import '../Screens/TrainerDashboard.dart';

class LoginController extends GetxController
{
  final UserRepository userRepository;

   late GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController,passController;
  var email='',password='';
  bool shouldValidate = false;
  var isObscure = RxBool(true);
  late SingleResponse<LoginResponseModel> loginResponseModel;


  LoginController(this.userRepository);



  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
    passController = TextEditingController();
    loginFormKey = GlobalKey<FormState>();
    getData();
  }

 void clearcontrollers()
 {
     loginFormKey = GlobalKey<FormState>();
     shouldValidate=false;
     emailController.clear();
     passController.clear();
     update();
 }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

    loginFormKey.currentState!.reset();
    emailController.dispose();
    passController.dispose();
    shouldValidate=false;

  }



  String? validateEmail(String? value)
  {
    if (value == null || value.isEmpty) {
      return "Please enter registered email ID";
    } else if (!GetUtils.isEmail(value)) {
      return "Enter valid email";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a password";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }




  Future<SingleResponse<LoginResponseModel>> onlogin() async {
    try {
      final isValid = loginFormKey.currentState!.validate();
      if (!isValid) {
        showSnackBar("Login Failed", "Enter all fields to login");
        shouldValidate = true;
      } else {
        loginFormKey.currentState!.save();
        LoginRequestModel loginRequestModel = LoginRequestModel(
          email: emailController.text.toString(),
          password: passController.text.toString(),
        );

        print(loginRequestModel.toString());

        DialogHelper.showLoading();

        loginResponseModel= await userRepository.checkLogin(loginRequestModel);

        if(loginResponseModel.status==200){
          DialogHelper.hideLoading();
          PreferenceUtils.setString(AppConstants.USER_TOKEN,loginResponseModel.data.sessionToken.toString());
          PreferenceUtils.setInt(AppConstants.ROLE,loginResponseModel.data.role!!);
          PreferenceUtils.setString(AppConstants.USERNAME,loginResponseModel.data.firstName.toString());

          print(loginResponseModel.data.role);
          print(loginResponseModel.data.isFirsttime);
          String? email = loginResponseModel.data?.email;

          if(loginResponseModel.data.role!=3 && loginResponseModel.data.isFirsttime==true){
            print("inside "+email.toString());
            Get.to(()=>ChangePassword(),arguments: email);
          }else{
            if(loginResponseModel.data.role==1){
              Get.to(()=>TrainerDashboard());
            }
            else if(loginResponseModel.data.role==2)
            {
              Get.to(()=>TraineeDashboard());
            }
            else{
              Get.to(()=>AdminDasboard());
            }
          }

          clearcontrollers();
        }
        else{
          DialogHelper.hideLoading();
          showSnackBar("Login Failed", loginResponseModel.message);
        }
        return loginResponseModel;
      }
    }
    catch (error) {

      DialogHelper.hideLoading();
      print('Error during login: $error');
      showSnackBar("Login Failed", "Check your Username or Password");
      throw error;
    }

    return loginResponseModel;
    // Return null or an error response if login fails

  }


  void clearFieldsAndReset() {
    emailController.clear();
    passController.clear();
    loginFormKey.currentState!.reset();

  }

  void getData() {

    List<Map<String, dynamic>> responseData =
    [
      {
        "id": 1,
        "ctable": {
          "id": 4,
          "name": "SP",
          "address": "SP Prasarakh Mandali, SP College, Tilak Road",
          "total_trainees": 4
        },
        "ttable": {
          "id": 1,
          "start_timme": "18:30:00",
          "end_time": "20:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 2,
        "ctable": {
          "id": 4,
          "name": "SP",
          "address": "SP Prasarakh Mandali, SP College, Tilak Road",
          "total_trainees": 4
        },
        "ttable": {
          "id": 16,
          "start_timme": "20:00:00",
          "end_time": "21:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 3,
        "ctable": {
          "id": 5,
          "name": "Race",
          "address": "Salunke Vihar Road",
          "total_trainees": 2
        },
        "ttable": {
          "id": 3,
          "start_timme": "08:00:00",
          "end_time": "10:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 4,
        "ctable": {
          "id": 5,
          "name": "Race",
          "address": "Salunke Vihar Road",
          "total_trainees": 2
        },
        "ttable": {
          "id": 4,
          "start_timme": "17:00:00",
          "end_time": "20:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 5,
        "ctable": {
          "id": 6,
          "name": "Sahabhag Hall",
          "address": "Somvar Peth",
          "total_trainees": 2
        },
        "ttable": {
          "id": 2,
          "start_timme": "19:00:00",
          "end_time": "20:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 6,
        "ctable": {
          "id": 7,
          "name": "Symbiosis School",
          "address": "Prabhat Road",
          "total_trainees": 1
        },
        "ttable": {
          "id": 5,
          "start_timme": "07:30:00",
          "end_time": "10:30:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 7,
        "ctable": {
          "id": 7,
          "name": "Symbiosis School",
          "address": "Prabhat Road",
          "total_trainees": 1
        },
        "ttable": {
          "id": 6,
          "start_timme": "10:30:00",
          "end_time": "13:30:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 8,
        "ctable": {
          "id": 7,
          "name": "Symbiosis School",
          "address": "Prabhat Road",
          "total_trainees": 1
        },
        "ttable": {
          "id": 7,
          "start_timme": "14:30:00",
          "end_time": "16:30:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 9,
        "ctable": {
          "id": 7,
          "name": "Symbiosis School",
          "address": "Prabhat Road",
          "total_trainees": 1
        },
        "ttable": {
          "id": 8,
          "start_timme": "18:00:00",
          "end_time": "21:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 10,
        "ctable": {
          "id": 8,
          "name": "Jnana Prabodhini",
          "address": "Sadashiv Peth",
          "total_trainees": 0
        },
        "ttable": {
          "id": 9,
          "start_timme": "09:45:00",
          "end_time": "11:45:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 11,
        "ctable": {
          "id": 8,
          "name": "Jnana Prabodhini",
          "address": "Sadashiv Peth",
          "total_trainees": 0
        },
        "ttable": {
          "id": 10,
          "start_timme": "16:00:00",
          "end_time": "20:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 12,
        "ctable": {
          "id": 9,
          "name": "RCBC",
          "address": "Bund garden road",
          "total_trainees": 0
        },
        "ttable": {
          "id": 8,
          "start_timme": "18:00:00",
          "end_time": "21:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 13,
        "ctable": {
          "id": 9,
          "name": "RCBC",
          "address": "Bund garden road",
          "total_trainees": 0
        },
        "ttable": {
          "id": 11,
          "start_timme": "10:00:00",
          "end_time": "12:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 14,
        "ctable": {
          "id": 10,
          "name": "Pawar public school",
          "address": "Nanded City",
          "total_trainees": 0
        },
        "ttable": {
          "id": 12,
          "start_timme": "17:00:00",
          "end_time": "18:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 15,
        "ctable": {
          "id": 11,
          "name": "Versatile school",
          "address": "Sinhagad road",
          "total_trainees": 1
        },
        "ttable": {
          "id": 13,
          "start_timme": "12:00:00",
          "end_time": "14:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 16,
        "ctable": {
          "id": 11,
          "name": "Versatile school",
          "address": "Sinhagad road",
          "total_trainees": 1
        },
        "ttable": {
          "id": 14,
          "start_timme": "18:30:00",
          "end_time": "21:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 17,
        "ctable": {
          "id": 12,
          "name": "Jnana Seva Foundation",
          "address": "katraj",
          "total_trainees": 0
        },
        "ttable": {
          "id": 15,
          "start_timme": "17:00:00",
          "end_time": "19:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 18,
        "ctable": {
          "id": 12,
          "name": "Jnana Seva Foundation",
          "address": "katraj",
          "total_trainees": 0
        },
        "ttable": {
          "id": 11,
          "start_timme": "10:00:00",
          "end_time": "12:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 19,
        "ctable": {
          "id": 13,
          "name": "Apla Ghar",
          "address": "Wagholi, nagar highway",
          "total_trainees": 1
        },
        "ttable": {
          "id": 11,
          "start_timme": "10:00:00",
          "end_time": "12:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 590,
        "ctable": {
          "id": 4,
          "name": "SP",
          "address": "SP Prasarakh Mandali, SP College, Tilak Road",
          "total_trainees": 4
        },
        "ttable": {
          "id": 1,
          "start_timme": "18:30:00",
          "end_time": "20:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 591,
        "ctable": {
          "id": 4,
          "name": "SP",
          "address": "SP Prasarakh Mandali, SP College, Tilak Road",
          "total_trainees": 4
        },
        "ttable": {
          "id": 16,
          "start_timme": "20:00:00",
          "end_time": "21:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 592,
        "ctable": {
          "id": 5,
          "name": "Race",
          "address": "Salunke Vihar Road",
          "total_trainees": 2
        },
        "ttable": {
          "id": 3,
          "start_timme": "08:00:00",
          "end_time": "10:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 593,
        "ctable": {
          "id": 5,
          "name": "Race",
          "address": "Salunke Vihar Road",
          "total_trainees": 2
        },
        "ttable": {
          "id": 4,
          "start_timme": "17:00:00",
          "end_time": "20:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 594,
        "ctable": {
          "id": 6,
          "name": "Sahabhag Hall",
          "address": "Somvar Peth",
          "total_trainees": 2
        },
        "ttable": {
          "id": 2,
          "start_timme": "19:00:00",
          "end_time": "20:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 595,
        "ctable": {
          "id": 7,
          "name": "Symbiosis School",
          "address": "Prabhat Road",
          "total_trainees": 1
        },
        "ttable": {
          "id": 5,
          "start_timme": "07:30:00",
          "end_time": "10:30:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 596,
        "ctable": {
          "id": 7,
          "name": "Symbiosis School",
          "address": "Prabhat Road",
          "total_trainees": 1
        },
        "ttable": {
          "id": 6,
          "start_timme": "10:30:00",
          "end_time": "13:30:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 597,
        "ctable": {
          "id": 7,
          "name": "Symbiosis School",
          "address": "Prabhat Road",
          "total_trainees": 1
        },
        "ttable": {
          "id": 7,
          "start_timme": "14:30:00",
          "end_time": "16:30:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 598,
        "ctable": {
          "id": 7,
          "name": "Symbiosis School",
          "address": "Prabhat Road",
          "total_trainees": 1
        },
        "ttable": {
          "id": 8,
          "start_timme": "18:00:00",
          "end_time": "21:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 599,
        "ctable": {
          "id": 8,
          "name": "Jnana Prabodhini",
          "address": "Sadashiv Peth",
          "total_trainees": 0
        },
        "ttable": {
          "id": 9,
          "start_timme": "09:45:00",
          "end_time": "11:45:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 600,
        "ctable": {
          "id": 8,
          "name": "Jnana Prabodhini",
          "address": "Sadashiv Peth",
          "total_trainees": 0
        },
        "ttable": {
          "id": 10,
          "start_timme": "16:00:00",
          "end_time": "20:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 601,
        "ctable": {
          "id": 9,
          "name": "RCBC",
          "address": "Bund garden road",
          "total_trainees": 0
        },
        "ttable": {
          "id": 8,
          "start_timme": "18:00:00",
          "end_time": "21:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 602,
        "ctable": {
          "id": 9,
          "name": "RCBC",
          "address": "Bund garden road",
          "total_trainees": 0
        },
        "ttable": {
          "id": 11,
          "start_timme": "10:00:00",
          "end_time": "12:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 603,
        "ctable": {
          "id": 10,
          "name": "Pawar public school",
          "address": "Nanded City",
          "total_trainees": 0
        },
        "ttable": {
          "id": 12,
          "start_timme": "17:00:00",
          "end_time": "18:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 604,
        "ctable": {
          "id": 11,
          "name": "Versatile school",
          "address": "Sinhagad road",
          "total_trainees": 1
        },
        "ttable": {
          "id": 13,
          "start_timme": "12:00:00",
          "end_time": "14:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 605,
        "ctable": {
          "id": 11,
          "name": "Versatile school",
          "address": "Sinhagad road",
          "total_trainees": 1
        },
        "ttable": {
          "id": 14,
          "start_timme": "18:30:00",
          "end_time": "21:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 606,
        "ctable": {
          "id": 12,
          "name": "Jnana Seva Foundation",
          "address": "katraj",
          "total_trainees": 0
        },
        "ttable": {
          "id": 15,
          "start_timme": "17:00:00",
          "end_time": "19:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 607,
        "ctable": {
          "id": 12,
          "name": "Jnana Seva Foundation",
          "address": "katraj",
          "total_trainees": 0
        },
        "ttable": {
          "id": 11,
          "start_timme": "10:00:00",
          "end_time": "12:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 608,
        "ctable": {
          "id": 13,
          "name": "Apla Ghar",
          "address": "Wagholi, nagar highway",
          "total_trainees": 1
        },
        "ttable": {
          "id": 11,
          "start_timme": "10:00:00",
          "end_time": "12:00:00"
        },
        "date": "2024-03-23"
      }
    ];

    List<CenterModel> centers = [];

    // Processing response data
    for (var data in responseData) {
      var centerName = data['ctable']['name'];
      var startTime = data['ttable']['start_timme'];
      var endTime = data['ttable']['end_time'];

      var existingCenter = centers.firstWhere((center) => center.name == centerName);

      if (existingCenter == null) {
        centers.add(CenterModel(centerName, ['${startTime.substring(0, 5)} am - ${endTime.substring(0, 5)} am']));
      } else {
        existingCenter.timeSlots.add('${startTime.substring(0, 5)} am - ${endTime.substring(0, 5)} am');
      }
    }

    // Printing formatted output
    for (var center in centers) {
      print(center);
    }
  }
}