import 'package:get/get.dart';
import 'package:sahyog/model/ResponseModel/TraineeListResponseModel.dart';
import 'package:sahyog/network/user_repository.dart';

import '../widgets/other_common_widget.dart';

class ManageTraineeController extends GetxController{

  final UserRepository userRepository;
  ManageTraineeController(this.userRepository);

  late  RxList<TraineeListResponseModel> traineeList = <TraineeListResponseModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getTraineeList();
    super.onInit();
  }


  Future<void> getTraineeList() async {
    final response = await userRepository.getTraineeList();
    if (response.status == 200) {
      traineeList.assignAll(response.data);
      traineeList.value = traineeList.reversed.toList();
    } else {
      showSnackBar("Something went wrong", "Unable to fetch trainee list at the moment");
    }
  }

}