import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTopBar extends StatelessWidget {
  final String titleName;
  const CustomTopBar({
    super.key, required this.titleName,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 30.h,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Top_bg.png'),
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
                    titleName,
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
    );
  }
}
