import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/app_constants.dart';
import '../utils/preference_utils.dart';
import 'AdminDashboard.dart';
import 'LoginScreen.dart';
import 'TraineeDashboard.dart';
import 'TrainerDashBoard.dart';


class SplashPageView extends StatefulWidget {
  const SplashPageView({Key? key}) : super(key: key);

  @override
  State<SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {



        int? role = PreferenceUtils.getInt(AppConstants.ROLE);
        print("Role from PreferenceUtils: $role"); // Add this debug print
        if (role != null) {
          if (role == 1) {
            Get.to(TrainerDashboard());
          } else if (role == 2) {
            Get.to(TraineeDashboard());
          } else if(role==3) {
            Get.to(()=>AdminDasboard());
          }
          else{
            Get.to(LoginScreen());
          }
        }
        else{
          Get.to(LoginScreen());
        }

      /*//Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPageView()));

      Get.to(() => LoginPageView());

      print("ROLE IS${PreferenceUtils.getString(AppConstants.ROLE)}");
      print("isupdated IS${PreferenceUtils.getString(AppConstants.PROFILE_UPDATED)}");
      if (PreferenceUtils.getString(AppConstants.ROLE)!="")
      {
        if((PreferenceUtils.getString(AppConstants.ROLE)=="USER")&&(PreferenceUtils.getString(AppConstants.PROFILE_UPDATED)=="true"))
        {

          Get.to(() => VehiclesPageView(),transition: Transition.circularReveal);
        }
        else
        {
          Get.to(() => CompleteProfileView(),transition: Transition.circularReveal);
          // Get.to(() => LoginPageView(),transition: Transition.circularReveal);

        }
      }
      else {
        // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
        Get.offAll(() => LoginPageView(),);
      }*/




    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset("assets/images/splash.gif",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,)),

          ],
        ),
      ),
    );
  }
}
