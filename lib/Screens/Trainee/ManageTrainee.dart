import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/model/ResponseModel/TraineeListResponseModel.dart';
import 'package:sahyog/network/api_baseHelper.dart';
import 'package:sahyog/utils/app_colors.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';
import 'package:sahyog/widgets/DialogHelper.dart';

import '../../controller/traineeController/ManageTraineeController.dart';
import '../Profile/TraineeProfile.dart';
import 'AddTrainee.dart';

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
                margin: EdgeInsets.zero,
                padding: EdgeInsets.only(top:6),
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
                             child: Text("No Trainee found"),
                           ),
                         );// Show loading indicator while data is being fetched
                        } else {
                          // Show the list view with data
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: controller.traineeList.length,
                            itemBuilder: (context, index) {
                              final trainee = controller.traineeList[index];
                              return InkWell(
                                onTap: (){
                                  Get.to(() => TraineeProfile(), arguments: trainee);
                                },
                                child: Container(
                                  width: 100.w,
                                  margin: EdgeInsets.only(left: 10.0,right: 10.0),
                                  child: Card(
                                    elevation: 10.0,
                                    surfaceTintColor: Colors.white,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 6,
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage:trainee.profilePhoto != null && trainee.profilePhoto!.isNotEmpty
                                                      ? NetworkImage(ApiBaseHelper().imageBaseUrl+trainee.profilePhoto.toString()) : NetworkImage("https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png"),
                                                  radius: 3.5.h,
                                                ),
                                                SizedBox(width: 2.w),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("${trainee.firstName} ${trainee.lastName}",overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 14.sp)),
                                                      SizedBox(height: 1.h),
                                                      Row(
                                                        children: [
                                                          Icon(Icons.phone, size: 14.0),
                                                          Text(" ${trainee.phone} ",
                                                            style: TextStyle(fontSize: 14.sp),
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
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(trainee.centerName.toString(),style: TextStyle(fontSize: 14.sp),overflow: TextOverflow.ellipsis,),
                                                SizedBox(height: 7.0,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    trainee.feesStatusFalseCount!>0 ? Icon(Icons.warning_amber_outlined,color: Colors.red,size: 14.0,) : Icon(Icons.check_circle_outlined,color: Colors.green,size: 16.0,),
                                                    Text((trainee.feesStatusFalseCount!>0) ? " Fee Due :${trainee.feesStatusFalseCount} months" : " Fees Paid",style: TextStyle(fontSize: 14.sp,color: trainee.feesStatusFalseCount!>0 ? Colors.red : Colors.green),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );  //ManageTraineeCardItem(trainee: trainee); // Pass individual trainer data
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


