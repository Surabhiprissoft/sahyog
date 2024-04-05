import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sahyog/controller/LocationController.dart';

class LocationDemo extends StatelessWidget {

   LocationDemo({super.key});

   var _controller=Get.find<LocationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Background Location Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() {
              return Text(
                'Current Location:\n${_controller.currentPosition.value ?? "Fetching..."}',
                textAlign: TextAlign.center,
              );
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _controller.startLocationService,
              child: Text('Start Background Location'),
            ),
          ],
        ),
      ),
    );
  }
  }

