import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

class TraineeDashboard extends GetView<TraineeDashboard> {
  const TraineeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {

        bool exit = await showExitDialog(context);
        return exit;
      },
      child: Scaffold(
        body: Stack(
          children: [
            CustomTopBar(titleName: "Welcome Back, Trainee"),
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
                    child: Text("")
                )
            ),

          ],
        ),
      ),
    );
  }
}
