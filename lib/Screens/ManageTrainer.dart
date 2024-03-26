import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/Screens/AddTrainer.dart';
import 'package:sahyog/Screens/StickyCenters.dart';
import 'package:sahyog/Screens/TrainerProfile.dart';
import 'package:sahyog/controller/ManageTrainerController.dart';
import 'package:sahyog/utils/app_colors.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';

import '../model/ResponseModel/TrainerListResponseModel.dart';


class ManageTrainer extends GetView<ManageTrainerController> {
  ManageTrainer({super.key});

  final manageTrainerController = Get.find<ManageTrainerController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                        controller.slidingValue.value == 1 ?
                        TrainerList(manageTrainerController: manageTrainerController)
                            : StickyList()
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
                      children: const {
                        1: Text('Trainer List'),
                        2: Text('Schedule Trainer'),
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        shape: CircleBorder(),
        backgroundColor: AppColors.appThemeColor,
        elevation: 10.0,
        onPressed: () {
          /* var controller = Get.find<AddTrainerController>();
          controller.clearControllers();*/
          Get.to(() => AddTrainer());
        },
      ),
      body: Obx(() {
        if (manageTrainerController.trainerList.isEmpty) {
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
            itemCount: manageTrainerController.trainerList.length,
            itemBuilder: (context, index) {
              final trainer = manageTrainerController.trainerList[index];
              return InkWell(
                onTap: (){
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
                                  "http://192.168.0.117:8000${trainer
                                      .profilePhoto}")
                                  : NetworkImage(
                                  "https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png"),
                              radius: 3.5.h,
                            ),
                            SizedBox(width: 1.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start,
                              children: [
                                Text("${trainer
                                    .firstName} ${trainer
                                    .lastName}",style: TextStyle(fontSize: 15.sp),),
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
                          ],
                        ),
                        OutlinedButton(onPressed: () {
                          manageTrainerController.slidingValue
                              .value = 2;
                        }, child: Text("Assign"))
                      ],
                    ),
                  ),
                ),
              ); // Pass individual trainer data
            },
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
                        "http://192.168.0.117:8000${trainer.profilePhoto}")
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



