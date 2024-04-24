import 'dart:async';

import 'package:background_locator_2/background_locator.dart';
import 'package:background_locator_2/location_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sahyog/controller/LocationController.dart';
import 'package:sahyog/model/BaseSingleObjectResponse.dart';
import 'package:sahyog/model/Centers.dart';
import 'package:sahyog/model/GeoLocation.dart';
import 'package:sahyog/model/RequestModel/UpdateAttendanceRequestModel.dart';
import 'package:sahyog/model/ResponseModel/TrainerDashboardResponseModel.dart';
import 'package:sahyog/model/ResponseModel/UpdateAttendanceResponseModel.dart';
import 'package:sahyog/network/api_baseHelper.dart';
import 'package:sahyog/network/user_repository.dart';
import 'package:sahyog/utils/LocationHandler.dart';
import 'package:sahyog/utils/app_constants.dart';
import 'package:sahyog/widgets/other_common_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/preference_utils.dart';

class TrainerDashboardController extends GetxController  {
  late var count;
  RxString name = "Hello".obs;
  RxBool switchValue = false.obs;
  RxString SelectedDate = ''.obs;
  RxString profilePhoto="".obs;
  RxString trainerName = "".obs;
  final UserRepository userRepository;
  late SingleResponse<TrainerDashboardResponseModel>
      trainerdashboardResponseModel;
  List<Schedule> myList = <Schedule>[];
  late RxList<CenterModel> centers = <CenterModel>[].obs;
  late RxList<GeoLocation> geolocationlist = <GeoLocation>[].obs;

  TrainerDashboardController(this.userRepository);

