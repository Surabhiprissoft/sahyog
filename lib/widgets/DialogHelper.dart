import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DialogHelper {
  // Show error dialog
  static void showErrorDialog({
    String title = 'Error',
    String? description = 'Something went wrong',
    String buttonText = 'Okay',
  }) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Get.textTheme.headline4,
              ),
              Text(
                description ?? '',
                style: Get.textTheme.headline6,
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: Text(buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Show toast


  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //CircularProgressIndicator(),
              Image.asset(
                'assets/images/Loading_Icon.gif',
                width: 60, // Set width as per your requirement
                height: 60, // Set height as per your requirement
              ),

              Text(message ?? 'Loading Please Wait...'),
            ],
          ),
        ),
      ),
    );
  }

  // Hide loading dialog
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}