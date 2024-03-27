import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sahyog/model/BaseListResponse.dart';
import 'package:sahyog/model/Centers.dart';
import 'package:sahyog/model/RequestModel/TimeSlotRequestModel.dart';
import 'package:sahyog/model/ResponseModel/TimeSlotResponseModel.dart';
import 'package:sahyog/network/user_repository.dart';

class ScheduleTrainerController extends GetxController{
  var traineenames = ['Trainer 1', 'Trainer 2', 'Trainer 3', 'Trainer 4'].obs;
  //var selectedNames = <String>[].obs; //Earlier Assignment
  var selectedNames = <AssignTrainee>[].obs;
  final UserRepository userRepository;

  ScheduleTrainerController(this.userRepository);

  late List<CenterModel> centers=[];

  /*CenterModel center1 = CenterModel('Center 1', ['7:00-9:00', '9:00-11:00', '2:00-4:00']);
  CenterModel center2 = CenterModel('Center 2', ['7:00-9:00', '9:00-11:00', '2:00-4:00']);
  CenterModel center3 = CenterModel('Center 3',['7:00-9:00', '9:00-11:00', '2:00-4:00']);*/

  late ListResponse<TimeSlotResponseModel> timeslotResponseModel;

  @override
  void onInit() {
    //centers = [center1, center2, center3];
    getData();
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

  void getTimeslotData() async
  {

     TimeSlotRequestModel timeSlotRequestModel= TimeSlotRequestModel(date:"2024-83-23");
     print(timeSlotRequestModel.toString());
    timeslotResponseModel=await userRepository.getTimeSlots(timeSlotRequestModel);
    if(timeslotResponseModel.status==200)
      {
         print("HELLO");
      }
  }

  void getData()
  {
    List<Map<String, dynamic>> responseData =[
      {
        "id": 1,
        "ctable": {
          "id": 4,
          "name": "SP",
          "address": "SP Prasarakh Mandali, SP College, Tilak Road",
          "total_trainees": 4
        },
        "ttable": {
          "id": 1,
          "start_timme": "18:30:00",
          "end_time": "20:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 2,
        "ctable": {
          "id": 4,
          "name": "SP",
          "address": "SP Prasarakh Mandali, SP College, Tilak Road",
          "total_trainees": 4
        },
        "ttable": {
          "id": 16,
          "start_timme": "20:00:00",
          "end_time": "21:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 3,
        "ctable": {
          "id": 5,
          "name": "Race",
          "address": "Salunke Vihar Road",
          "total_trainees": 2
        },
        "ttable": {
          "id": 3,
          "start_timme": "08:00:00",
          "end_time": "10:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 4,
        "ctable": {
          "id": 5,
          "name": "Race",
          "address": "Salunke Vihar Road",
          "total_trainees": 2
        },
        "ttable": {
          "id": 4,
          "start_timme": "17:00:00",
          "end_time": "20:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 5,
        "ctable": {
          "id": 6,
          "name": "Sahabhag Hall",
          "address": "Somvar Peth",
          "total_trainees": 2
        },
        "ttable": {
          "id": 2,
          "start_timme": "19:00:00",
          "end_time": "20:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 6,
        "ctable": {
          "id": 7,
          "name": "Symbiosis School",
          "address": "Prabhat Road",
          "total_trainees": 1
        },
        "ttable": {
          "id": 5,
          "start_timme": "07:30:00",
          "end_time": "10:30:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 7,
        "ctable": {
          "id": 7,
          "name": "Symbiosis School",
          "address": "Prabhat Road",
          "total_trainees": 1
        },
        "ttable": {
          "id": 6,
          "start_timme": "10:30:00",
          "end_time": "13:30:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 8,
        "ctable": {
          "id": 7,
          "name": "Symbiosis School",
          "address": "Prabhat Road",
          "total_trainees": 1
        },
        "ttable": {
          "id": 7,
          "start_timme": "14:30:00",
          "end_time": "16:30:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 9,
        "ctable": {
          "id": 7,
          "name": "Symbiosis School",
          "address": "Prabhat Road",
          "total_trainees": 1
        },
        "ttable": {
          "id": 8,
          "start_timme": "18:00:00",
          "end_time": "21:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 10,
        "ctable": {
          "id": 8,
          "name": "Jnana Prabodhini",
          "address": "Sadashiv Peth",
          "total_trainees": 0
        },
        "ttable": {
          "id": 9,
          "start_timme": "09:45:00",
          "end_time": "11:45:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 11,
        "ctable": {
          "id": 8,
          "name": "Jnana Prabodhini",
          "address": "Sadashiv Peth",
          "total_trainees": 0
        },
        "ttable": {
          "id": 10,
          "start_timme": "16:00:00",
          "end_time": "20:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 12,
        "ctable": {
          "id": 9,
          "name": "RCBC",
          "address": "Bund garden road",
          "total_trainees": 0
        },
        "ttable": {
          "id": 8,
          "start_timme": "18:00:00",
          "end_time": "21:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 13,
        "ctable": {
          "id": 9,
          "name": "RCBC",
          "address": "Bund garden road",
          "total_trainees": 0
        },
        "ttable": {
          "id": 11,
          "start_timme": "10:00:00",
          "end_time": "12:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 14,
        "ctable": {
          "id": 10,
          "name": "Pawar public school",
          "address": "Nanded City",
          "total_trainees": 0
        },
        "ttable": {
          "id": 12,
          "start_timme": "17:00:00",
          "end_time": "18:00:00"
        },
        "date": "2024-03-23"
      },
      {
        "id": 15,
        "ctable": {
          "id": 11,
          "name": "Versatile school",
          "address": "Sinhagad road",
          "total_trainees": 1
        },
        "ttable": {
          "id": 13,
          "start_timme": "12:00:00",
          "end_time": "14:00:00"
        },
        "date": "2024-03-23"
      },
    ];

    List<TimeSlotResponseModel>timeslotlist=[];


    for (var data in responseData) {
      var id = data['id'];
      var ctable = ctableFromJson(json.encode(data['ctable']));
      var ttable = ttableFromJson(json.encode(data['ttable']));
      var date = data['date'];

      var timeSlotResponseModel = TimeSlotResponseModel(
        id: id,
        ctable: ctable,
        ttable: ttable,
        date: date,
      );

      timeslotlist.add(timeSlotResponseModel);
      print(timeslotlist.length);



      // Processing response data
      for (var data in responseData) {
        var centerName = data['ctable']['name'];
        var startTime = data['ttable']['start_timme'];
        var endTime = data['ttable']['end_time'];

        var existingCenter = centers.firstWhere(
              (center) => center.name == centerName,
          orElse: () => CenterModel('Default Center', []),
        );

        if (existingCenter.name == 'Default Center') {
          centers.add(CenterModel(centerName, ['${startTime.substring(0, 5)} am - ${endTime.substring(0, 5)} am']));
        } else {
          existingCenter.timeSlots.add('${startTime.substring(0, 5)} am - ${endTime.substring(0, 5)} am');
        }
      }

      // Printing formatted output
      for (var center in centers) {
        print("Formatted Output"+center.toString());
      }
    }
  }
}