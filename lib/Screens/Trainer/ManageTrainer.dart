import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/Screens/Profile/TrainerProfile.dart';
import 'package:sahyog/Screens/ScheduleTrainer.dart';
import 'package:sahyog/Screens/Trainer/AddTrainer.dart';
import 'package:sahyog/controller/trainerController/ManageTrainerController.dart';
import 'package:sahyog/model/ResponseModel/TrainerListResponseModel.dart';
import 'package:sahyog/network/api_baseHelper.dart';
import 'package:sahyog/utils/app_colors.dart';
import 'package:sahyog/utils/app_constants.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';




class ManageTrainer extends GetView<ManageTrainerController> {
  ManageTrainer({super.key});

  final manageTrainerController = Get.find<ManageTrainerController>();


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        floatingActionButton: manageTrainerController.slidingValue.value == 1
            ? FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white,),
          shape: CircleBorder(),
          backgroundColor: AppColors.appThemeColor,
          elevation: 10.0,
          onPressed: () {
            /* var controller = Get.find<AddTrainerController>();
          controller.clearControllers();*/
            Get.to(() => AddTrainer());
          },
        )
            : null,
        body: GetBuilder<ManageTrainerController>(
          assignId: true,
          builder: (controller) {
            /*  WidgetsBinding.instance.addPostFrameCallback((_)
          {
            Get.snackbar("Hello", "1");
          });*/

            return Stack(
              children: [
                CustomTopBar(titleName: "Manage Trainer"),
                Positioned(
                    top: 140,
                    // Adjust this value to control the position of the card
                    left: 0,
                    right: 0,
                    //bottom: 0,
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
                          controller.slidingValue.value == 1 ?
                          TrainerList(
                              manageTrainerController: manageTrainerController)
                              : ScheduleTrainer()
                      );
                    })

                ),
                Positioned(
                  top: 85,
                  left: 16,
                  right: 16,
                  child: SizedBox(
                    child: Obx(() {
                      return CustomSlidingSegmentedControl<int>(
                        initialValue: controller.slidingValue.value,
                        children:  {
                          1: Text('Trainer List',style: TextStyle(fontSize: 14.sp),),
                          2: Text('Schedule Trainer',style: TextStyle(fontSize: 14.sp),),
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
                          controller.slidingValue.value = v;
                          print("POSITION" + controller.slidingValue.value
                              .toString());
                        },
                      );
                    }),
                  ),
                ),

              ],

            );
          },
        ),
      );
    });
  }
}

class TrainerList extends StatelessWidget {
  const TrainerList({
    super.key,
    required this.manageTrainerController,
  });

  final ManageTrainerController manageTrainerController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Obx(() {
        if (manageTrainerController.trainerList.isEmpty) {
          return Center(
            child: SizedBox(
              child: Text("No Trainer found"),
            ),
          );
        } else {
          // Show the list view with data
          return Container(

            child: ListView.builder(

              padding: const EdgeInsets.only(bottom: 150.0),
              itemCount: manageTrainerController.trainerList.length,
              itemBuilder: (context, index) {
                final trainer = manageTrainerController.trainerList[index];
                return InkWell(
                  onTap: () {
                    Get.to(() => TrainerProfile(), arguments: trainer);
                  },
                  child: Card(
                    elevation: 10.0,
                    surfaceTintColor: Colors.white,
                    color: Colors.white,
                    child: Container(
                      width: 100.w,
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: trainer
                                      .profilePhoto != null &&
                                      trainer.profilePhoto!
                                          .isNotEmpty
                                      ? NetworkImage(
                                       ApiBaseHelper().imageBaseUrl+trainer.profilePhoto.toString())
                                      : NetworkImage(
                                      "https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png"),
                                  radius: 3.5.h,
                                ),
                                SizedBox(width: 1.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text("${trainer
                                          .firstName} ${trainer
                                          .lastName}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 14.sp),),
                                      SizedBox(height: 1.h),
                                      Row(
                                        children: [
                                          Icon(Icons.phone,
                                              size: 16.0),
                                          Text(trainer.phone ?? "",
                                            style: TextStyle(
                                                fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: trainer.schedule!.isEmpty ?
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.zero),
                                onPressed: () {
                                  manageTrainerController.slidingValue
                                      .value = 2;
                                },
                                child: Text(
                                  "Assign", style: TextStyle(fontSize: 14.sp),))
                                :

                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [

                                    trainer.schedule!.length>1 ?
                                    IconButton(onPressed: (){
                                      showDialog(
                                          context: context,
                                          builder: (
                                              BuildContext context) {
                                            return AlertDialog(
                                              surfaceTintColor: Colors.white,
                                              title: Center(
                                                  child: Text(
                                                    "Assigned Center's",
                                                    style: TextStyle(
                                                        fontSize: 18
                                                            .sp),)),
                                              content: Container(
                                                width: double
                                                    .maxFinite,
                                                height: 300,
                                                child: ListView
                                                    .builder(
                                                  itemCount: trainer.schedule!.length,
                                                  itemBuilder: (
                                                      context,
                                                      index) {
                                                    return Card(
                                                      surfaceTintColor: Colors.white,
                                                      elevation: 6.0,
                                                      margin: EdgeInsets
                                                          .only(
                                                          bottom: 15.0),
                                                      child: Padding(
                                                        padding: const EdgeInsets
                                                            .all(
                                                            15.0),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(width: 10.0,),
                                                            Text(trainer.schedule![index].center!),
                                                            Text("${manageTrainerController.format12Hour.format(manageTrainerController.format24Hour.parse(trainer.schedule![index].startTimme!))} - ${manageTrainerController.format12Hour.format(manageTrainerController.format24Hour.parse(trainer.schedule![index].endTime!))}"),
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
                                    },icon: Icon(Icons.multiple_stop, size: 15.0,)):
                                        Icon(null),

                                    Icon(Icons.location_on_outlined, size: 15.0,),
                                    Flexible(
                                      child: Text("${trainer.schedule![0].center}",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 14.sp)),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 7.0,),
                                Text(
                                  "${manageTrainerController.format12Hour.format(
                                      manageTrainerController.format24Hour.parse(
                                          trainer.schedule![0]
                                              .startTimme!))} - ${manageTrainerController
                                      .format12Hour.format(
                                      manageTrainerController.format24Hour.parse(
                                          trainer.schedule![0].endTime!))}",
                                  style: TextStyle(fontSize: 14.sp),),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ); // Pass individual trainer data
              },
            ),
          );
        }
      }),
    );
  }
}


class ManageTrainerCardItem extends StatelessWidget {
  final TrainerListResponseModel trainer;

  const ManageTrainerCardItem({
    Key? key,
    required this.trainer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manageTrainerController = Get.find<ManageTrainerController>();

    return
      Card(
        elevation: 10.0,
        surfaceTintColor: Colors.white,
        color: Colors.white,
        child: Container(
          width: 100.w,
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: trainer.profilePhoto != null &&
                        trainer.profilePhoto!.isNotEmpty
                        ? NetworkImage(
                        ApiBaseHelper().imageBaseUrl +
                            trainer.profilePhoto.toString())
                        : NetworkImage(
                        "https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png"),
                    radius: 3.5.h,
                  ),
                  SizedBox(width: 2.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${trainer.firstName} ${trainer.lastName}"),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          Icon(Icons.phone, size: 16.0),
                          Text(trainer.phone ?? "",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              OutlinedButton(onPressed: () {
                manageTrainerController.slidingValue.value = 2;
              }, child: Text("Assign"))
            ],
          ),
        ),
      );
  }
}



