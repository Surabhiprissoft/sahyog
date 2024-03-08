 import 'package:get/get.dart';
import 'package:sahyog/controller/AddTraineeController.dart';
import 'package:sahyog/controller/AddTrainerController.dart';
import 'package:sahyog/controller/LoginController.dart';
import 'package:sahyog/controller/ManageTrainerController.dart';

import '../network/api_baseHelper.dart';
import '../network/user_repository.dart';

class ProjectBindings implements Bindings
{
  @override
  void dependencies()
  {
    Get.lazyPut<AddTrainerController>(() => AddTrainerController(UserRepository(ApiBaseHelper())), fenix: true);
    Get.put<ManageTrainerController>(ManageTrainerController());
    Get.lazyPut<AddTraineeController>(() => AddTraineeController(UserRepository(ApiBaseHelper())), fenix: true);
    //Get.lazyPut<AddTraineeController>(() => LoginPageLogic(UserRepository(ApiBaseHelper())), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(UserRepository(ApiBaseHelper())), fenix: true);
  }

}