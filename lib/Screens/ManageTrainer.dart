import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/Screens/AddTrainer.dart';
import 'package:sahyog/Screens/StickyCenters.dart';
import 'package:sahyog/controller/ManageTrainerController.dart';
import 'package:sahyog/utils/app_colors.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';


class ManageTrainer extends GetView<ManageTrainerController> {
  ManageTrainer({super.key});


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
                        controller.slidingValue.value == 1 ? ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return ManageTrainerCardItem();
                            }) : StickyList()
                    );
                  })

              ),
              Positioned(
                top: 85,
                left: 16,
                right: 16,
                child: SizedBox(
                  child: CustomSlidingSegmentedControl<int>(
                    initialValue: 1,
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
                  ),
                ),
              ),

            ],

          );
        },
      ),
    );
  }
}

class ManageTrainerCardItem extends StatelessWidget {
  const ManageTrainerCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10.0,
        surfaceTintColor: Colors.white,
        color: Colors.white,
        child: Container(
            width: 100.w,
            //height: 10.h,
            padding: EdgeInsets.all(10.0),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/user_img.png"),
                      radius: 3.5.h,),
                    SizedBox(width: 2.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Trainer Name 1 "),
                        SizedBox(height: 1.h,),
                        Row(
                          children: [
                            Icon(Icons.phone, size: 16.0,),
                            Text("+91 1234567890",
                              style: TextStyle(fontSize: 14.sp),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 16.0,),
                        Text("Center1"),
                      ],
                    ),
                    SizedBox(height: 1.h,),
                    Text("Slot 1(9am-10am)", style: TextStyle(fontSize: 14.sp),)
                  ],
                )
              ],
            )

        )
    );
  }
}
