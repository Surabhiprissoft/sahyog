import 'package:get/get.dart';
import 'package:sahyog/model/RequestModel/RegistrationUpdateRequestModel.dart';
import 'package:sahyog/model/ResponseModel/TraineeListResponseModel.dart';
import 'package:sahyog/model/ResponseModel/TrainerListResponseModel.dart';
import 'package:sahyog/model/ResponseModel/TrainerRegistrationResponseModel.dart';
import 'package:sahyog/network/user_repository.dart';
import 'package:sahyog/widgets/DialogHelper.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

import 'dashboardController/AdminDashboardController.dart';


class RegistrationRequestsController extends GetxController{

  final UserRepository userRepository;
  RegistrationRequestsController(this.userRepository);

  var  slidingValue=1.obs;
  late  RxList<TrainerRegistrationResponseModel> unApprovedTrainerList = <TrainerRegistrationResponseModel>[].obs;
  late  RxList<TraineeListResponseModel> traineeList = <TraineeListResponseModel>[].obs;



  @override
  void onInit() {
    getUnApprovedTrainerList();
    getUnApprovedTraineeList();
    super.onInit();
  }


  Future<void> getUnApprovedTrainerList() async {
    final trainerResponse = await userRepository.getUnApprovedTrainerList();
    if (trainerResponse.status == 200) {
      unApprovedTrainerList.assignAll(trainerResponse.data);
      unApprovedTrainerList.value = unApprovedTrainerList.reversed.toList();
      print("Hello bro ${unApprovedTrainerList.length}");

    } else {
      showSnackBar("Something went wrong", "Unable to fetch trainer list at the moment");
    }
  }

  Future<void> getUnApprovedTraineeList() async {
    final response = await userRepository.getUnApprovedTraineeList();
    if (response.status == 200) {
      traineeList.assignAll(response.data);
      traineeList.value = traineeList.reversed.toList();
    } else {
      showSnackBar("Something went wrong", "Unable to fetch trainee list at the moment");
    }
  }


  Future<void> performActionOnRequest(bool is_approved,int userId) async{
    DialogHelper.showLoading();
    RegistrationUpdateRequestModel registrationRequest = RegistrationUpdateRequestModel(
      isApprove: is_approved
    );
    final response = await  userRepository.actionOnRegistrationRequest(registrationRequest, userId);
    if(response.status==200){
      DialogHelper.hideLoading();
      getUnApprovedTraineeList();
      getUnApprovedTrainerList();
      var adminController = Get.find<AdminDashboardController>();
      adminController.centerList.clear();
      adminController.getAdminDashboardData();

      if(is_approved){
        showSnackBar("Updated", "The Request has been approved");
      }
      else{
        showSnackBar("Updated", "The Request has been reject");
      }
    }
}

}