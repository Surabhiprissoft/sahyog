import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/Screens/AddTrainee.dart';
import 'package:sahyog/Screens/AddTrainer.dart';
import 'package:sahyog/controller/ManageTraineeController.dart';
import 'package:sahyog/model/ResponseModel/TraineeListResponseModel.dart';
import 'package:sahyog/utils/app_colors.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';
import 'package:sahyog/widgets/DialogHelper.dart';

class ManageTrainee extends GetView<ManageTraineeController> {
   ManageTrainee({super.key});

   final manageTraineeController  = Get.find<ManageTraineeController>();


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        shape: CircleBorder(),
        backgroundColor: AppColors.appThemeColor,
        elevation: 10.0,
        onPressed: () {
          Get.to(() => AddTrainee());
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
                child: Obx(() {
                        if (manageTraineeController.traineeList.isEmpty) {
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
                            itemCount: controller.traineeList.length,
                            itemBuilder: (context, index) {
                              final trainee = controller.traineeList[index];
                              return ManageTraineeCardItem(trainee: trainee); // Pass individual trainer data
                            },
                          );
                        }
                      })

              )
          ),

        ],
      ),
    );
  }
}


/*
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
                        Text("Trainee  Name 1 "),
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
                    Text("Fess Paid", style: TextStyle(fontSize: 14.sp),)
                  ],
                )
              ],
            )

        )
    );
  }
}*/


class ManageTraineeCardItem extends StatelessWidget {
  final TraineeListResponseModel trainee;

  const ManageTraineeCardItem({
    Key? key,
    required this.trainee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  backgroundImage:trainee.profilePhoto != null && trainee.profilePhoto!.isNotEmpty
                      ? NetworkImage("http://192.168.0.117:8000${trainee.profilePhoto}") : NetworkImage("https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png"),
                  radius: 3.5.h,
                ),
                SizedBox(width: 2.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${trainee.firstName} ${trainee.lastName}"),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Icon(Icons.phone, size: 16.0),
                        Text(trainee.phone ?? "",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


