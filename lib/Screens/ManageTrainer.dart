import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/Screens/AddTrainer.dart';
import 'package:sahyog/controller/ManageTrainerController.dart';
import 'package:sahyog/utils/app_colors.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';


class ManageTrainer extends GetView<ManageTrainerController> {
  ManageTrainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white,),
        shape: CircleBorder(),
        backgroundColor: AppColors.appThemeColor,
        elevation: 10.0,
        onPressed: (){
          Get.to(AddTrainer());
        },
      ),
      body: Stack(
        children: [
          CustomTopBar(titleName: "Manage Trainer"),
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
                child: Text("")
              )
          ),
          Positioned(
              top: 85, // Adjust this value to control the position of the card
              left: 16,
              right: 16,
              child: SizedBox(
                child: CustomSlidingSegmentedControl<int>(
                  initialValue: 2,
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
                    print(v);
                  },
                ),
              )
          )


        ],
      ),
    );
  }
}