  RxInt counter = 0.obs;
  RxString TESTDATA = "test".obs;
  RxString STATUSOFCENTER = "".obs;
  Timer? timer;
  DateTime toleranceDatetime = DateTime.now();
  late String newStartTime;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    print("IT is also calling");
    count = 1;
    requestPermission();

  }


  Future<SingleResponse<TrainerDashboardResponseModel>> getTrainerDashboardData(
      DateTime dateTime) async
  {
    update();
    PreferenceUtils.reload();
    counter.value=PreferenceUtils.getInt(AppConstants.COUNTER_VALUE);
    var newFormat = DateFormat("yyyy-MM-dd");
    var selectedDate = newFormat.format(dateTime);
    print(selectedDate);
    trainerdashboardResponseModel =
        await userRepository.getTrainerDashboardData(
            PreferenceUtils.getInt(AppConstants.USERID), selectedDate);
    print(trainerdashboardResponseModel.data.toString());
    DateFormat format12Hour = DateFormat("h:mm a");
    if (trainerdashboardResponseModel.status == 200) {

      centers.clear();
      trainerName.value = trainerdashboardResponseModel.data.firstName!+" "+trainerdashboardResponseModel.data.lastName!;
      if(trainerdashboardResponseModel.data.profilePhoto!=null){
        profilePhoto.value = trainerdashboardResponseModel.data.profilePhoto!;
      }
      myList = trainerdashboardResponseModel.data.schedule!;
      if (myList.length > 0) {
        for (var data in myList) {
          DateFormat format24Hour = DateFormat("HH:mm:ss");

          // for status---//

          DateFormat formatter = DateFormat('h:mm a');
          PreferenceUtils.setInt(AppConstants.SERVER_COUNT_VALUE,data.totalApi!.toInt());
          PreferenceUtils.setInt(AppConstants.SEARVER_INTERVAL_TIME,data.interval!.toInt());

          // Format the current time using the formatter
          String formattedTime = formatter.format(DateTime.now());
          DateTime formattedTimeDt = formatter.parse(formattedTime);
          DateTime startTimeDt = DateFormat('h:mm a').parse(format12Hour.format(format24Hour.parse(data.startTimme!)));


          int comparison = startTimeDt.compareTo(formattedTimeDt);

          print("STARTTIME!!"+data.startTimme.toString());
          var centerId = data.ctId;
          var centerName = data.center;
          STATUSOFCENTER.value=data.isPresent == null ?comparison>0 ?"no idea":"Absent": data.isPresent!.toString()+"${PreferenceUtils.getInt(AppConstants.COUNTER_VALUE)}";
          var startTime = format24Hour.parse(data.startTimme!);
          var endTime = format24Hour.parse(data!.endTime!);

          // Check if the center already exists in the centers list
          var existingCenterIndex =
              centers.indexWhere((center) => center.name == centerName);

          print("STATUS_CENTER"+existingCenterIndex.toString());
          // If the center doesn't exist, add it to the list
          if (existingCenterIndex == -1) {
            /*centers.add(CenterModel(
                [centerId!.toInt()],
                centerName!,
                [
                  '${format12Hour.format(startTime)} - ${format12Hour.format(endTime)}'
                ],
                status:status));*/

            centers.add(CenterModel(
                [centerId!.toInt()],
                centerName!,
                [
                  '${format12Hour.format(startTime)} - ${format12Hour.format(endTime)}'
                ],
                status:STATUSOFCENTER.value));

          } else {

            // If the center exists, check if the time slot is already added
            var existingCenter = centers[existingCenterIndex];
            if (!existingCenter.timeSlots.contains(
                '${format12Hour.format(startTime)} - ${format12Hour.format(endTime)}')) {
              existingCenter.timeSlots.add(
                  '${format12Hour.format(startTime)} - ${format12Hour.format(endTime)}');
              existingCenter.centerId.add(centerId!.toInt());
            }
          }
        }
        update();
        print("MY CENTERS"+centers.toString());
        centers.sort(sortByStartTime);
        centers.refresh();
        update();
        //centers.value=centers;
        centers.forEach((center) => print(center.name));

        PreferenceUtils.removekey("CENTERS");
        await PreferenceUtils.setCenterList("CENTERS", centers);

        if( PreferenceUtils.getInt(AppConstants.COUNTER_VALUE) == 0 )
          {
            sendGeoLocations();
          }
        else
          {
            print("${PreferenceUtils.getInt(AppConstants.COUNTER_VALUE)}CAN NOT UPDATE THE LIST AS SERVICE IS ALREADY RUNNING IN THE BACKGROUND");
          }

      }

    }
    else {
      showSnackBar(
          "Something went wrong", "Unable to fetch Center list at the moment");
    }
    update();
    return trainerdashboardResponseModel;
  }

  // Custom comparator function
  int sortByStartTime(CenterModel a, CenterModel b) {
    // Get the start time of the first time slot for each center
    DateTime startTimeA =
        DateFormat('hh:mm a').parse(a.timeSlots[0].split(' - ')[0]);
    DateTime startTimeB =
        DateFormat('hh:mm a').parse(b.timeSlots[0].split(' - ')[0]);

    // Compare the start times
    return startTimeA.compareTo(startTimeB);
  }

  Future<void> sendGeoLocations() async {
    DateTime now = DateTime.now();

    // Create a DateFormat object with the desired format
    DateFormat formatter = DateFormat('h:mm a');

    // Format the current time using the formatter
    String formattedTime = formatter.format(now);
    print("formatted time" + formattedTime);

// -----Start of Working Logic------------------
    List<Map<String, String>> statusList = [];
    geolocationlist.clear();
    //print(statusList.toString());
    centers.forEach((center) {
      for (String timeSlot in center.timeSlots) {
        // Split the time slot into start and end times
        List<String> times = timeSlot.split(" - ");

        // Extract the start time
        String startTime = times[0]
            .trim(); // Remove leading/trailing spaces

        print("START TIME" + startTime);
        DateTime formattedTimeDt = formatter.parse(formattedTime);
        DateTime startTimeDt = DateFormat('h:mm a').parse(startTime);

// Compare formattedTimeDt with startTimeDt
        int comparison = startTimeDt.compareTo(formattedTimeDt);
        Duration timeDifference = startTimeDt.difference(formattedTimeDt);
// Check the comparison result
        if (comparison >= 0)
        {
          print("after__11"+timeDifference.toString());

          if (timeDifference.inMinutes > 5)
          {
            toleranceDatetime = startTimeDt.subtract(Duration(minutes: 5));
            newStartTime = formatter.format(toleranceDatetime);
            geolocationlist.add(GeoLocation(
                center.status!, center.centerId[0], newStartTime,
                toleranceDatetime));
            update();
          }

          else {
            /* statusList.add({
            'Time': formatter.format(startTimeDt),
            'status': "after"
          });*/

            geolocationlist.add(
                GeoLocation(
                    center.status!, center.centerId[0], formattedTime,
                    formattedTimeDt));
            update();
          }
          // statusList.add({'center_name': center.name, 'status': "after"});
        } else {
          print("before");
          // statusList.add({'center_name': center.name, 'status': "before"});
        }
        print(startTime);
      }
    });


    print("GEOLOCATIONS-->>" + geolocationlist.toString());
    print("GEOLOCATIONLIST" + geolocationlist.length.toString());
    print("GEOLOCATIONS{FETCHED" + geolocationlist.toString());
    if (geolocationlist.length != 0)
    {
      await PreferenceUtils.removekey(
          'geoLocations').then((value) async =>
      {
        await PreferenceUtils.setCustomGeoLocationList(
            'geoLocations', geolocationlist),

      }); // PreferenceUtils.setCustomList('geoLocations', geolocationlist,(item) => item.toMap());


      //var controller = Get.find<LocationController>();
      if (await BackgroundLocator.isServiceRunning())
      {

        Get.delete<LocationController>();
        var controller = Get.put(LocationController());
        controller.initPlatformState();
         await controller.startLocationService();
      }
      else
        {
          var controller = Get.put(LocationController());
          await controller.initPlatformState().then((value) async =>
          {
            await controller.startLocationService()
          });
        }

      }
    else {


      print("BACKGROUND"+await BackgroundLocator.isServiceRunning().toString());
      if (await BackgroundLocator.isServiceRunning()) {
        await BackgroundLocator.unRegisterLocationUpdate().then((value) =>
        {

          print("IT IS UPDATED..AS THERE ARE NO GEO LOCATIONS RIGHT NOW")
        });
      }
    }
  }
  Future<void> needtoRebuild(RxList<CenterModel> receivedcenters) async
  {


    int i= await PreferenceUtils.getInt(AppConstants.COUNTER_VALUE);

      Timer.periodic(Duration(seconds: 5), (timer) async {
        i++;
        TESTDATA.value="AD $i";
        update();
    });
    PreferenceUtils.reload();
    print("DATA-CENTERS"+receivedcenters.toString());
    print("AD ${PreferenceUtils.getInt(AppConstants.COUNTER_VALUE)}");
    update();
  }
  void handleLocationUpdate(
      double latitude, double longitude, int count) async
  {

    print("VALUE OF COUNT==>>" + count.toString());

    List<GeoLocation> retrievedListGeoLocations =
    await PreferenceUtils.getCustomGeoList("geoLocations");

    /*List<CenterModel> retrievedCenters =
    await PreferenceUtils.getCenterList("CENTERS");*/

    //centers.value = await PreferenceUtils.getCenterList("CENTERS");



 /*   int? matchingIndex;
    for (int index = 0; index < centers.length; index++) {
      if (centers[index].centerId.contains(
          retrievedListGeoLocations[0].centerId)) {
        matchingIndex = index;
        break;
      }
    }
    print("MATCHING INDEX" + matchingIndex.toString());*/


    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('h:mm a');
    String formattedTime = formatter.format(now);
    String? storedDate =
    formatter.format(retrievedListGeoLocations[0].dateTime);

    print("Stored DATE" + storedDate);
  //  print("Stored DATE-STATUS" + retrievedCenters[0].status.toString());


    if (formattedTime == storedDate) {
      if (count > 4) {
        count = count + 1;
        PreferenceUtils.removekey(AppConstants.COUNTER_VALUE);
        PreferenceUtils.setInt(AppConstants.COUNTER_VALUE, count);
        update();
        GeoLocation location = retrievedListGeoLocations[0];
        retrievedListGeoLocations.clear();
        GeoLocation geoLocation = GeoLocation(
            location.attendancestatus, location.centerId,
            location.timeSlot,
            location.dateTime.add(Duration(minutes:10)));
        //
        retrievedListGeoLocations.add(geoLocation);
        await PreferenceUtils.setCustomGeoLocationList(
            "geoLocations", retrievedListGeoLocations);
        UpdateAttendanceRequestModel updateAttendanceRequestModel = UpdateAttendanceRequestModel(
            lat: latitude,
            lon: longitude,
            userId: PreferenceUtils.getInt(AppConstants.USERID),
            ctId: location.centerId);
        await updateAttendance(updateAttendanceRequestModel);
      }


      else {
        count = count + 1;
        PreferenceUtils.removekey(AppConstants.COUNTER_VALUE);
         PreferenceUtils.setInt(AppConstants.COUNTER_VALUE, count);
         update();

        GeoLocation location = retrievedListGeoLocations[0];
        retrievedListGeoLocations.clear();
        GeoLocation geoLocation = GeoLocation(
            location.attendancestatus, location.centerId, location.timeSlot,
            location.dateTime.add(Duration(minutes: PreferenceUtils.getInt(AppConstants.SEARVER_INTERVAL_TIME))));
        //
        retrievedListGeoLocations.add(geoLocation);
        await PreferenceUtils.setCustomGeoLocationList(
            "geoLocations", retrievedListGeoLocations);
        print("NEW LOCATION" + retrievedListGeoLocations.toString());
        UpdateAttendanceRequestModel updateAttendanceRequestModel = UpdateAttendanceRequestModel(
            lat: latitude,
            lon: longitude,
            userId: PreferenceUtils.getInt(AppConstants.USERID),
            ctId: location.centerId);
        await updateAttendance(updateAttendanceRequestModel);
      }
    }

    else {
      print("NOT YET MATCHED..PLEASE WAIT");
    }
  }

  Future<void> updateAttendance(UpdateAttendanceRequestModel updateAttendanceRequestModel) async
  {


    print("UPDATED ATTENDANCE");
    UpdateAttendanceResponseModel updateAttendanceResponseModel=await userRepository.updateAttendance(updateAttendanceRequestModel);

    if(updateAttendanceResponseModel.status==200)
    {

      if(PreferenceUtils.getInt(AppConstants.COUNTER_VALUE)==PreferenceUtils.getInt(AppConstants.SERVER_COUNT_VALUE))
        {
          PreferenceUtils.removekey(AppConstants.COUNTER_VALUE);
           PreferenceUtils.setInt(AppConstants.COUNTER_VALUE, 0);
           update();

           await BackgroundLocator.unRegisterLocationUpdate();
        }


      await getTrainerDashboardData(DateTime.now());
      update();

    }
    else
    {
       print("SOMETHING WENT WRONG !");
    }
  }

  Future<Permission> requestPermission() async {
    final permission = Permission.location;

    if (await permission.isDenied) {
      final result = await permission.request();

      if (result.isGranted) {
        // Permission is granted
        await getTrainerDashboardData(DateTime.now());
      } else if (result.isDenied) {
        // Permission is denied
      } else if (result.isPermanentlyDenied) {
        // Permission is permanently denied
      }
    }
    if(await permission.isGranted)
    {
      getTrainerDashboardData(DateTime.now());
    }
    return permission;
  }

}

