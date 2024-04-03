
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sahyog/controller/FeeStatusResponseModel.dart';
import 'package:sahyog/model/BaseListResponse.dart';
import 'package:sahyog/model/RequestModel/MarkFeeStatusRequestModel.dart';
import 'package:sahyog/model/ResponseModel/CenterResponseModel.dart';
import 'package:sahyog/model/ResponseModel/TraineeListResponseModel.dart';
import 'package:sahyog/model/ResponseModel/TrainerTraineeResponseModel.dart';
import 'package:sahyog/network/user_repository.dart';
import 'package:sahyog/widgets/DialogHelper.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

import '../model/BaseSingleObjectResponse.dart';
import 'AdminDashboardController.dart';



class TraineeProfileController extends GetxController{

  RxString imagePath = "".obs;

  final RxBool isSubmitted = false.obs;

  final List<String> discount = ['30%', '40%', '50%'];

  final RxString selectedDiscount= '30%'.obs;

  RxInt selectedMonthIndex = 0.obs;
  var  slidingValue=1.obs;

  final List<String> level = ['Beginner', 'Intermediate', 'Advanced'];
  late final RxString selectedLevel;
  late final Rx<CenterResponseModel?> selectedCenter ;

  final List<String> Gender = ['Male', 'Female', 'Other'];
  late final RxString selectedGender ;

  late ListResponse<CenterResponseModel> centerResponseModel;
  late SingleResponse<FeeStatusResponseModel> feesStatusResponse;

  RxBool isReadOnly = true.obs;
  late String selectedYear;
  num currentTraineeId=0;
  List<CenterResponseModel> centerlist=[];

  RxList feeStatusList=[].obs;
  GlobalKey<FormState> profileTraineeFormKey = GlobalKey<FormState>();
  String fullName="",age="",mobileNumber="",email="",yearsofExperience="",address="";
  late TextEditingController firstNameController,lastNameController,ageController,mobileNumberController,emailController,yearsofExperienceController,addressController;

  late TrainerTraineeResponseModel feeMarkResponse;


  final UserRepository userRepository;
  TraineeProfileController(this.userRepository);



  void onInit() {
    TraineeListResponseModel trainee = Get.arguments;
    final String recivedGender = trainee.gender.toString();
    final String recivedLevel = trainee.trainingType.toString();
    getCenterList();
    generateFeesData(trainee.id!.toInt(),2024);
    selectedYear = '2024';
    currentTraineeId = trainee.id!;
    firstNameController=TextEditingController()..text = trainee.firstName.toString();
    lastNameController=TextEditingController()..text = trainee.lastName.toString();
    ageController=TextEditingController()..text = trainee.dob.toString();
    mobileNumberController=TextEditingController()..text = trainee.phone.toString();
    emailController=TextEditingController()..text = trainee.email.toString();
    yearsofExperienceController=TextEditingController();
    addressController=TextEditingController()..text = trainee.address.toString();
    selectedCenter=Rx<CenterResponseModel?>(null);
    selectedLevel = recivedLevel.obs;
    selectedGender = recivedGender.obs;
  }

  void clearControllers() {
    firstNameController.clear();
    lastNameController.clear();
    ageController.clear();
    mobileNumberController.clear();
    emailController.clear();
    yearsofExperienceController.clear();
    selectedCenter=Rx<CenterResponseModel?>(null);
    selectedGender= ''.obs;
    selectedLevel = ''.obs;
    addressController.clear();
    profileTraineeFormKey = GlobalKey<FormState>();
  }

  Future<void> getCenterList() async {
    //  DialogHelper.showLoading();
    try {
      centerResponseModel = await userRepository.getCenters();

      if (centerResponseModel.status == 200) {
        centerlist = centerResponseModel.data;
        centerlist.removeAt(0);
        // Notify listeners about the change in centerlist
        update();

      }
      else {
          showSnackBar("Error", centerResponseModel.message ?? "Failed to fetch center list",);
      }
    } catch (e) {
      DialogHelper.hideLoading();
      // DialogHelper.hideLoading();
      /*  Get.snackbar(
        "Error",
        "Failed to fetch center list: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );*/
    }


  }

  Future<void> generateFeesData(int userId,int year)async {

    feesStatusResponse = await userRepository.getFeeData(userId, year);
    if(feesStatusResponse.status == 200) {
      feeStatusList.value = feesStatusResponse.data.feesStatusByMonth!.toList();
      print("Hello Man ${feeStatusList.length}");


    } else {
      showSnackBar("Error", feesStatusResponse.message ?? "Failed to fetch fees data");
    }

  }


  Future<TrainerTraineeResponseModel> markFeeStatus(bool FeeStatus, int paymentMonth) async{

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    DialogHelper.showLoading();
    MarkFeeStatusRequestModel feeStatusRequestModel = MarkFeeStatusRequestModel(
      feesStatus: FeeStatus.toString(),
      paymentDate: formattedDate,
      userId: currentTraineeId,
      monthId: paymentMonth
    );
    feeMarkResponse= await userRepository.markFeeStatus(feeStatusRequestModel);

    if(feeMarkResponse.status==200)
      {
        DialogHelper.hideLoading();
        print("Inside 200");
        showSnackBar("Success", "updated fee status has been marked");
        generateFeesData(currentTraineeId.toInt(),2024);
        var adminController = Get.find<AdminDashboardController>();
        adminController.centerList.clear();
        adminController.getAdminDashboardData();
        update();
      }else{
      DialogHelper.hideLoading();
    }

    return feeMarkResponse;
  }

}