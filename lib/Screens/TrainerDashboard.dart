import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/Screens/ManageTrainee.dart';
import 'package:sahyog/controller/TrainerDashboardController.dart';
import 'package:sahyog/utils/app_colors.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

class TrainerDashboard extends GetView<TrainerDashboardController> {
  TrainerDashboard({super.key});

  final trainerdashBoardController = Get.put(TrainerDashboardController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool exit = await showExitDialog(context);
        return exit;
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
          ringDiameter: 300.0,
          children: <Widget>[
            GestureDetector(
              onTap: () {},
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
            CustomTopBar(titleName: "Welcome Back, Trainer"),
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
                    child: Column(
                      children: [
                        CalendarTimeline(
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 7)),
                          onDateSelected: (date) =>
                          {
                            trainerdashBoardController.SelectedDate.value =
                                date.day.toString()
                          },
                          monthColor: Colors.blueGrey,
                          dayColor: Colors.teal[200],
                          activeDayColor: Colors.white,
                          activeBackgroundDayColor: Colors.redAccent[100],
                          dotsColor: Color(0xFF333A47),
                          locale: 'en_ISO',
                        ),

                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          //height: 30.h,
                          margin: EdgeInsets.only(top: 3.h),
                          child: Card(
                            surfaceTintColor: Colors.white,
                            elevation: 10.0,
                            child: Container(
                              margin: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Obx(() {
                                            return Text(
                                                trainerdashBoardController
                                                    .SelectedDate.value,
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight
                                                        .w500));
                                          }),
                                          Text(" MARCH", style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w700),)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("OUT "),
                                          Obx(() {
                                            return Switch(
                                                value: trainerdashBoardController
                                                    .switchValue.value,
                                                onChanged: (value) {
                                                  setState() {
                                                    trainerdashBoardController
                                                        .switchValue
                                                        .value = value;
                                                  }
                                                });
                                          }),
                                          Text(" IN"),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(height: 20.0,),
                                      Icon(Icons.timer_sharp),
                                      SizedBox(width: 10.0,),
                                      Text("7 : 00 am - 9 : 00 am")
                                    ],
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text("Center Name 1", style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.start,)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          //height: 30.h,
                          margin: EdgeInsets.only(top: 1.h),
                          child: Card(
                            surfaceTintColor: Colors.white,
                            elevation: 10.0,
                            child: Container(
                              margin: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Obx(() {
                                            return Text(
                                                trainerdashBoardController
                                                    .SelectedDate.value,
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight
                                                        .w500));
                                          }),
                                          Text(" MARCH", style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w700),)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("OUT "),
                                          Obx(() {
                                            return Switch(
                                                value: trainerdashBoardController
                                                    .switchValue.value,
                                                onChanged: (value) {
                                                  setState() {
                                                    trainerdashBoardController
                                                        .switchValue
                                                        .value = value;
                                                  }
                                                });
                                          }),
                                          Text(" IN"),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(height: 20.0,),
                                      Icon(Icons.timer_sharp),
                                      SizedBox(width: 10.0,),
                                      Text("6 : 00 pm - 8 : 00 pm")
                                    ],
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text("Center Name 2", style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.start,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                )
            ),

          ],
        ),

      ),
    );
  }
}
