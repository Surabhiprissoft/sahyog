import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:sahyog/model/BaseListResponse.dart';
import 'package:sahyog/model/Centers.dart';
import 'package:sahyog/model/RequestModel/DeleteTraineeRequestModel.dart';
import 'package:sahyog/model/RequestModel/ScheduleTrainerRequestModel.dart';
import 'package:sahyog/model/ResponseModel/AdminDashboardResponseModel.dart';
import 'package:sahyog/model/ResponseModel/TimeSlotResponseModel.dart';
import 'package:sahyog/model/ResponseModel/TrainerListResponseModel.dart';
import 'package:sahyog/model/ResponseModel/TrainerTraineeResponseModel.dart';
import 'package:sahyog/network/user_repository.dart';
import 'package:sahyog/utils/app_constants.dart';
import 'package:sahyog/widgets/DialogHelper.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

import '../dashboardController/AdminDashboardController.dart';
import 'ManageTrainerController.dart';

class ScheduleTrainerController extends GetxController {

  // var traineenames = ['Trainer 1', 'Trainer 2', 'Trainer 3', 'Trainer 4'].obs;
  //var selectedNames = <String>[].obs; //Earlier Assignment
  var selectedNames = <AssignTrainee>[].obs;
  var selectedListfordelete = <AssignTrainee>[].obs;
  final UserRepository userRepository;


  ScheduleTrainerController(this.userRepository);

  late RxList<CenterModel> centers = <CenterModel>[].obs;
  RxBool ispreviousdataselected = false.obs;

  DateFormat format12Hour = DateFormat("h:mm a");

  RxBool isChecked = true.obs;
  bool alreadyAssigned = false;

  var showCustomDaysTextField = false.obs;
  var showIntervalDaysTextField = false.obs;
  RxInt selectedScheduleDays = 1.obs;
  RxInt selectedInterval = 1.obs;
  var selectedDate="";
  late DateTime selectedDateTime;

  /*CenterModel center1 = CenterModel('Center 1', ['7:00-9:00', '9:00-11:00', '2:00-4:00']);
  CenterModel center2 = CenterModel('Center 2', ['7:00-9:00', '9:00-11:00', '2:00-4:00']);
  CenterModel center3 = CenterModel('Center 3',['7:00-9:00', '9:00-11:00', '2:00-4:00']);*/

  late ListResponse<TimeSlotResponseModel> timeslotResponseModel;
  late TrainerTraineeResponseModel trainerTraineeResponseModel;
  late RxList<TimeSlotResponseModel> timeslotList = <TimeSlotResponseModel>[]
      .obs;
  late RxList<TrainerListResponseModel> traineenames = <
      TrainerListResponseModel>[].obs;

