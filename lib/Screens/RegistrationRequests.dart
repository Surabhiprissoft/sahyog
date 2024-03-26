import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/controller/RegistrationRequestsController.dart';

import '../utils/app_colors.dart';
import '../widgets/CustomTopBar.dart';

class RegistrationRequest extends StatelessWidget {
  RegistrationRequest({super.key});

  final registrationRequestsController = Get.find<RegistrationRequestsController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomTopBar(titleName: "Registration Request's"),
          Positioned(
              top: 160,
              // Adjust this value to control the position of the card
              left: 0,
              right: 0,
              bottom: 1,
              child: Obx(() {
                return Container(
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
                    child:
                    registrationRequestsController.slidingValue.value == 1 ?
                    Obx(() {
                      if (registrationRequestsController.unApprovedTrainerList.isEmpty) {
                        return Center(
                          child: SizedBox(
                            width: 40.0,
                            height: 40.0,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        // Show the list view with data
                        return ListView.builder(
                          itemCount: registrationRequestsController.unApprovedTrainerList.length,
                          itemBuilder: (context, index) {
                            final trainer = registrationRequestsController.unApprovedTrainerList[index];
                            return InkWell(
                              onTap: () {
                                //Get.to(() => TrainerProfile(), arguments: trainer);
                              },
                              child: Card(
                                elevation: 10.0,
                                surfaceTintColor: Colors.white,
                                color: Colors.white,
                                child: Container(
                                  width: 100.w,
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ExpansionTile(
                                        title:Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: trainer.profilePhoto != null && trainer.profilePhoto!.isNotEmpty
                                                ? NetworkImage("http://192.168.0.117:8000${trainer.profilePhoto}")
                                                : NetworkImage("https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png"),
                                            radius: 3.5.h,
                                          ),
                                          SizedBox(width: 2.w),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("${trainer.firstName} ${trainer.lastName}", style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),),
                                            ],
                                          ),
                                        ],
                                      ),
                                              ],
                                            ),
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(20.0),
                                            child: Column(
                                              children: [
                                                    Row(
                                                      children: [
                                                        Text("Year Of Experience :",style: TextStyle(fontWeight: FontWeight.w500),),
                                                        SizedBox(width: 5.0,),
                                                        Text(trainer.yearOfExperience.toString(), style: TextStyle(fontSize: 16.sp),),
                                                      ],
                                                    ),
                                                    SizedBox(height: 5.0,),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.phone, size: 16.0),
                                                        SizedBox(width: 8.0,),
                                                        Text(trainer.phone ?? "", style: TextStyle(fontSize: 16.sp),),
                                                      ],
                                                    ),
                                                    SizedBox(height: 5.0,),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.email_outlined, size: 16.0),
                                                        SizedBox(width: 5.0,),
                                                        Text(trainer.email ?? "", style: TextStyle(fontSize: 16.sp),),
                                                      ],
                                                ),
                                                    SizedBox(height: 20.0,),
                                                    Row(
                                                      children: [
                                                        Expanded(flex:4,child: OutlinedButton(onPressed: (){
                                                          registrationRequestsController.performActionOnRequest(false,trainer.id!.toInt());
                                                        }, child: Text("Reject",style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.thirdButtonColors),),)),
                                                        SizedBox(width: 5.0,),
                                                        Expanded(flex:6,child: OutlinedButton(onPressed: (){
                                                          registrationRequestsController.performActionOnRequest(true,trainer.id!.toInt());
                                                        }, child: Text("Approved",style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.appThemeColor),),))
                                                      ],
                                                ),

                                              ],
                                            ),
                                          ),

                                        ]
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    })
                        : Obx(() {
                      if (registrationRequestsController.traineeList.isEmpty) {
                        return Center(
                          child: SizedBox(
                            width: 40.0, // Adjust the width as needed
                            height: 40.0,
                            child: CircularProgressIndicator(),
                          ),
                        );// Show loading indicator while data is being fetched
                      } else {
                        // Show the list view with data
                        return ListView.builder(
                          itemCount: registrationRequestsController.traineeList.length,
                          itemBuilder: (context, index) {
                            final trainee = registrationRequestsController.traineeList[index];
                            return InkWell(
                              onTap: (){
                               // Get.to(() => TraineeProfile(), arguments: trainee);
                              },
                              child: Card(
                                elevation: 10.0,
                                surfaceTintColor: Colors.white,
                                color: Colors.white,
                                child: Container(
                                  width: 100.w,
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ExpansionTile(
                                          title: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              CircleAvatar(
                                                backgroundImage:trainee.profilePhoto != null && trainee.profilePhoto!.isNotEmpty
                                                    ? NetworkImage("http://192.168.0.117:8000${trainee.profilePhoto}") : NetworkImage("https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png"),
                                                radius: 3.5.h,
                                              ),
                                              SizedBox(width: 2.w),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("${trainee.firstName} ${trainee.lastName}",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(20.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("Applied Center :",style: TextStyle(fontWeight: FontWeight.w500),),
                                                    SizedBox(width: 5.0,),
                                                    Text(trainee.center.toString(), style: TextStyle(fontSize: 16.sp),),
                                                  ],
                                                ),
                                                SizedBox(height: 5.0,),
                                                Row(
                                                  children: [
                                                    Icon(Icons.phone, size: 16.0),
                                                    SizedBox(width: 5.0,),
                                                    Text(trainee.phone ?? "",
                                                      style: TextStyle(fontSize: 16.sp),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 5.0,),
                                                Row(
                                                  children: [
                                                    Icon(Icons.email_outlined, size: 16.0),
                                                    SizedBox(width: 5.0,),
                                                    Text(trainee.email ?? "",
                                                      style: TextStyle(fontSize: 16.sp),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 5.0,),
                                                Row(
                                                  children: [
                                                    Text("Address :",style: TextStyle(fontWeight: FontWeight.w500),),
                                                    SizedBox(width: 5.0,),
                                                    Text(trainee.address.toString(), style: TextStyle(fontSize: 16.sp),),
                                                  ],
                                                ),
                                                SizedBox(height: 20.0,),
                                                Row(
                                                  children: [
                                                    Expanded(flex:4,child: OutlinedButton(onPressed: (){
                                                      registrationRequestsController.performActionOnRequest(false,trainee.id!.toInt());
                                                    }, child: Text("Reject",style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.thirdButtonColors),),)),
                                                    SizedBox(width: 5.0,),
                                                    Expanded(flex:6,child: OutlinedButton(onPressed: (){
                                                        registrationRequestsController.performActionOnRequest(true, trainee.id!.toInt());
                                                    }, child: Text("Approved",style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.appThemeColor),),))
                                                  ],
                                                ),

                                              ],
                                            ),
                                          ),

                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );  //ManageTraineeCardItem(trainee: trainee); // Pass individual trainer data
                          },
                        );
                      }
                    })
                );
              })

          ),
          Positioned(
            top: 95,
            left: 16,
            right: 16,
            child: SizedBox(
              child: Obx(() {
                return CustomSlidingSegmentedControl<int>(
                  initialValue: registrationRequestsController.slidingValue.value,
                  children: const {
                    1: Text('Trainer Request'),
                    2: Text('Trainee Request'),
                  },
                  innerPadding: EdgeInsets.zero,
                  fixedWidth: 45.w,
                  decoration: BoxDecoration(
                    color: CupertinoColors.lightBackgroundGray,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  thumbDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      ),
                    ],
                  ),
                  onValueChanged: (v) {
                    registrationRequestsController.slidingValue.value = v;
                    print("POSITION" + registrationRequestsController.slidingValue.value
                        .toString());
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
