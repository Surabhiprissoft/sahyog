import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/Screens/AddTrainer.dart';
import 'package:sahyog/controller/AddTrainerController.dart';
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
          Get.to(AddTrainer());
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
                      child: Text("")
                  )
              ),
              Positioned(
                  top: 85,
                  // Adjust this value to control the position of the card
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
                        if (v == 0) {

                          Get.snackbar("Hello", "1");
                        }
                        else {
                          Get.snackbar("Hello", "2");

                        }
                        print("POSITION" + v.toString());
                      },
                    ),
                  )
              ),

              Positioned(
                top: 140,
                left: 0,
                right: 0,
                child: Container(
                  height: 120,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child:
                  ManageTraineeCardItem()/* ListView.builder(
                    itemCount: 10,
                      itemBuilder: (context,index)
                  {
                      return ManageTraineeCardItem();

                  })*/
                ),
              ),

            ],

          );


        },
      ),
    );
  }
}

class ManageTraineeCardItem extends StatelessWidget {
  const ManageTraineeCardItem({
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
            height: 20.h,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(backgroundImage:AssetImage("assets/images/user_img.png"),radius: 3.5.h,),
                Padding(
                  padding:  EdgeInsets.only(left:2.w,right: 2.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      SizedBox(
                        width: 60.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Trainer Name 1 "),
                            Text("Center1")
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 60.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Trainer Name 1 "),
                            Text("Center1")
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            )
        )
    );
  }
}
