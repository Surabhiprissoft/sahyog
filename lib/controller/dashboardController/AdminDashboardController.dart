import 'package:get/get.dart';
import 'package:sahyog/model/BaseSingleObjectResponse.dart';
import 'package:sahyog/model/ResponseModel/AdminDashboardResponseModel.dart';
import 'package:sahyog/network/user_repository.dart';
import 'package:sahyog/widgets/other_common_widget.dart';


class AdminDashboardController extends GetxController{

  RxInt totalTrainerCount = 0.obs;
  RxInt totalTraineeCount = 0.obs;
  late RxList<Centers> centerList= <Centers>[].obs;
  late SingleResponse<AdminDashboardResponseModel> adminDashboardResponse;

  final UserRepository userRepository;
  AdminDashboardController(this.userRepository);

  @override
  void onInit() {
    super.onInit();
    print("Started Init");
    getAdminDashboardData();
    update();
  }


  Future<SingleResponse<AdminDashboardResponseModel>> getAdminDashboardData() async {
    adminDashboardResponse = await userRepository.getAdminDashboardData();
    print(adminDashboardResponse.data.toString());
    if (adminDashboardResponse.status == 200) {
      totalTrainerCount.value = adminDashboardResponse.data.trainerCount!.toInt();
      totalTraineeCount.value = adminDashboardResponse.data.traineeCount!.toInt();
      centerList.addAll(adminDashboardResponse.data.centers!.toList());
      centerList.removeAt(0);
      update();
    } else {
      showSnackBar("Something went wrong", "Unable to fetch Center list at the moment");
    }
    return adminDashboardResponse;
  }
}