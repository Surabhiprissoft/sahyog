import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sahyog/model/ResponseModel/TrainerListResponseModel.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

import '../model/BaseListResponse.dart';
import '../network/user_repository.dart';

class ManageTrainerController extends GetxController {
  final UserRepository userRepository;

  var  slidingValue=1.obs;
  late  RxList<TrainerListResponseModel> trainerList = <TrainerListResponseModel>[].obs;
  DateFormat format12Hour = DateFormat("h:mm a");
  DateFormat format24Hour = DateFormat("HH:mm:ss");

  ManageTrainerController(this.userRepository);

  @override
  void onInit() {
    super.onInit();
    getTrainerList();
  }

  Future<List<TrainerListResponseModel>> getTrainerList() async {
    final response = await userRepository.getTrainerList();
    if (response.status == 200) {
      trainerList.assignAll(response.data);
      trainerList.value = trainerList.reversed.toList();
    } else {
      showSnackBar("Something went wrong", "Unable to fetch trainer list at the moment");
    }

    return trainerList;
  }
}
