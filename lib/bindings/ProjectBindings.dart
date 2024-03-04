 import 'package:get/get.dart';
import 'package:sahyog/controller/AddTraineeController.dart';
import 'package:sahyog/controller/AddTrainerController.dart';
import 'package:sahyog/controller/ManageTrainerController.dart';

class ProjectBindings implements Bindings
{
  @override
  void dependencies()
  {
    Get.lazyPut(() => AddTraineeController());
    Get.put<AddTraineeController>(AddTraineeController());
    Get.put<ManageTrainerController>(ManageTrainerController());
  }

}