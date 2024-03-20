 import 'package:get/get.dart';
import 'package:sahyog/Screens/ChangePassword.dart';

import 'package:sahyog/controller/ChangePasswordController.dart';
import 'package:sahyog/controller/ForgotPasswordController.dart';
import 'package:sahyog/controller/LoginController.dart';
import 'package:sahyog/controller/dashboardController/AdminDashboardController.dart';
import 'package:sahyog/controller/profileController/TraineeProfileController.dart';
import 'package:sahyog/controller/profileController/TrainerProfileController.dart';
import 'package:sahyog/controller/traineeController/AddTraineeController.dart';
import 'package:sahyog/controller/traineeController/ManageTraineeController.dart';
import 'package:sahyog/controller/trainerController/AddTrainerController.dart';
import 'package:sahyog/controller/trainerController/ManageTrainerController.dart';
import 'package:sahyog/controller/trainerController/ScheduleTrainerController.dart';
import 'package:sahyog/network/api_baseHelper.dart';
import 'package:sahyog/network/user_repository.dart';

class ProjectBindings implements Bindings
{
  @override
  void dependencies()
  {
    Get.lazyPut<AddTrainerController>(() => AddTrainerController(UserRepository(ApiBaseHelper())), fenix: true);
    Get.lazyPut<ManageTrainerController>(() => ManageTrainerController(UserRepository(ApiBaseHelper())),fenix: true);
    Get.lazyPut<ManageTraineeController>(() => ManageTraineeController(UserRepository(ApiBaseHelper())),fenix: true);
    Get.lazyPut<AddTraineeController>(() => AddTraineeController(UserRepository(ApiBaseHelper())), fenix: true);
    Get.lazyPut<ChangePasswordController>(() => ChangePasswordController(UserRepository(ApiBaseHelper())),fenix: true);
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController(UserRepository(ApiBaseHelper())),fenix: true);
    //Get.lazyPut<AddTraineeController>(() => LoginPageLogic(UserRepository(ApiBaseHelper())), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(UserRepository(ApiBaseHelper())), fenix: true);
    Get.lazyPut<ScheduleTrainerController>(() => ScheduleTrainerController(), fenix: true);
    Get.lazyPut<TrainerProfileController>(() => TrainerProfileController(), fenix: true);
    Get.lazyPut<TraineeProfileController>(() => TraineeProfileController(), fenix: true);
    Get.lazyPut<AdminDashboardController>(() => AdminDashboardController(UserRepository(ApiBaseHelper())), fenix: true);

  }

}