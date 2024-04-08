import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:sahyog/model/ResponseModel/TraineeDashboardResponseModel.dart';
import 'package:sahyog/network/api_baseHelper.dart';

import '../network/user_repository.dart';
import '../utils/app_constants.dart';
import '../utils/preference_utils.dart';
import '../widgets/other_common_widget.dart';
import 'package:get/get.dart';


class TraineeDashboardController extends GetxController
{

     RxString fName = "".obs;
     RxString lName = "".obs;
     RxString dob = "".obs;
     RxString email = "".obs;
     RxString address = "".obs;
     RxString phone = "".obs;
     RxString trainingType = "".obs;
     RxString gender = "".obs;
     RxString centerName = "".obs;
     RxString centerAddress = "".obs;
     RxString traineeProfile = "".obs;
     RxInt dueCount = 0.obs;


     late RxList<AssignedTrainers> assignedTrainers= <AssignedTrainers>[].obs;
     late RxList<FeesStatusByMonth> feesStatus= <FeesStatusByMonth>[].obs;

     late int userId;

     DateFormat format12Hour = DateFormat("h:mm a");
     DateFormat format24Hour = DateFormat("HH:mm:ss");

    final UserRepository userRepository;
    TraineeDashboardController(this.userRepository);

    late  RxList<TraineeDashboardResponseModel> traineeDashboardData = <TraineeDashboardResponseModel>[].obs;

    @override
    void onInit() {
      super.onInit();
     // userId= Get.arguments;
      userId = PreferenceUtils.getInt(AppConstants.USERID);

      getTraineeDashboardData(userId);
    }

    Future<void> getTraineeDashboardData(int userId) async {
      final response = await userRepository.getTraineeDashboardData(userId);
      if (response.status == 200) {

        fName.value = response.data.traineeFirstname.toString();
        lName.value = response.data.traineeLastname.toString();
        dob.value = response.data.dob.toString();
        email.value = response.data.email.toString();
        address.value = response.data.address.toString();
        trainingType.value = response.data.trainingType.toString();
        gender.value = response.data.gender.toString();
        centerName.value = response.data.centerName.toString();
        centerAddress.value = response.data.centerAddress.toString();
        phone.value = response.data.phone.toString();
        dueCount.value = response.data.feesStatusFalseCount!.toInt();
        print("VALUE_PHOTO"+response.data.traineeProfilephoto.toString());
        if(response.data.traineeProfilephoto!=null)
          {
            print("YES");
            traineeProfile.value = ApiBaseHelper().imageBaseUrl+response.data.traineeProfilephoto.toString();
          }
        else
          {
            print("NO");
          }
        assignedTrainers.addAll(response.data.assignedTrainers!.toList());
        feesStatus.addAll(response.data.feesStatusByMonth!.toList());

        print("photo"+traineeProfile.value);
       // unApprovedTrainerList.value = unApprovedTrainerList.reversed.toList();
      } else {
        showSnackBar("Something went wrong", "Unable to fetch trainer list at the moment");
      }
    }

}