import 'dart:async';

import 'package:background_locator_2/background_locator.dart';
import 'package:background_locator_2/location_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
//import 'package:permission_handler/permission_handler.dart';
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
  DateTime SelectedDateTime = DateTime.now();
  RxString trainerName = ''.obs;
  RxString profilePhoto = ''.obs;
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
    PreferenceUtils.setInt(AppConstants.FETCH_COUNTER_VALUE, 30);
    count = 1;
    //requestPermission();

  }


  Future<SingleResponse<TrainerDashboardResponseModel>> getTrainerDashboardData(
      DateTime dateTime) async
  {
    SelectedDateTime=dateTime;
    update();
    PreferenceUtils.reload();

    print("GET STRING"+PreferenceUtils.getInt(AppConstants.FETCH_COUNTER_VALUE).toString());
    var newFormat = DateFormat("yyyy-MM-dd");
     SelectedDate.value = newFormat.format(dateTime);
    print("SELECTED DATE"+SelectedDate.value);
    print("SELECTED DATE"+newFormat.format(DateTime.now()));

    trainerdashboardResponseModel =
        await userRepository.getTrainerDashboardData(
            PreferenceUtils.getInt(AppConstants.USERID), SelectedDate.value);
    print(trainerdashboardResponseModel.data.toString());
    DateFormat format12Hour = DateFormat("h:mm a");
    if (trainerdashboardResponseModel.status == 200) {

      centers.clear();

      trainerName.value = trainerdashboardResponseModel.data.firstName!+" "+trainerdashboardResponseModel.data.lastName!;
      if(trainerdashboardResponseModel.data.profilePhoto!=null)
        {
          profilePhoto.value = ApiBaseHelper().imageBaseUrl+trainerdashboardResponseModel.data.profilePhoto;
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
          print("STARTTIME!!!comparison!"+comparison.toString());
          var centerId = data.ctId;
          var centerName = data.center;

          STATUSOFCENTER.value=data.isPresent == null ?"NA": data.isPresent!.toString();

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
                status:[STATUSOFCENTER.value]));

          } else {

            // If the center exists, check if the time slot is already added
            var existingCenter = centers[existingCenterIndex];
            if (!existingCenter.timeSlots.contains(
                '${format12Hour.format(startTime)} - ${format12Hour.format(endTime)}')) {
              existingCenter.timeSlots.add(
                  '${format12Hour.format(startTime)} - ${format12Hour.format(endTime)}');
              existingCenter.centerId.add(centerId!.toInt());
              existingCenter.status!.add(STATUSOFCENTER.value);
            }
          }
        }

        update();
        print("MY CENTERS"+centers.toString());
        //centers.sort(sortByStartTime);
        sortByStartTime(centers);
        centers.refresh();
        update();
        //centers.value=centers;
        centers.forEach((center) => print(center.name));




        PreferenceUtils.removekey("CENTERS");
        await PreferenceUtils.setCenterList("CENTERS", centers);



        if( PreferenceUtils.getInt(AppConstants.COUNTER_VALUE) == 0)
          {
            if(SelectedDate.value==newFormat.format(DateTime.now()))
            {
               sendGeoLocations();
            }
            else
              {
                //showSnackBar("Can't Track your Attendance", "Attendance can be marked of today !");
              }

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
    int fetchCounterValue = PreferenceUtils.getInt(AppConstants.FETCH_COUNTER_VALUE);
    print("fetchCounter==main"+fetchCounterValue.toString());
     needtoRebuild();

    update();
    return trainerdashboardResponseModel;
  }

  // Custom comparator function
  void sortByStartTime(List<CenterModel> centers) {
    // Define a function to parse and compare individual time slots
    int compareTimeSlots(String slotA, String slotB) {
      DateFormat sdf = DateFormat('hh:mm a');
      DateTime startTimeA = sdf.parse(slotA.split(' - ')[0]);
      DateTime startTimeB = sdf.parse(slotB.split(' - ')[0]);
      return startTimeA.compareTo(startTimeB);
    }

    // Sort the time slots and statuses for each center
    for (var center in centers) {
      List<String> timeSlots = center.timeSlots.cast<String>(); // Cast to List<String>
      List<String> statuses = center.status!.cast<String>(); // Cast to List<String>

      List<Map<String, String>> combinedSlotsAndStatuses = [];
      for (int i = 0; i < timeSlots.length; i++) {
        combinedSlotsAndStatuses.add({
          'timeSlot': timeSlots[i],
          'status': statuses.length > i ? statuses[i] : '',
        });
      }

      combinedSlotsAndStatuses.sort((a, b) {
        int timeComparison = compareTimeSlots(a['timeSlot']!, b['timeSlot']!);
        if (timeComparison != 0) {
          return timeComparison;
        } else {
          return a['status']!.compareTo(b['status']!);
        }
      });

      // Update the sorted time slots and statuses back to the center
      center.timeSlots = combinedSlotsAndStatuses.map((e) => e['timeSlot']!).toList();
      center.status = combinedSlotsAndStatuses.map((e) => e['status']!).toList();
    }

    // Sort the centers based on the earliest time slot
    centers.sort((a, b) {
      DateFormat sdf = DateFormat('hh:mm a');
      DateTime startTimeA = sdf.parse(a.timeSlots.first.split(' - ')[0]);
      DateTime startTimeB = sdf.parse(b.timeSlots.first.split(' - ')[0]);
      return startTimeA.compareTo(startTimeB);
    });
  }
  int compareTimeSlots(GeoLocation a, GeoLocation b) {
    // Parse the time slots into DateTime objects for comparison
    DateTime timeA = DateFormat('h:mm a').parse(a.timeSlot);
    DateTime timeB = DateFormat('h:mm a').parse(b.timeSlot);

    // Compare the time slots
    return timeA.compareTo(timeB);
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

          if (timeDifference.inMinutes > 10)
          {
            toleranceDatetime = startTimeDt.subtract(Duration(minutes: 10));
            newStartTime = formatter.format(toleranceDatetime);
            geolocationlist.add(GeoLocation(
                center.status![0], center.centerId[0], newStartTime,
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
                      center.status![0], center.centerId[0], formattedTime,
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


    geolocationlist.sort(compareTimeSlots);
    if (geolocationlist.length != 0)
    {
      await PreferenceUtils.removekey(
          'geoLocations').then((value) async =>
      {
        await PreferenceUtils.setCustomGeoLocationList(
            'geoLocations', geolocationlist),

      }); // PreferenceUtils.setCustomList('geoLocations', geolocationlist,(item) => item.toMap());


      //var controller = Get.find<LocationController>();
      if (!Get.isRegistered<LocationController>()) {
        Get.put(LocationController());
      }

      // Retrieve the LocationController instance
      var controller = Get.find<LocationController>();
      if (await BackgroundLocator.isServiceRunning())
      {

        print("YES IT IS ALREADY RUNNING");

      /*  Get.delete<LocationController>();
        var controller = Get.put(LocationController());
        controller.initPlatformState();
         await controller.startLocationService();*/
      }
      else
        {

          await controller.initPlatformState().then((value) async =>
          {
            await controller.startLocationService()
          });
        }

      }
    else {


      print("BACKGROUND"+await BackgroundLocator.isServiceRunning().toString());
      if (await BackgroundLocator.isServiceRunning())
      {
        await BackgroundLocator.unRegisterLocationUpdate().then((value) =>
        {

          print("IT IS UPDATED..AS THERE ARE NO GEO LOCATIONS RIGHT NOW")
        });
      }

      else
        {
           print("NO LOCATIONS ARE THERE");
        }
    }
  }

  void handleLocationUpdate(
      double latitude, double longitude, int count) async
  {


    print("VALUE OF COUNT==>>" + count.toString());

    List<GeoLocation> retrievedListGeoLocations =
    await PreferenceUtils.getCustomGeoList("geoLocations");

    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('h:mm a');
    String formattedTime = formatter.format(now);
    String? storedDate =
    formatter.format(retrievedListGeoLocations[0].dateTime);
    GeoLocation location = retrievedListGeoLocations[0];
    print("Stored DATE" + storedDate);
    print("Print-Status"+location.attendancestatus!="Absent");
  //  print("Stored DATE-STATUS" + retrievedCenters[0].status.toString());


    if (formattedTime == storedDate)
    {
      GeoLocation location = retrievedListGeoLocations[0];
      if (count > 3 && location.attendancestatus=="Waiting")
      {
        print("s it is matching"+count.toString()+location.attendancestatus.toString());
        count = count + 1;
        PreferenceUtils.removekey(AppConstants.COUNTER_VALUE);
        PreferenceUtils.setInt(AppConstants.COUNTER_VALUE, count);
        update();

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

        print("not yet matching"+count.toString()+location.attendancestatus.toString());

        count = count + 1;
        PreferenceUtils.removekey(AppConstants.COUNTER_VALUE);
         PreferenceUtils.setInt(AppConstants.COUNTER_VALUE, count);
         update();


        retrievedListGeoLocations.clear();
        GeoLocation geoLocation = GeoLocation(
            location.attendancestatus, location.centerId, location.timeSlot,
            //location.dateTime.add(Duration(minutes:1)));
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

      PreferenceUtils.removekey("FETCH_COUNTER_VALUE");
      PreferenceUtils.setInt(AppConstants.FETCH_COUNTER_VALUE,30);

      List<GeoLocation> retrievedListGeoLocations =
      await PreferenceUtils.getCustomGeoList("geoLocations");

      GeoLocation location = retrievedListGeoLocations[0];


      retrievedListGeoLocations.clear();

      GeoLocation geoLocation = GeoLocation(
          updateAttendanceResponseModel.isPresent.toString(), location.centerId, location.timeSlot,
          location.dateTime);

      retrievedListGeoLocations.add(geoLocation);

      await PreferenceUtils.setCustomGeoLocationList(
          "geoLocations", retrievedListGeoLocations);
      print("NEW LOCATION" + retrievedListGeoLocations.toString());


      if(PreferenceUtils.getInt(AppConstants.COUNTER_VALUE)==PreferenceUtils.getInt(AppConstants.SERVER_COUNT_VALUE)+1)
        {
            PreferenceUtils.removekey(AppConstants.COUNTER_VALUE);
            PreferenceUtils.setInt(AppConstants.COUNTER_VALUE, 0);
           update();

           await BackgroundLocator.unRegisterLocationUpdate();
        }
      if(updateAttendanceResponseModel.isPresent!="Waiting")
        {
          PreferenceUtils.removekey(AppConstants.COUNTER_VALUE);
          PreferenceUtils.setInt(AppConstants.COUNTER_VALUE, 0);
          update();
          await BackgroundLocator.unRegisterLocationUpdate();
        }


      await getTrainerDashboardData(DateTime.now());
     // await onInit();
      update();

    }
    else
    {
       print("SOMETHING WENT WRONG !");
    }
  }

  /*Future<Permission> requestPermission() async
  {
    print("YOU ARE HERE");
    final permission = Permission.location;
    if (await permission.isDenied)
    {
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
    if (await permission.isGranted)
    {
      await getTrainerDashboardData(DateTime.now());
    }
    return permission;
  }*/
  void needtoRebuild()
  {
    int fetchCounterValue = PreferenceUtils.getInt(AppConstants.FETCH_COUNTER_VALUE);
    print("fetchCounter"+fetchCounterValue.toString());
    Future.delayed(Duration(seconds:fetchCounterValue),()
    {

      getTrainerDashboardData(SelectedDateTime);
      PreferenceUtils.removekey("FETCH_COUNTER_VALUE");
      PreferenceUtils.setInt(AppConstants.FETCH_COUNTER_VALUE,30);
    });
  }
}

