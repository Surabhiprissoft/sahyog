
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

        print("Centers Are"+centers.toString());
        update();
      } else {
        showSnackBar("Something went wrong", "Unable to fetch Center list at the moment");
      }
      return trainerdashboardResponseModel;
    }
  }

