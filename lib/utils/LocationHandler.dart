import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:background_locator_2/location_dto.dart';
import 'package:flutter/services.dart';
import 'package:sahyog/controller/LocationController.dart';



@pragma('vm:entry-point')
class LocationCallbackHandler {
  @pragma('vm:entry-point')
  static const String _isolateName = "LocatorIsolate";
  static void callback(LocationDto locationDto) async {

    //final isolate = IsolateNameServer.lookupPortByName(_isolateName);
   /* SendPort? _sendPort ??= isolate;
    _sendPort?.send({
      'latitude': locationDto.latitude,
      'longitude': locationDto.longitude,
    });*/
    final SendPort? send = IsolateNameServer.lookupPortByName(_isolateName);
    send?.send({'latitude': locationDto.latitude,
      'longitude': locationDto.longitude});
    LocationController().handleLocationUpdate(locationDto.latitude, locationDto.longitude);
  }

//Optional
  @pragma('vm:entry-point')
  static void initCallback(dynamic _) {
    print('Plugin initialization');
  }

//Optional
  @pragma('vm:entry-point')
  static void notificationCallback() {
    print('User clicked on the notification');
  }
}
/*
class LocationChannel {


  static void initialize() {
    const MethodChannel _channel = MethodChannel('location_channel');
    print("CHANNEL NAME"+_channel.name);
    _channel.setMethodCallHandler((call) async
        {
          print("call methodd");
          if (call.method == 'onLocationUpdate')
          {
            final double latitude = call.arguments['latitude'];
            final double longitude = call.arguments['longitude'];
            // Handle location update in your controller
            LocationController().handleLocationUpdate(latitude, longitude);
          }
          return call.arguments;
        });

    */
/*_channel.setMethodCallHandler((call)
    {
      print("Call Method"+call.method);
      if (call.method == 'onLocationUpdate') {
        final double latitude = call.arguments['latitude'];
        final double longitude = call.arguments['longitude'];
        // Handle location update in your controller
        LocationController().handleLocationUpdate(latitude, longitude);
      }
    });*//*

  }
}*/
