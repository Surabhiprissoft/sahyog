import 'package:get/get.dart';
import 'package:sahyog/model/Centers.dart';

class ScheduleTrainerController extends GetxController{
  var traineenames = ['Trainer 1', 'Trainer 2', 'Trainer 3', 'Trainer 4'].obs;
  //var selectedNames = <String>[].obs; //Earlier Assignment
  var selectedNames = <AssignTrainee>[].obs;


  late List<CenterModel> centers;

  CenterModel center1 = CenterModel('Center 1', ['7:00-9:00', '9:00-11:00', '2:00-4:00']);
  CenterModel center2 = CenterModel('Center 2', ['7:00-9:00', '9:00-11:00', '2:00-4:00']);
  CenterModel center3 = CenterModel('Center 3',['7:00-9:00', '9:00-11:00', '2:00-4:00']);

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



  void toggleSelection(String name, String centerName, String selectedTimeSlot, int index) {
    // Check if the trainee is already assigned to a similar time slot in another center
    bool alreadyAssigned = selectedNames.any((trainee) =>
    trainee.traineeName == name &&
        trainee.timeslot == selectedTimeSlot &&
        trainee.centerName != centerName);

    if (alreadyAssigned) {
      // Show snackbar indicating that the trainee is already selected for similar time slot
      Get.snackbar(
        'Already Selected',
        '$name is already assigned to a similar time slot in another center.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Create an AssignTrainee object to check for selection
    AssignTrainee trainee = AssignTrainee(name, centerName, selectedTimeSlot);

    if (selectedNames.contains(trainee)) {
      selectedNames.remove(trainee);
    } else {
      selectedNames.add(trainee);
    }
  }
}