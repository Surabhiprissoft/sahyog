import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/Screens/AddTrainer.dart';
import 'package:sahyog/Screens/AdminDashboard.dart';
import 'package:sahyog/Screens/ChangePassword.dart';
import 'package:sahyog/Screens/LoginScreen.dart';
import 'package:sahyog/Screens/ManageTrainee.dart';
import 'package:sahyog/Screens/ManageTrainer.dart';
import 'package:sahyog/Screens/StickyCenters.dart';
import 'package:sahyog/Screens/TraineeDashboard.dart';
import 'package:sahyog/Screens/TraineeProfile.dart';
import 'package:sahyog/Screens/TrainerDashboard.dart';
import 'package:sahyog/Screens/TrainerProfile.dart';
import 'package:sahyog/bindings/ProjectBindings.dart';
import 'package:sahyog/utils/app_constants.dart';
import 'package:sahyog/utils/preference_utils.dart';



enum Version {
  lazy,
  wait
}
const String version = String.fromEnvironment('VERSION');
const Version running = version == "lazy" ? Version.lazy : Version.wait;
void main() async {
  ProjectBindings().dependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context,orientation,screenType) {
        return GetMaterialApp(
          title: 'Sahbhag',
          debugShowCheckedModeBanner: false,
          initialBinding: ProjectBindings(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            fontFamily: "Poppins",
            useMaterial3: true,
          ),
          home: SizedBox(
            height: 100.h,
            width: 100.w,
            child: AnimatedSplashScreen.withScreenFunction(
              splash: "assets/images/splash.gif",
              splashIconSize: double.infinity,
              backgroundColor: Colors.white,
              animationDuration: Duration(seconds: 3),
              screenFunction: () async {
                int? role = PreferenceUtils.getInt(AppConstants.ROLE);
                print("Role from PreferenceUtils: $role"); // Add this debug print
                if (role != null) {
                  if (role == 1) {
                    return await Get.to(TrainerDashboard());
                  } else if (role == 2) {
                    return await Get.to(TraineeDashboard());
                  } else if(role==3) {
                    return await Get.to(()=>AdminDasboard());
                  }
                  else{
                    return await Get.to(LoginScreen());
                  }
                }
                else{
                  return await Get.to(LoginScreen());
                }
              },
            ),
          )

        );

      }
    );
  }
}