  @override
  void onInit() async {
    getTimeslotData(DateTime.now());
    var trainercontroller = Get.find<ManageTrainerController>();
    var data = await trainercontroller.getTrainerList();
    traineenames.addAll(data);

    print("TraineeNames" + traineenames.length.toString());
    update();
    //centers = [center1, center2, center3];
    // getData();
    //getTimeslotData();
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

  bool toggleSelection(String name, String centerName, String selectedTimeSlot,
      int index)
  {
    // Check if the trainee is already assigned to a similar time slot in another center
   /* bool alreadyAssigned = selectedNames.any((trainee) =>
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
    AssignTrainee trainee = AssignTrainee(name, centerName, selectedTimeSlot,centers[index].centerId,trainerid);

    if (selectedNames.contains(trainee)) {
      selectedNames.remove(trainee);
    } else {
      selectedNames.add(trainee);
    }*/

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



  void AssignedTrainer(String name, String centerName, String selectedTimeSlot, int centerId,int trainerId,int number_day, int interval, String currentDate,bool isdeleted) {

    AssignTrainee trainee = AssignTrainee(name, centerName, selectedTimeSlot,centerId,trainerId,number_day,interval,currentDate);

    if (selectedNames.contains(trainee))
    {
      print(selectedListfordelete.toString()+""+selectedListfordelete.length.toString());

      if(isdeleted && selectedListfordelete.contains(trainee))
        {
          DeleteTraineeRequestModel deleteTraineeRequestModel = DeleteTraineeRequestModel(ct:trainee.centerId,user: trainee.userId,date:currentDate);
           deleteTrainnee(deleteTraineeRequestModel);
          // print("Yes you can delete it from api");
          selectedNames.remove(trainee);
          isChecked.value = true;

        }
      else
        {
          // print("it is from local db");
          showSnackBar("Deleted Trainee", "Trainee Deleted Successfully!");
           selectedNames.remove(trainee);
           isChecked.value = true;
        }

    } else {
      selectedNames.add(trainee);
      isChecked.value = false;
    }

  }

  void getTimeslotData(DateTime dateTime) async
  {
    selectedDateTime = dateTime;
    var newFormat = DateFormat("yyyy-MM-dd");
    selectedDate = newFormat.format(dateTime);

    /* TimeSlotRequestModel timeSlotRequestModel= TimeSlotRequestModel(date:"2024-83-23");
     print(timeSlotRequestModel.toString());*/
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(dateTime);

    print(formatted);
    timeslotResponseModel = await userRepository.getTimeSlots(
        AppConstants.GETTIMESLOTS + formatted);

/*    timeslotResponseModel = await userRepository.getTimeSlots(
        AppConstants.GETTIMESLOTS + "2024-03-26" + "/");*/
    if (timeslotResponseModel.status == 200) {
      //timeslotList.clear();
      //timeslotList.assignAll(timeslotResponseModel.data);
      centers.clear();
      selectedNames.clear();
      selectedListfordelete.clear();

      for (var data in timeslotResponseModel.data)
      {
        DateFormat format24Hour = DateFormat("HH:mm:ss");

        var centerId=data.id;
        var centerName = data.ctable!.name;
        var startTime = format24Hour.parse(data.ttable!.startTimme!);
        var endTime =   format24Hour.parse(data!.ttable!.endTime!);

        // Check if the center already exists in the centers list
        var existingCenterIndex = centers.indexWhere((center) =>
        center.name == centerName);

        // If the center doesn't exist, add it to the list
        if (existingCenterIndex == -1) {
          centers.add(CenterModel([centerId!.toInt()],centerName!,[
            '${format12Hour.format(startTime)} - ${format12Hour.format(endTime)}']));
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

        if (data.assignedTrainers != null &&
            data.assignedTrainers!.isNotEmpty) {
          // Iterate over assigned trainers and extract trainer names
          for (var trainer in data.assignedTrainers!)
          {
            /*String date="";

            if(ispreviousdataselected.value)
              {
                print("Selected DateTime"+selectedDateTime.toString());
                var newFormat = DateFormat("yyyy-MM-dd");
                selectedDate = newFormat.format(selectedDateTime);
                 date=selectedDate;
              }
            else
              {
                 date=trainer.date!;
              }*/
            String trainerName = trainer.firstname!;
            // Add the trainer name to your selectedList
            selectedNames.add(AssignTrainee(
              trainerName,
              data.ctable!.name!,
              '${format12Hour.format(startTime)} - ${format12Hour.format(endTime)}',centerId!.toInt(),trainer.id!.toInt(),trainer.noOfDays!.toInt(),trainer.interval!.toInt(),trainer.date!,
            ));
            selectedListfordelete.add(AssignTrainee(
              trainerName,
              data.ctable!.name!,
              '${format12Hour.format(startTime)} - ${format12Hour.format(endTime)}',centerId!.toInt(),trainer.id!.toInt(),trainer.noOfDays!.toInt(),trainer.interval!.toInt(),trainer.date!,
            ));

          }

          selectedNames.value = removeDuplicates(selectedNames);
          selectedListfordelete.value = removeDuplicates(selectedNames);
          update();
        }
      }
      print("SIZEOFSELECTED"+selectedNames.toString());
    }
  }

  Future<void> assigntrainers() async
  {

    late List<ScheduleTrainerRequestModel> assigntrainess = <ScheduleTrainerRequestModel>[];

    //ScheduleTrainerRequestModel scheduleTrainerRequestModel = ScheduleTrainerRequestModel();
    selectedNames!.removeWhere((element) => element.CurrentDate!=selectedDate);
    for(var trainer in selectedNames)
      {
         assigntrainess.add(ScheduleTrainerRequestModel(ctId: trainer.centerId,userId: trainer.userId,noOfDays: trainer.number_days,date: selectedDate,interval: trainer.interval));
      }

    List<Map<String, dynamic>> jsonDataList = assigntrainess.map((model) => model.toJson()).toList();
    String jsonData = jsonEncode(jsonDataList);

    print("Assign Trainees ->"+assigntrainess.toString());


   // scheduleTrainerRequestModel=assigntrainess.toString();

    DialogHelper.showLoading();
    trainerTraineeResponseModel=await userRepository.scheduleTrainer(assigntrainess);
    if(trainerTraineeResponseModel.status==200)
      {
         DialogHelper.hideLoading();
         print("Data Saved Successfully");
         showSnackBar("Saved Trainer", "Trainer Scheduled Successfully!");
         assigntrainess.clear();
         selectedNames.clear();
         var adminController = Get.find<AdminDashboardController>();
         adminController.centerList.clear();
         adminController.getAdminDashboardData();
         getTimeslotData(selectedDateTime);
      }

    else
      {
        DialogHelper.hideLoading();
      }
  }

  List<AssignTrainee> removeDuplicates(List<AssignTrainee> list) {
    Set<String> uniqueKeys = Set<String>();
    List<AssignTrainee> uniqueList = [];

    list.forEach((element) {
      String key = '${element.traineeName}_${element.centerName}_${element.timeslot}';
      if (!uniqueKeys.contains(key)) {
        uniqueList.add(element);
        uniqueKeys.add(key)
        ;
      }
    });

    return uniqueList;
  }

  Future<void> deleteTrainnee(DeleteTraineeRequestModel deleteTraineeRequestModel) async
  {
    trainerTraineeResponseModel=await userRepository.deletSchedule(deleteTraineeRequestModel);
    DialogHelper.showLoading();
    if(trainerTraineeResponseModel.status==200)
    {

      DialogHelper.hideLoading();
      showSnackBar("Deleted Trainee", "Trainee Deleted Successfully!");
      selectedNames.clear();
      selectedListfordelete.clear();
      getTimeslotData(selectedDateTime);
      var adminController = Get.find<AdminDashboardController>();
      adminController.centerList.clear();
      adminController.getAdminDashboardData();
    }
    else
      {
         DialogHelper.hideLoading();
      }
  }
}
