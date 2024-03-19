import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TraineeProfile extends StatelessWidget {
  const TraineeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 30.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Top_bg.png'),
                      fit: BoxFit.cover, // Adjust the BoxFit as needed
                    ),
                    color: Colors.blue
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 6.w, bottom: 16.h, right: 6.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          "Trainer Profile",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          )
                      ),
                      IconButton(onPressed: () {
                        /*if (trainerProfileController.isReadOnly.value) {
                      trainerProfileController.isReadOnly.value = false;
                      trainerProfileController.update();
                    } else {
                      trainerProfileController.isReadOnly.value = true;
                      trainerProfileController.update();
                    }*/
                      },
                          icon: Icon(
                            Icons.edit, color: Colors.white, size: 25.0,)
                      ),
                      IconButton(onPressed: () {

                      },
                          icon: Icon(
                            Icons.notifications_none, color: Colors.white,
                            size: 25.0,)
                      ),

                    ],
                  ),
                ),


              )
          ),
          Positioned(
              top: 80,
              // Adjust this value to control the position of the card
              left: 16,
              right: 50.w,
              child: SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: CircleAvatar(
                    radius: 70,
                   /* backgroundImage: trainerProfileController.imagePath !=
                        null &&
                        trainerProfileController.imagePath!.isNotEmpty
                        ? NetworkImage(
                        "http://192.168.0.117:8000${trainerProfileController
                            .imagePath}")
                        : NetworkImage(
                        "https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png"),*/
                  )

              )
          )

        ],
      )

    );
  }
}
