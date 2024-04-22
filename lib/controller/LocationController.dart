import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:background_locator_2/background_locator.dart';
import 'package:background_locator_2/location_dto.dart';
import 'package:background_locator_2/settings/android_settings.dart';
import 'package:background_locator_2/settings/ios_settings.dart';
import 'package:background_locator_2/settings/locator_settings.dart';
import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sahyog/utils/LocationHandler.dart';

class LocationController extends GetxController {


  var currentPosition = "".obs;
  int count=5;
  static const String _isolateName = "LocatorIsolate";
  ReceivePort port = ReceivePort();
  @override
  void onInit() {
    super.onInit();
    print("IT IS CALLED_LOCATION CONTROLLER");
    initPlatformState();

  }

  Future<void> initPlatformState() async {
    await BackgroundLocator.initialize();

  }

   // Timer.periodic(Duration(seconds: 3), (Timer t) => getLocation());


  Future<void> getLocation() async {
    {
      /*try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        double latitude = position.latitude;
        double longitude = position.longitude;
        print('Latitude: $latitude, Longitude: $longitude');
      } catch (e) {
        print('Error getting location: $e');
      }*/
    }
   
  }

  Future<void> startLocationService() async {
    // Configure the location options
    Map<String, dynamic> data = {'countInit': 1};
    await BackgroundLocator.registerLocationUpdate(

        //LocationCallbackHandler.callback,
      LocationCallbackHandler.callback,
        initCallback: LocationCallbackHandler.initCallback,
        initDataCallback: data,
        autoStop: false,
        iosSettings: IOSSettings(),
        androidSettings: AndroidSettings(
            accuracy: LocationAccuracy.HIGH,
            distanceFilter: 0,
            interval:30 ,
            androidNotificationSettings: AndroidNotificationSettings(
                notificationChannelName: 'Location tracking',
                notificationTitle: 'Start Location Tracking',
                notificationMsg: 'Track location in background',
                notificationBigMsg:
                'Background location is on to keep the app up-tp-date with your location. This is required for main features to work properly when the app is not running.',
                notificationIcon: '',
                notificationIconColor: Colors.grey,
                notificationTapCallback:
                LocationCallbackHandler.notificationCallback)));




  }

  @override
  void dispose() {
    super.dispose();
    BackgroundLocator.unRegisterLocationUpdate();
  }
}