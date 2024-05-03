import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:sahyog/Screens/Trainee/ManageTrainee.dart';
import 'package:sahyog/controller/dashboardController/TrainerDashboardController.dart';
import 'package:sahyog/model/Centers.dart';
import 'package:sahyog/network/api_baseHelper.dart';
import 'package:sahyog/network/user_repository.dart';
import 'package:sahyog/utils/app_colors.dart';
import 'package:sahyog/utils/app_constants.dart';
import 'package:sahyog/utils/preference_utils.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

class TrainerDashboard extends GetView<TrainerDashboardController> {
  TrainerDashboard({super.key});

  late List <CenterModel> plscenters = [];


  final trainerdashBoardController = Get.find<TrainerDashboardController>();

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
            fabOpenIcon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            fabCloseIcon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            ringColor: AppColors.ringDiameterColor,
            ringWidth: 75.0,
            ringDiameter: 300.0,
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        showLogoutDialog(context);
                      },
                      icon: Icon(
                        Icons.logout_outlined,
                        size: 8.w,
                      ),
                      color: AppColors.appThemeColor,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(
                          fontSize: 14.sp, color: AppColors.appThemeColor),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Get.to(ManageTrainee());
                        },
                        icon: Icon(
                          Icons.groups_outlined,
                          size: 8.w,
                        ),
                        color: AppColors.appThemeColor),
                    Text("Trainee",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.appThemeColor)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.home_outlined,
                        size: 8.w,
                      ),
                      color: AppColors.appThemeColor,
                    ),
                    Text("Home",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.appThemeColor)),
                  ],
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              Positioned(
                  top: 0,
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    //height: 30.h,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Top_bg.png'),
                          fit: BoxFit.cover, // Adjust the BoxFit as needed
                        ),
                        color: Colors.blue),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 5.h, left: 6.w, bottom: 16.h, right: 6.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Dashboard",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                                            CircleAvatar(
                                            backgroundImage: controller.profilePhoto.value !=
                                            null && controller.profilePhoto.value.isNotEmpty
                                                ? NetworkImage(
                                                ApiBaseHelper().imageBaseUrl +
                                                controller.profilePhoto.value)
                                            : NetworkImage(
                                        "https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png"),
                              radius: 45.0,

                            ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Column(
                                children: [
                                  Text("Welcome Back,",
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Obx(() {
                                    return Text(
                                        controller.trainerName.value,
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ));
                                  }),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
              Positioned(
                  top: 22.h,
                  left: 0,
                  right: 0,
                 // bottom: 10,
                  child: Container(
                    
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CalendarTimeline(
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now().subtract(
                                Duration(days: 7)),
                            lastDate: DateTime.now().add(Duration(days: 7)),
                            onDateSelected: (date) {
                              controller.getTrainerDashboardData(date);
                              // controller.sendGeoLocations();
                              /*trainerdashBoardController.SelectedDate.value =
                          date.day.toString()*/
                            },
                            monthColor: Colors.blueGrey,
                            dayColor: Colors.teal[200],
                            activeDayColor: Colors.white,
                            activeBackgroundDayColor: Colors.redAccent[100],
                            dotsColor: Color(0xFF333A47),
                            locale: 'en_ISO',
                          ),
                          SizedBox(
                            height: 20.0,
                          ),

                          SingleChildScrollView(
                            child: Container(
                              child: SizedBox(
                                height: 60.h,
                                child: Obx(() {
                                  return controller.centers.length > 0
                                      ? Obx(() {
                                    return ListView
                                        .builder(
                                      itemCount: controller.centers.length,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      // physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: AppColors.appThemeColor,
                                                ),
                                                Obx(() {
                                                  return Text(
                                                    controller.centers.value[index]
                                                        .name,
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .appThemeColor,
                                                        fontSize: 18.sp,
                                                        fontWeight: FontWeight
                                                            .w700),
                                                  );
                                                }),
                                              ],
                                            ),
                                            ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(),
                                                itemCount: controller
                                                    .centers[index]
                                                    .timeSlots
                                                    .length,
                                                itemBuilder: (context,
                                                    slotIndex) {
                                                  return SingleTrainerSlot(
                                  
                                  
                                                    slotTiming: controller
                                                          .centers[index]
                                                          .timeSlots[slotIndex],
                                                      locationStatus:controller
                                                          .centers[index]
                                                          .status![slotIndex],
                                                  );
                                                })
                                          ],
                                        );
                                      },
                                    );
                                  })
                                      : Center(child: Text(
                                      "No Centers are allocated for selected Date"));
                                }),
                              ),
                            ),
                          )

                          /*SingleTrainerSlot(
                                          slotTiming: "8:00 - 9:00",
                                          locationStatus: "Arrived",
                                        ),
                                        SingleTrainerSlot(
                                          slotTiming: "10:00 - 12:00",
                                          locationStatus: "Awaiting Arrival",
                                        ),*/
                        ],
                      ))),
            ],
          ),
        ));
  }


}

class SingleTrainerSlot extends StatelessWidget {

  TrainerDashboardController trainerDashboardController = Get.find<
      TrainerDashboardController>();



   final String locationStatus;
  final String slotTiming;

  SingleTrainerSlot(
       {super.key, required this.slotTiming, required this.locationStatus});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainerDashboardController>(
        builder: (trainerDashboardController) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Card(
                  elevation: 10.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: AppColors.slotCardBackground,
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                   slotTiming,
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.appThemeColor),
                                )

                            ),
                            SizedBox(width: 15.0),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                     locationStatus == "Arrived"
                          ? Icon(
                        Icons.location_on_sharp,
                        color: AppColors.greenStatusColor,
                      )
                          : Icon(
                        Icons.not_listed_location_outlined,
                        color: locationStatus=="Waiting"?AppColors.yellowStatusColor:AppColors.redStatusColor
                      ),
                       Text(
                          locationStatus,
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: locationStatus ==
                                  "Arrived"
                                  ? AppColors.greenStatusColor
                                  : locationStatus=="Waiting"?AppColors.yellowStatusColor:AppColors.redStatusColor),
                        )

                    ],
                  ))
            ],
          );
        });
  }
}
