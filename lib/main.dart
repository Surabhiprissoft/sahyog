import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/Screens/ChangePassword.dart';
import 'package:sahyog/Screens/DropDownTest.dart';
import 'package:sahyog/Screens/LocationDemo.dart';
import 'package:sahyog/Screens/LoginScreen.dart';
import 'package:sahyog/Screens/SplashPageView.dart';
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
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
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
          home: SplashPageView()

        );

      }
    );
  }
}

