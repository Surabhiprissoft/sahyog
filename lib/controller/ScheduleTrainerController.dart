import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:sahyog/model/Centers.dart';

class ScheduleTrainerController extends GetxController{
  var traineenames = ['Trainer 1', 'Trainer 2', 'Trainer 3', 'Trainer 4'].obs;
  RxInt selectedScheduleDays = 1.obs;
  RxInt selectedInterval = 1.obs;
  //var selectedNames = <String>[].obs; //Earlier Assignment
  var selectedNames = <AssignTrainee>[].obs;
  RxBool isChecked = true.obs;
  bool alreadyAssigned = false;

  late List<CenterModel> centers;

  CenterModel center1 = CenterModel('Center 1', ['7:00-9:00', '9:00-11:00', '2:00-4:00']);
  CenterModel center2 = CenterModel('Center 2', ['7:00-9:00', '9:00-11:00', '2:00-4:00']);
  CenterModel center3 = CenterModel('Center 3',['7:00-9:00', '9:00-11:00', '2:00-4:00']);

  var showCustomDaysTextField = false.obs;
  var showIntervalDaysTextField = false.obs;


  @override
  void onInit() {
    centers = [center1, center2, center3];
  } // Add Center objects to a list

 /* void toggleSelection(String name) {
    if (selectedNames.contains(name)) {
      selectedNames.remove(name);
    } else {
      selectedNames.add(name);
    }
  }*/
// Earlier Selection Code.

 /* void toggleSelection(String name, String centerName, String selectedtimeslot, int index) {
    // Create an AssignTrainee object to check for selection
    AssignTrainee trainee = AssignTrainee(name, centerName, selectedtimeslot);

    if (selectedNames.contains(trainee)) {
      selectedNames.remove(trainee);
    } else {
      selectedNames.add(trainee);
    }
  }*/



  bool toggleSelection(String name, String centerName, String selectedTimeSlot, int index) {
    // Check if the trainee is already assigned to a similar time slot in another center
    alreadyAssigned = selectedNames.any((trainee) =>
    trainee.traineeName == name &&
        trainee.timeslot == selectedTimeSlot &&
        trainee.centerName != centerName);


    if (alreadyAssigned) {
      // Show snackbar indicating that the trainee is already selected for similar time slot
      print("Already Assigned :$alreadyAssigned");
      Get.snackbar(
        'Already Selected',
        '$name is already assigned to a similar time slot in another center.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }


    // Create an AssignTrainee object to check for selection
    return alreadyAssigned;
  }

  void AssignedTrainer(String name, String centerName, String selectedTimeSlot, int index,int number_day, int interval, String currentDate) {

    AssignTrainee trainee = AssignTrainee(name, centerName, selectedTimeSlot,number_day,interval,currentDate);

    if (selectedNames.contains(trainee)) {
      selectedNames.remove(trainee);
      isChecked.value = true;
    } else {
      selectedNames.add(trainee);
      isChecked.value = false;
    }
  }
}