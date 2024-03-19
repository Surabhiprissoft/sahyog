import 'dart:io';

import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/Screens/AddTrainee.dart';
import 'package:sahyog/Screens/AddTrainer.dart';
import 'package:sahyog/Screens/ManageTrainee.dart';
import 'package:sahyog/Screens/ManageTrainer.dart';
import 'package:sahyog/controller/AdminDashboardController.dart';
import 'package:sahyog/model/ResponseModel/AdminDashboardResponseModel.dart';
import 'package:sahyog/model/ResponseModel/LoginResponseModel.dart';
import 'package:sahyog/utils/app_colors.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

import '../widgets/AnimatedCount.dart';

class AdminDasboard extends GetView<AdminDashboardController> {
  AdminDasboard({super.key});

  final adminDashboardController = Get.find<AdminDashboardController>();


  var totalCenterCount = 1;
  List<String> imagePaths = [
    'assets/images/schedule_qa.svg',
    'assets/images/trainer_qa.svg',
    'assets/images/trainee_qa.svg',
  ];
  List<String> quickAccessMenu = [
    'Schedule Trainer',
    'Add Trainer',
    'Add Trainee',
  ]; // List of image paths

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //getLoggedData();
        bool exit = await showExitDialog(context);
        return exit;
        // return exit(0);
      },
      child: Scaffold(
        floatingActionButton: FabCircularMenuPlus(
          fabSize: 7.h,
          fabOpenColor: AppColors.appThemeColor,
          fabCloseColor: AppColors.appThemeColor,
          fabOpenIcon: Icon(Icons.menu, color: Colors.white,),
          fabCloseIcon: Icon(Icons.close, color: Colors.white,),
          ringColor: AppColors.ringDiameterColor,
          ringWidth: 75.0,
          ringDiameter: 320.0,
          children: <Widget>[
            GestureDetector(
              onTap: () {

              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(onPressed: () {
                    showLogoutDialog(context);
                  },
                    icon: Icon(Icons.logout_outlined, size: 8.w,),
                    color: AppColors.appThemeColor,),
                  Text("Logout", style: TextStyle(
                      fontSize: 14.sp, color: AppColors.appThemeColor),),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(onPressed: () {
                    Get.to(ManageTrainee());
                  },
                      icon: Icon(Icons.groups_outlined, size: 8.w,),
                      color: AppColors.appThemeColor),
                  Text("Trainee", style: TextStyle(
                      fontSize: 14.sp, color: AppColors.appThemeColor)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(onPressed: () {
                    Get.to(ManageTrainer());
                  },
                      icon: SvgPicture.asset("assets/images/trainer.svg",),
                      iconSize: 8.h),
                  Text("Trainer", style: TextStyle(
                      fontSize: 14.sp, color: AppColors.appThemeColor)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(onPressed: () {},
                    icon: Icon(Icons.home_outlined, size: 8.w,),
                    color: AppColors.appThemeColor,),
                  Text("Home", style: TextStyle(
                      fontSize: 14.sp, color: AppColors.appThemeColor)),
                ],
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            CustomTopBar(titleName: "Admin Dashboard"),
            Positioned(
                top: 140,
                left: 0,
                right: 0,
                child: Container(
                  height: 100.h,
                  padding: EdgeInsets.all(2.h),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 7.5.h,),
                        Row(
                          children: [
                            SubHeaderText(sub_header: "Total Centers "),
                            Obx(() {
                              return SubHeaderText(
                                  sub_header: adminDashboardController
                                      .centerList.length.toString());
                            }),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          width: 100.w,
                          height: 30.h,
                          child: Obx(() {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: adminDashboardController.centerList
                                  .length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final center = adminDashboardController
                                    .centerList[index];

                                return CenterWiseCard(center: center);
                              },
                            );
                          }),
                        ),
                        SizedBox(height: 3.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SubHeaderText(sub_header: "Fees Status "),
                            TextButton(onPressed: () {},
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(EdgeInsets.zero,)),
                                child: Text("View", style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400),))
                          ],
                        ),
                        Card(
                            elevation: 10.0,
                            surfaceTintColor: Colors.white,
                            color: Colors.white,
                            child: Container(
                                width: 100.w,
                                height: 13.h,
                                margin: EdgeInsets.only(right: 10.w,
                                    left: 10.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text("68%"),
                                        Text("32%")
                                      ],
                                    ),
                                    SizedBox(height: 5.0),
                                    LinearProgressIndicator(
                                      value: 0.6,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.green),
                                      minHeight: 7.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                      backgroundColor: Colors.redAccent,
                                    ),
                                    SizedBox(height: 5.0),
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text("Paid"),
                                        Text("Due")
                                      ],
                                    ),
                                  ],
                                )
                            )
                        ),
                        SizedBox(height: 12.0),
                        SubHeaderText(sub_header: "Quick Access"),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  imagePaths.length, (index) =>
                                  _buildCard(
                                      imagePaths[index],
                                      quickAccessMenu[index])),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),

                      ],
                    ),
                  ),
                )
            ),
            Positioned(
                top: 85,
                // Adjust this value to control the position of the card
                left: 16,
                right: 16,
                child: SizedBox(
                  height: 16.h,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        elevation: 10.0,
                        surfaceTintColor: Colors.white,
                        child: Container(
                          width: 40.w,
                          height: 15.h,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  //height: 0.55 * 15.h, // 70% of the parent's height
                                  child: Container(
                                      margin: EdgeInsets.only(top: 1.h),
                                      child: Center(child: Obx(() {
                                        return Text(adminDashboardController
                                            .totalTraineeCount.value
                                            .toString(),style: TextStyle(
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.goldenText
                                        ),);
                                      }))),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  //height: 0.438 * 15.h, // 30% of the parent's height
                                  child: Container(
                                    margin: const EdgeInsets.all(3),
                                    decoration: const BoxDecoration(
                                      color: AppColors.blueRacket,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                      ),
                                    ),
                                    // color: Colors.lightBlueAccent,
                                    child: Center(
                                        child: Text(
                                          "Total Trainees",
                                          style: TextStyle(fontSize: 17.sp,
                                              fontWeight: FontWeight.w500),
                                        )
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ),
                      Card(
                        elevation: 10.0,
                        surfaceTintColor: Colors.white,
                        child: Container(
                          width: 40.w,
                          height: 15.h,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  //height: 0.55 * 15.h, // 70% of the parent's height
                                  child: Container(
                                      margin: EdgeInsets.only(top: 1.h),
                                      child: Center(child: Obx(() {
                                        return Text(adminDashboardController
                                            .totalTrainerCount.value
                                            .toString(),style: TextStyle(
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.goldenText
                                        ),);
                                      }))),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  // height: 0.438 * 15.h, // 30% of the parent's height
                                  child: Container(
                                    margin: const EdgeInsets.all(3),
                                    decoration: const BoxDecoration(
                                      color: AppColors.redRacket,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                      ),
                                    ),
                                    // color: Colors.lightBlueAccent,
                                    child: Center(
                                      child: Text(
                                        "Total Trainers",
                                        style: TextStyle(fontSize: 17.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ),
                    ],
                  ),
                )
            )

          ],
        ),

      ),
    );
  }
}

