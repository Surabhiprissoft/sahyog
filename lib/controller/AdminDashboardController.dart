import 'dart:convert';

import 'package:get/get.dart';
import 'package:sahyog/model/Centers.dart';
import 'package:sahyog/model/ResponseModel/AdminDashboardResponseModel.dart';
import 'package:sahyog/model/ResponseModel/TimeSlotResponseModel.dart';

import '../model/BaseSingleObjectResponse.dart';
import '../network/user_repository.dart';
import '../widgets/other_common_widget.dart';

class AdminDashboardController extends GetxController{

  RxInt totalTrainerCount = 0.obs;
  RxInt totalTraineeCount = 0.obs;
  late RxList<Centers> centerList= <Centers>[].obs;
  late SingleResponse<AdminDashboardResponseModel> adminDashboardResponse;

  final UserRepository userRepository;
  AdminDashboardController(this.userRepository);

  @override
  void onInit() {
    super.onInit();
    print("Started Init");
    getAdminDashboardData();
    getData();
    update();
  }


  Future<SingleResponse<AdminDashboardResponseModel>> getAdminDashboardData() async {
    adminDashboardResponse = await userRepository.getAdminDashboardData();
    print(adminDashboardResponse.data.toString());
    if (adminDashboardResponse.status == 200) {
      totalTrainerCount.value = adminDashboardResponse.data.trainerCount!.toInt();
      totalTraineeCount.value = adminDashboardResponse.data.traineeCount!.toInt();
      centerList.addAll(adminDashboardResponse.data.centers!.toList());
      centerList.removeAt(0);
      update();
    } else {
      showSnackBar("Something went wrong", "Unable to fetch Center list at the moment");
    }
    return adminDashboardResponse;
  }

  void getData() {
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
    }

    print("TimeSlotList.size"+timeslotlist.length.toString());

    List<CenterModel> centers = [];

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