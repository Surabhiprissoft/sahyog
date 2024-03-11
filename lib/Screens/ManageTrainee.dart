import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/Screens/AddTrainee.dart';
import 'package:sahyog/controller/ManageTraineeController.dart';
import 'package:sahyog/utils/app_colors.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';

class ManageTrainee extends GetView<ManageTraineeController> {
   ManageTrainee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        shape: CircleBorder(),
        backgroundColor: AppColors.appThemeColor,
        elevation: 10.0,
        onPressed: () {
          Get.to(AddTrainee());
        },
      ),

      body: Stack(
        children: [
          CustomTopBar(titleName: "Manage Trainee"),
          Positioned  (
              top: 100,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                // height: 100.h,
                padding: EdgeInsets.only(top: 2.h),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ManageTraineeCardItem();
                    })
              )
          ),

        ],
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