class CenterWiseCard extends StatelessWidget {

  final Centers center;

  const CenterWiseCard({
    super.key, required this.center,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          surfaceTintColor: Colors.white,
          elevation: 10.0,
          child: Container(
            width: 30.w,
            height: 25.h,
            child: Column(
              children: [
                SizedBox(
                  height: 0.5 * 25.h,
                  // 70% of the parent's height
                  child: Container(
                      margin: EdgeInsets.only(top: 1.h),
                      child: Center(child: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .center,
                        children: [
                          Text(center.totalTrainees.toString(),style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.goldenText
                          ),),
                          Text("trainees")
                        ],
                      ))),
                ),
                SizedBox(
                  height: 0.5 * 25.h,
                  // 30% of the parent's height
                  child: Container(
                    margin: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      color: AppColors.blueRacket,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                    // color: Colors.lightBlueAccent,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .center,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                ""),
                            radius: 3.5.h,),
                          Text("Trainer"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ),
        Text(center.name.toString(), style: TextStyle(
            fontWeight: FontWeight.w600),),
      ],
    );
  }
}


Widget _buildCard(String imagePath, String quickAccessName) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          if (quickAccessName == "Schedule Trainer") {

          } else if (quickAccessName == "Add Trainer") {
            Get.to(() => AddTrainer());
          }
          else {
            Get.to(() => AddTrainee());
          }
        },
        child: Container(

          margin: EdgeInsets.only(left: 2.w, right: 2.w, bottom: 1.h),
          child: Card(
              surfaceTintColor: Colors.white,
              elevation: 5.0,
              child: Container(
                  width: 22.w,
                  height: 10.h,
                  padding: EdgeInsets.all(20.0),
                  child: SvgPicture.asset(imagePath)
              )
          ),
        ),
      ),

      Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: quickAccessName.split(' ')
            .map((word) =>
            Text(word, style: TextStyle(fontWeight: FontWeight.w500),))
            .toList(),
      )
    ],
  );
}



