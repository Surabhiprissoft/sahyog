
import 'package:get/get.dart';
import 'package:sahyog/utils/app_constants.dart';

import '../utils/preference_utils.dart';

class TrainerDashboardController extends GetxController{

  RxBool switchValue = false.obs;
  RxString SelectedDate = ''.obs;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   // print("Role from PreferenceUtils: $role");
  }
}
