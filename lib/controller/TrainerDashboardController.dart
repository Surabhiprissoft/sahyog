
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sahyog/model/BaseSingleObjectResponse.dart';
import 'package:sahyog/model/Centers.dart';
import 'package:sahyog/model/ResponseModel/TrainerDashboardResponseModel.dart';
import 'package:sahyog/network/user_repository.dart';
import 'package:sahyog/utils/app_constants.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

import '../utils/preference_utils.dart';

class TrainerDashboardController extends GetxController{

  RxBool switchValue = false.obs;
  RxString SelectedDate = ''.obs;
  final UserRepository userRepository;
  late SingleResponse<TrainerDashboardResponseModel> trainerdashboardResponseModel;
  List<Schedule> myList = <Schedule>[];
  late RxList<CenterModel> centers = <CenterModel>[].obs;
  TrainerDashboardController(this.userRepository);


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTrainerDashboardData(DateTime.now());
    update();
   // print("Role from PreferenceUtils: $role");
  }

  Future<SingleResponse<TrainerDashboardResponseModel>> getTrainerDashboardData(DateTime dateTime) async
  {
      var newFormat = DateFormat("yyyy-MM-dd");
      var selectedDate = newFormat.format(dateTime);
      print(selectedDate);
      trainerdashboardResponseModel = await userRepository.getTrainerDashboardData(PreferenceUtils.getInt(AppConstants.USERID),selectedDate);
      print(trainerdashboardResponseModel.data.toString());
      DateFormat format12Hour = DateFormat("h:mm a");
      if (trainerdashboardResponseModel.status == 200) {

        centers.clear();
         myList=trainerdashboardResponseModel.data.schedule!;
        for (var data in myList) {
          DateFormat format24Hour = DateFormat("HH:mm:ss");

          var centerId = data.userId;
          var centerName = data.center;
          var startTime = format24Hour.parse(data.startTimme!);
          var endTime = format24Hour.parse(data!.endTime!);

          // Check if the center already exists in the centers list
          var existingCenterIndex = centers.indexWhere((center) =>
          center.name == centerName);

          // If the center doesn't exist, add it to the list
          if (existingCenterIndex == -1) {
            centers.add(CenterModel([centerId!.toInt()], centerName!, [
              '${format12Hour.format(startTime)} - ${format12Hour.format(
                  endTime)}'
            ]));
          } else {
            // If the center exists, check if the time slot is already added
            var existingCenter = centers[existingCenterIndex];
            if (!existingCenter.timeSlots.contains(
                '${format12Hour.format(startTime)} - ${format12Hour.format(
                    endTime)}')) {
              existingCenter.timeSlots.add(
                  '${format12Hour.format(startTime)} - ${format12Hour.format(
                      endTime)}');
              existingCenter.centerId.add(centerId!.toInt());
            }
          }
        }

        centers.sort(sortByStartTime);

        // Print the sorted list
        centers.forEach((center) => print(center.name));
        print("Centers Are"+centers.toString());


        List<Map<String, String>> statusList = getStatusList(centers);
        print(statusList.toString());
        update();
      } else {
        showSnackBar("Something went wrong", "Unable to fetch Center list at the moment");
      }
      return trainerdashboardResponseModel;
    }
  DateTime getStartTime(String slot) {
    return DateFormat('hh:mm a').parse(slot.split(' - ')[0]);
  }

  // Custom comparator function
  int sortByStartTime(CenterModel a, CenterModel b) {
    // Get the start time of the first time slot for each center
    DateTime startTimeA = DateFormat('hh:mm a').parse(a.timeSlots[0].split(' - ')[0]);
    DateTime startTimeB = DateFormat('hh:mm a').parse(b.timeSlots[0].split(' - ')[0]);

    // Compare the start times
    return startTimeA.compareTo(startTimeB);
  }

  // Sort the list using the sortByStartTime function
  String getStatus(TimeOfDay currentTime, TimeOfDay startTime) {


    if (startTime.hour < currentTime.hour)
    {
      return "Absent";
    }
    else {
      return "not yet started";
    }
  }

  List<Map<String, String>> getStatusList(List<CenterModel> centers) {
    TimeOfDay currentTime = TimeOfDay.now();
    List<Map<String, String>> statusList = [];

    for (var center in centers) {
      for (var timeSlot in center.timeSlots) {
        var timeRangeParts = timeSlot.split(" - ");

        var startTime = _parseTimeOfDay(timeRangeParts[0]);
        print("STARTTIME"+startTime.toString());
        print("CURRENTTIME"+currentTime.toString());
        String status = getStatus(currentTime, startTime);

        statusList.add({'center_name': center.name, 'status': status});
      }
    }
    return statusList;
  }

  TimeOfDay _parseTimeOfDay(String timeString) {
    String formattedTime = timeString.replaceAll(RegExp(r'(:? AM|:? PM)'), '');
    List<String> parts = formattedTime.split(":");
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }


}

