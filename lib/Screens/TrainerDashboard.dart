import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/controller/TrainerDashboardController.dart';
import 'package:sahyog/utils/app_colors.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

class TrainerDashboard extends GetView<TrainerDashboardController> {
  const TrainerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        bool exit = await showExitDialog(context);
        return exit;
      },
      child: Scaffold(
        floatingActionButton: FabCircularMenuPlus(
          fabSize: 7.h,
          fabOpenColor: AppColors.appThemeColor,
          fabCloseColor: AppColors.appThemeColor,
          fabOpenIcon: Icon(Icons.menu,color: Colors.white,),
          fabCloseIcon: Icon(Icons.close,color: Colors.white,),
          ringColor: AppColors.ringDiameterColor,
          ringWidth: 75.0,
          ringDiameter: 300.0,
          children: <Widget>[
            GestureDetector(
              onTap: (){},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_outlined,size: 8.w,),color: AppColors.appThemeColor,),
                  Text("Accounts",style: TextStyle(fontSize:14.sp,color: AppColors.appThemeColor),),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(onPressed: (){}, icon: Icon(Icons.groups_outlined,size: 8.w,),color: AppColors.appThemeColor),
                  Text("Trainee",style: TextStyle(fontSize:14.sp,color: AppColors.appThemeColor)),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(onPressed: (){}, icon: Icon(Icons.home_outlined,size: 8.w,),color: AppColors.appThemeColor,),
                  Text("Home",style: TextStyle(fontSize:14.sp,color: AppColors.appThemeColor)),
                ],
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            CustomTopBar(titleName: "Welcome Back, Trainer"),
            Positioned  (
                top: 140,
                left: 0,
                right: 0,
                child: Container(
                  height: 100.h,
                  padding: EdgeInsets.all(2.h),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Text(""),
                )
            ),

          ],
        ),

      ),
    );
  }
}
