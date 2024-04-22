import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:background_locator_2/location_dto.dart';
import 'package:sahyog/controller/dashboardController/TrainerDashboardController.dart';
import 'package:sahyog/model/GeoLocation.dart';
import 'package:sahyog/network/api_baseHelper.dart';
import 'package:sahyog/network/user_repository.dart';
import 'package:sahyog/utils/app_constants.dart';
import 'package:sahyog/utils/preference_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationCallbackHandler {
  static const String _isolateName = "LocatorIsolate";
  static int _callbackCount = 0;
  static final int _maxCallbackCount = 20;
  static Timer? timer;
  static int count=0;

  static void callback(LocationDto locationDto) async {
    final SendPort? send = IsolateNameServer.lookupPortByName(_isolateName);
    send?.send({
      'latitude': locationDto.latitude,
      'longitude': locationDto.longitude,
    });

    await PreferenceUtils.init().then((value) async {
       count = await PreferenceUtils.getInt(AppConstants.COUNTER_VALUE) ?? 0;
      print("Count-Value: $count");
      List<GeoLocation> retrievedListGeoLocations = await PreferenceUtils
          .getCustomGeoList("geoLocations");
      print("GEOLOCATIONS" + retrievedListGeoLocations.length.toString());

    });
    TrainerDashboardController(UserRepository(ApiBaseHelper()))
        .handleLocationUpdate(
        locationDto.latitude, locationDto.longitude, count);

  }

  static void initCallback(dynamic _) {
    print('Pl;ugin initialization');
  }

  static void notificationCallback() {
    print('User clicked on the notification');
  }


}
