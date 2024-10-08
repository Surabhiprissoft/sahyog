import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/network/api_baseHelper.dart';
import 'package:sahyog/utils/app_colors.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

import '../../controller/dashboardController/TraineeDashboardController.dart';


class TraineeDashboard extends GetView<TraineeDashboardController> {
  TraineeDashboard({super.key});

  final controller = Get.find<TraineeDashboardController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool exit = await showExitDialog(context);
        return exit;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Top_bg.png'),
                        fit: BoxFit.cover, // Adjust the BoxFit as needed
                      ),
                      color: Colors.blue
                  ),
                  child:  Padding(
                    padding: EdgeInsets.only(left:6.w,bottom: 16.h,right: 6.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            "Dashboard",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            )
                        ),
                        IconButton(onPressed: (){
                          showLogoutDialog(context);
                        },
                            icon:Icon(Icons.logout,color: Colors.white,size: 25.0,)
                        ),

                      ],
                    ),
                  ),


                )
            ),
            Positioned(
                top: 80,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  // height: 100.h,
                    padding: EdgeInsets.only(top: 2.h),
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
                    child: Container(
                      margin: EdgeInsets.only(right: 15.0, left: 15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Obx(() {
                                    return Container(
                                      height: 25.h,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: controller.traineeProfile.value!=""
                                                ? NetworkImage(
                                                controller.traineeProfile.value)
                                                : NetworkImage(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNNLEL-qmmLeFR1nxJuepFOgPYfnwHR56vcw&s"),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(
                                            10), // Adjust the radius as needed
                                      ),
                                      //child: Image.asset("assets/images/user_img.png",fit: BoxFit.cover,),
                                    );
                                  }),
                                ),
                                SizedBox(width: 10.0,),
                                Expanded(
                                  flex: 5,
                                  child: Obx(() {
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(controller.fName.value + " " +
                                            controller.lName.value,
                                          style: TextStyle(fontSize: 20.sp),),
                                        SizedBox(height: 10.0,),
                                        Row(
                                          children: [
                                            controller.gender == "Male" ? Icon(
                                              Icons.cake_outlined,
                                              color: Colors.blue,) : Icon(
                                              Icons.cake_outlined,
                                              color: Colors.pink,),
                                            Text(" " + controller.dob.value),
                                          ],
                                        ),
                                        SizedBox(height: 5.0,),
                                        Row(
                                          children: [
                                            controller.gender == "Male"
                                                ? Icon(
                                              Icons.call, color: Colors.blue,)
                                                : Icon(
                                              Icons.call, color: Colors.pink,),
                                            Text(""+controller.phone.value),
                                          ],
                                        ),
                                        SizedBox(height: 5.0,),
                                        Row(
                                          children: [
                                            controller.gender == "Male"
                                                ? Icon(
                                              Icons.mail, color: Colors.blue,)
                                                : Icon(
                                              Icons.mail, color: Colors.pink,),
                                            Flexible(
                                              child: Text(
                                                " " + controller.email.value,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.0,),
                                        Row(
                                          children: [
                                            controller.gender == "Male" ? Icon(
                                              Icons.location_on_outlined,
                                              color: Colors.blue,) : Icon(
                                              Icons.location_on_outlined,
                                              color: Colors.pink,),
                                            Flexible(
                                              child: Text(
                                                " " + controller.address.value,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.0,),
                                        Row(
                                          children: [
                                            controller.gender == "Male" ? Icon(
                                              Icons.workspace_premium_outlined,
                                              color: Colors.blue,) : Icon(
                                              Icons.workspace_premium_outlined,
                                              color: Colors.pink,),
                                            Text(" " +
                                                controller.trainingType.value)
                                          ],
                                        ),
                                      ],
                                    );
                                  }),
                                )
                              ],
                            ),
                            SizedBox(height: 20.0,),
                            Text("Center Details", style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w600),),
                            Card(
                              elevation: 10.0,
                              surfaceTintColor: Colors.white,
                              child: Container(
                                margin: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/map-marker-outline.png",
                                      height: 70.0,),
                                    SizedBox(width: 20.0,),
                                    Container(
                                      height: 80,
                                      child: Obx(() {
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(controller.centerName.value,
                                                style: TextStyle(fontSize: 18.sp,
                                                    color: AppColors
                                                        .appThemeColor,
                                                    fontWeight: FontWeight.w700)),

                                            Text(
                                                controller.centerAddress.value,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: TextStyle(fontSize: 13.sp,
                                                    fontWeight: FontWeight
                                                        .w700)),
                                          ],
                                        );
                                      }),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            Text("Trainer Details", style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w600),),
                            Container(
                              height: 200.0,
                              child: Obx(() {
                                if (controller.assignedTrainers.isEmpty) {
                                  return Center(
                                    child: SizedBox(
                                      child: Text(
                                          "No trainer has been assign yet"),
                                    ),
                                  );
                                } else {
                                  return Container(

                                    child: ListView.builder(
                                      itemCount: controller.assignedTrainers
                                          .length,
                                      itemBuilder: (context, index) {
                                        final trainer = controller
                                            .assignedTrainers[index];
                                        return Card(
                                          elevation: 10.0,
                                          surfaceTintColor: Colors.white,
                                          color: Colors.white,
                                          child: Container(
                                            padding: EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .start,
                                                  children: [
                                                    CircleAvatar(
                                                  backgroundImage: trainer
                                                      .profilePhoto != null &&
                                                      trainer.profilePhoto!
                                                          .isNotEmpty
                                                      ? NetworkImage(
                                                      ApiBaseHelper().imageBaseUrl+trainer.profilePhoto)
                                                      : NetworkImage(
                                                      "https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png"),
                                                  radius: 3.5.h,
                                                ),
                                                    SizedBox(width: 3.w),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text("${trainer
                                                            .firstname} ${trainer
                                                            .lastname}",
                                                          style: TextStyle(
                                                              fontSize: 14.sp),),
                                                        SizedBox(height: 1.h),
                                                        Row(
                                                          children: [
                                                            Icon(Icons.phone,
                                                                size: 16.0),
                                                            Text(
                                                              trainer.phone ?? "",
                                                              style: TextStyle(
                                                                  fontSize: 14
                                                                      .sp),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .end,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(Icons
                                                            .work_history_outlined,
                                                          size: 15.0,),
                                                        // Text("${trainer.}",style: TextStyle(fontSize: 15.sp)),
                                                      ],
                                                    ),
                                                    SizedBox(height: 7.0,),
                                                    Text(
                                                      "${controller.format12Hour
                                                          .format(
                                                          controller.format24Hour
                                                              .parse(trainer
                                                              .startTime!))} - ${controller
                                                          .format12Hour.format(
                                                          controller.format24Hour
                                                              .parse(
                                                              trainer
                                                                  .endTime!))}",
                                                      style: TextStyle(
                                                          fontSize: 13.sp),),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ); // Pass individual trainer data
                                      },
                                    ),
                                  );
                                }
                              }),
                            ),
                        
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Payment Status", style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),),
                                TextButton(onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Center(child: Text(
                                            "Payment History",
                                            style: TextStyle(fontSize: 18.sp),)),
                                          content: Container(
                                            width: double.maxFinite,
                                            height: 300,
                                            child: ListView.builder(
                                              itemCount: controller.feesStatus
                                                  .length,
                                              itemBuilder: (context, index) {
                                                final feeStatusByMonth = controller
                                                    .feesStatus[index];
                                                return Card(
                                                  elevation: 6.0,
                                                  margin: EdgeInsets.only(
                                                      bottom: 15.0),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(
                                                        6.0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Text(feeStatusByMonth
                                                            .month! + " " +
                                                            feeStatusByMonth.year
                                                                .toString(),
                                                          style: TextStyle(
                                                              fontWeight: FontWeight
                                                                  .w700),),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .all(6.0),
                                                          child: Row(
                                                            children: [
                                                              feeStatusByMonth
                                                                  .feesStatus!
                                                                  ? Icon(Icons
                                                                  .check_circle_outlined,
                                                                color: Colors
                                                                    .green,)
                                                                  : Icon(Icons
                                                                  .warning_amber,
                                                                color: Colors
                                                                    .red,),
                                                              SizedBox(
                                                                width: 8.0,),
                                                              Text(
                                                                feeStatusByMonth
                                                                    .feesStatus!
                                                                    ? "Fees Paid"
                                                                    : "Fees Due",
                                                                style: TextStyle(
                                                                    color: feeStatusByMonth
                                                                        .feesStatus!
                                                                        ? Colors
                                                                        .green
                                                                        : Colors
                                                                        .red),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                        
                        
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      }
                                  );
                                }, child: Text("Details", style: TextStyle(
                                  decoration: TextDecoration.underline,),))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Card(
                                      elevation: 10.0,
                                      surfaceTintColor: Colors.white,
                                      child: Obx(() {
                                        return Container(
                                          padding: EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              controller.feesStatus[controller
                                                  .feesStatus.length - 1]
                                                  .feesStatus!
                                                  ? Image.asset(
                                                "assets/images/payment_done.png",
                                                height: 50.0, width: 50.0,)
                                                  : Image.asset(
                                                  "assets/images/payment_due.png",
                                                  height: 50.0, width: 50.0),
                                              SizedBox(width: 20.0,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  controller.feesStatus[controller
                                                      .feesStatus.length - 1]
                                                      .feesStatus!
                                                      ? Text("Done",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight
                                                            .w700,
                                                        fontSize: 17.sp),)
                                                      : Text("Pending",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight
                                                            .w700,
                                                        fontSize: 17.sp),),
                        
                                                  Text("for 1 ${controller
                                                      .feesStatus[controller
                                                      .feesStatus.length - 1]
                                                      .month!} ${controller
                                                      .feesStatus[controller
                                                      .feesStatus.length - 1]
                                                      .year!}")
                        
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                                    SizedBox(width: 1.w),
                                    Card(
                                      surfaceTintColor: Colors.white,
                                      elevation: 10.0,
                                      child: Container(
                                        margin: EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text("Payment Due", style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15.sp),),
                        
                                            Obx(() {
                                              return Text(
                                                controller.dueCount.value
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16.sp),);
                                            })
                        
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                        
                        
                          ],
                        ),
                      ),
                    )
                )
            ),

          ],
        ),
      ),
    );
  }
}
