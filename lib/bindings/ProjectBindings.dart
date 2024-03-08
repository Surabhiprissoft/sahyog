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
    Get.put<AddTrainerController>(AddTrainerController());
    Get.put<AddTraineeController>(AddTraineeController());
    Get.put<ManageTrainerController>(ManageTrainerController());
    Get.put<AddTraineeController>(AddTraineeController());

    //Get.lazyPut<AddTraineeController>(() => LoginPageLogic(UserRepository(ApiBaseHelper())), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(UserRepository(ApiBaseHelper())), fenix: true);
  }

}