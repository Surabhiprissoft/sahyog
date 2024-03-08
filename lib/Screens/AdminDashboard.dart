
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/Screens/AddTrainee.dart';
import 'package:sahyog/Screens/AddTrainer.dart';
import 'package:sahyog/Screens/ManageTrainer.dart';
import 'package:sahyog/utils/app_colors.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

import '../widgets/AnimatedCount.dart';

class AdminDasboard extends StatelessWidget {
  AdminDasboard({super.key});
  var totalCenterCount = 1;
  final GlobalKey<FabCircularMenuPlusState> fabKey = GlobalKey();
  List<String> imagePaths =[
    'assets/images/trainer_qa.svg',
    'assets/images/trainer_qa.svg',
    'assets/images/trainer_qa.svg',
    'assets/images/trainer_qa.svg',
  ];
  List<String> quickAccessMenu =[
    'Schedule Trainer',
    'Add Trainer',
    'Add Trainee',
    'Add Center',
  ];// List of image paths

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      floatingActionButton: FabCircularMenuPlus(
        key: fabKey,
        fabOpenColor: Colors.white60,
        fabCloseColor: Colors.white,
        ringWidth: 75.0,
        ringDiameter: 320.0,
        animationDuration:  const Duration(milliseconds: 800),

        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_outlined)),
              Text("Account"),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(onPressed: (){Get.to(AddTrainee());}, icon: Icon(Icons.groups_outlined)),
              Text("Trainee"),
            ],
          ),
          GestureDetector(
            onTap: (){

            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(onPressed: ()
                {
                if (fabKey.currentState!.isOpen) {
                 fabKey.currentState?.close();
                } else {
                fabKey.currentState!.open();
                }
                Get.to(ManageTrainer());

                  }, icon: SvgPicture.asset("assets/images/trainer.svg")),
                Text("Trainer"),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(onPressed: (){}, icon: Icon(Icons.home_outlined)),
                Text("Home",style: TextStyle(fontSize:15.sp),),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 30.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Top _bg.png'),
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
                          "Hello, Admin",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          )
                      ),
                      IconButton(onPressed: (){

                      },
                          icon:Icon(Icons.notifications_none,color: Colors.white,size: 25.0,)
                      ),

                    ],
                  ),
                ),


              )
          ),
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          SubHeaderText(sub_header: "Total Centers "),
                          SubHeaderText(sub_header: "( $totalCenterCount )"),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Column(
                        children: [
                          Card(
                            elevation: 10.0,
                            child: Container(
                              width: 30.w,
                              height: 25.h,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 0.5* 25.h, // 70% of the parent's height
                                    child: Container( margin: EdgeInsets.only(top: 1.h),child: Center(child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        AnimatedNumber(targetNumber: 8765, duration: Duration(milliseconds: 2000)),
                                        Text("trainees")
                                      ],
                                    ))),
                                  ),
                                  SizedBox(
                                    height: 0.5 * 25.h, // 30% of the parent's height
                                    child: Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: const BoxDecoration(
                                        color: AppColors.blueRacket,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                        ),
                                      ),
                                      // color: Colors.lightBlueAccent,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(backgroundImage:AssetImage("assets/images/user_img.png"),radius: 3.5.h,),
                                            Text("Trainer"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ),
                          Text("Center 1",style: TextStyle(fontWeight: FontWeight.w600),),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SubHeaderText(sub_header: "Fees Status "),
                          TextButton(onPressed: (){}, child: Text("View",style: TextStyle(decoration: TextDecoration.underline,fontSize: 15.sp,fontWeight: FontWeight.w400),))
                        ],
                      ),
                      Card(
                      elevation: 10.0,
                      surfaceTintColor: Colors.white,
                      color: Colors.white,
                      child: Container(
                        width: 100.w,
                        height: 15.h,
                        margin: EdgeInsets.only(right: 10.w,left: 10.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NormalText(sub_header: "68%"),
                                NormalText(sub_header: "32%")
                              ],
                            ),
                            SizedBox(height: 5.0),
                            LinearProgressIndicator(
                              value: 0.6,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                              minHeight: 7.0,
                              borderRadius: BorderRadius.circular(10.0),
                              backgroundColor: Colors.redAccent,
                            ),
                            SizedBox(height: 5.0),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NormalText(sub_header: "Paid"),
                                NormalText(sub_header: "Due")
                              ],
                            ),
                          ],
                        )
                      )
                    ),
                      SizedBox(height: 12.0),
                      SubHeaderText(sub_header: "Quick Access"),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(imagePaths.length, (index) => _buildCard(imagePaths[index],quickAccessMenu[index])),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),

                    ],
                  ),
                ),
              )
          ),
          Positioned(
              top: 85, // Adjust this value to control the position of the card
              left: 16,
              right: 16,
              child: SizedBox(
                height: 16.h,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      elevation: 10.0,
                      surfaceTintColor: Colors.white,
                      child: Container(
                        width: 40.w,
                        height: 15.h,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 0.55 * 15.h, // 70% of the parent's height
                              child: Container( margin: EdgeInsets.only(top: 1.h),child: Center(child: AnimatedNumber(targetNumber: 8765, duration: Duration(milliseconds: 2000)))),
                            ),
                            SizedBox(
                              height: 0.438 * 15.h, // 30% of the parent's height
                              child: Container(
                                margin: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  color: AppColors.blueRacket,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                ),
                                // color: Colors.lightBlueAccent,
                                child: Center(
                                  child: Text(
                                    "Total Trainees",
                                    style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ),
                    Card(
                      elevation: 10.0,
                      surfaceTintColor: Colors.white,
                      child: Container(
                        width: 40.w,
                        height: 15.h,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 0.55 * 15.h, // 70% of the parent's height
                              child: Container( margin: EdgeInsets.only(top: 1.h),child: Center(child: AnimatedNumber(targetNumber: 26, duration: Duration(milliseconds: 2000)))),
                            ),
                            SizedBox(
                              height: 0.438 * 15.h, // 30% of the parent's height
                              child: Container(
                                margin: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  color: AppColors.redRacket,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                ),
                                // color: Colors.lightBlueAccent,
                                child: Center(
                                  child: Text(
                                    "Total Trainers",
                                    style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ),
                  ],
                ),
              )
          )

        ],
      ),

    );
  }
}

Widget _buildCard(String imagePath,String QuickAccessName) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(left: 2.w,right: 2.w),
        child: Card(
          surfaceTintColor: Colors.white,
          elevation: 5.0,
          child: Container(
              width: 22.w,
              height: 10.h,
              padding: EdgeInsets.all(15.0),
              child: SvgPicture.asset(imagePath)
          )
        ),
      ),
      Text(QuickAccessName,softWrap: false,)
    ],
  );
}

