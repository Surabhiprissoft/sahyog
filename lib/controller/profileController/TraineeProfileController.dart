
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sahyog/model/BaseSingleObjectResponse.dart';
import 'package:sahyog/model/RequestModel/UpdateTraineeDataRequestModel.dart';
import 'package:sahyog/model/ResponseModel/FeeStatusResponseModel.dart';
import 'package:sahyog/model/BaseListResponse.dart';
import 'package:sahyog/model/RequestModel/MarkFeeStatusRequestModel.dart';
import 'package:sahyog/model/ResponseModel/CenterResponseModel.dart';
import 'package:sahyog/model/ResponseModel/TraineeListResponseModel.dart';
import 'package:sahyog/model/ResponseModel/TrainerTraineeResponseModel.dart';
import 'package:sahyog/network/api_baseHelper.dart';
import 'package:sahyog/network/user_repository.dart';
import 'package:sahyog/widgets/DialogHelper.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

import '../../utils/AppCommonMethods.dart';
import '../dashboardController/AdminDashboardController.dart';
import '../traineeController/ManageTraineeController.dart';




class TraineeProfileController extends GetxController{

  RxString imagePath = "".obs;

  final RxBool isSubmitted = false.obs;

  final List<String> discount = ['30%', '40%', '50%'];

  final RxString selectedDiscount= '30%'.obs;

  RxInt selectedMonthIndex = 0.obs;
  var  slidingValue=1.obs;

  final List<String> level = ['Beginner', 'Intermediate', 'Advanced'];
  late final RxString selectedLevel;
  late Rx<CenterResponseModel?> selectedCenter=Rx<CenterResponseModel?>(null);

  final List<String> Gender = ['Male', 'Female', 'Other'];
  late final RxString selectedGender ;

  late ListResponse<CenterResponseModel> centerResponseModel;
  late SingleResponse<FeeStatusResponseModel> feesStatusResponse;

  RxBool isReadOnly = true.obs;
  late String selectedYear;
  num currentTraineeId=0;
  List<CenterResponseModel> centerlist=[];
  late final RxBool traineeStatus;

  RxBool _isSnackbarActive = false.obs ;
  RxList feeStatusList=[].obs;
  late String imageInBaseValue = "";
  late final userId;
  GlobalKey<FormState> profileTraineeFormKey = GlobalKey<FormState>();
  String fullName="",age="",mobileNumber="",email="",yearsofExperience="",address="";
  late TextEditingController firstNameController,lastNameController,ageController,mobileNumberController,emailController,yearsofExperienceController,addressController;

  late TrainerTraineeResponseModel feeMarkResponse;

  String centerId="",centerName="",centerAdd="";
  RxString userProfileImage ="".obs;


  final UserRepository userRepository;
  TraineeProfileController(this.userRepository);



  void onInit() async{
    TraineeListResponseModel trainee = Get.arguments;
    final String recivedGender = trainee.gender.toString();
    final String recivedLevel = trainee.trainingType.toString();
    final bool recivedStatus = trainee.isActive!;

    selectedYear = '2024';
    currentTraineeId = trainee.id!;
    firstNameController=TextEditingController()..text = trainee.firstName.toString();
    lastNameController=TextEditingController()..text = trainee.lastName.toString();
    ageController=TextEditingController()..text = trainee.dob.toString();
    mobileNumberController=TextEditingController()..text = trainee.phone.toString();
    emailController=TextEditingController()..text = trainee.email.toString();
    yearsofExperienceController=TextEditingController();
    addressController=TextEditingController()..text = trainee.address.toString();
    selectedLevel = recivedLevel.obs;
    selectedGender = recivedGender.obs;
    traineeStatus = recivedStatus.obs;
    userId=trainee.id;

    selectedCenter=Rx<CenterResponseModel?>(null);
    //selectedCenter.value =CenterResponseModel(id: trainee.centerId!.toInt(),name: trainee.centerName.toString(),address: trainee.centerAddress.toString());
    print("H"+trainee.centerId.toString()+" "+trainee.firstName.toString());


    await getCenterList();
    generateFeesData(trainee.id!.toInt());

    print("trainee.centerId: ${trainee.centerId}");
    print("Center IDs in centerList: ${centerlist.map((center) => center.id)}");

    bool centerExistsInList = centerlist.any((center) => center.id == trainee.centerId);
    if (centerExistsInList) {
      // Find the center in the centerList based on the received center ID
      CenterResponseModel? center = centerlist.firstWhere((center) => center.id == trainee.centerId);
      selectedCenter.value = center;
    } else {
      // Handle the case where the received center ID doesn't exist in the centerList
      // You can set a default center or display an error message
    }

    if(trainee.profilePhoto!=null)
    {
      String concatenatedString = ApiBaseHelper().imageBaseUrl.toString() + trainee.profilePhoto.toString();
      userProfileImage.value = concatenatedString;//ApiBaseHelper.imageBaseUrl.toString()+trainee.profilePhoto.toString()".obs;
      imagePath.value = concatenatedString;//"http://192.168.235.136:8000${trainee.profilePhoto.toString()}".obs;
      imageInBaseValue = await AppCommonMethods().getImageBase64FromUrl(userProfileImage.value);
    }

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
       // selectedCenter.value =CenterResponseModel(id: trainee.centerId!.toInt(),name: trainee.centerName.toString(),address: trainee.centerAddress.toString());

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

  Future<void> generateFeesData(int userId)async {

    feesStatusResponse = await userRepository.getFeeData(userId);
    if(feesStatusResponse.status == 200) {
      feeStatusList.value = feesStatusResponse.data.feesStatusByMonth!.toList();


    } else {
      showSnackBar("Error", feesStatusResponse.message ?? "Failed to fetch fees data");
    }

  }


  Future<TrainerTraineeResponseModel> markFeeStatus(bool FeeStatus, int paymentMonth,int paymentYear) async{

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    DialogHelper.showLoading();
    MarkFeeStatusRequestModel feeStatusRequestModel = MarkFeeStatusRequestModel(
      feesStatus: FeeStatus.toString(),
      paymentDate: formattedDate,
      userId: currentTraineeId,
      monthId: paymentMonth,
      yearId: paymentYear
    );
    feeMarkResponse= await userRepository.markFeeStatus(feeStatusRequestModel);
    print("status : ${feeMarkResponse.status.toString()}");
    if(feeMarkResponse.status==200)
      {
        _isSnackbarActive.value = true;
        DialogHelper.hideLoading();
        print("Inside 200");
        generateFeesData(currentTraineeId.toInt());
        var adminController = Get.find<AdminDashboardController>();
        adminController.centerList.clear();
        adminController.getAdminDashboardData();

        var manageTraineeController = Get.find<ManageTraineeController>();
        manageTraineeController.getTraineeList();
        update();

        Get.snackbar("Success", "Updated fee status has been marked",snackPosition: SnackPosition.BOTTOM,snackbarStatus: (status) {
        if(status!=SnackbarStatus.CLOSED){
          isReadOnly.value=true;
          }
        else{
          isReadOnly.value=false;
          }

        },);
        print("hi $isReadOnly");
      //  showSnackBar("Success", "updated fee status has been marked");

      }else{
      DialogHelper.hideLoading();
    }

    return feeMarkResponse;
  }


  Future<void> onUpdateTraineeData() async {

    final isValid = profileTraineeFormKey.currentState!.validate();

    if(isValid){
      DialogHelper.showLoading();
      profileTraineeFormKey.currentState!.save();

      UpdateTraineeDataRequestModel updateTraineeData = UpdateTraineeDataRequestModel(
          firstName: firstNameController.text.toString(),
          lastName: lastNameController.text.toString(),
          gender: selectedGender.value.toString(),
          dob: ageController.text.toString(),
          profilePhoto: imageInBaseValue,/*trainer.profilePhoto.toString() == null
              ? null
              : AppCommonMethods().getBase64Image(imagePath.value),*/

          phone: mobileNumberController.text.toString(),
          email: emailController.text.toString(),
          address: addressController.text.toString(),
          isActive: traineeStatus.value,
          trainingType: selectedLevel.value.toString(),
          center: selectedCenter.value?.id
      );

      final response = await  userRepository.updateTraineeData(updateTraineeData,userId);

      if(response.status==200){
        DialogHelper.hideLoading();
        var manageTraineeController = Get.find<ManageTraineeController>();
        manageTraineeController.getTraineeList();
        var adminController = Get.find<AdminDashboardController>();
        adminController.centerList.clear();
        adminController.getAdminDashboardData();
        //Get.snackbar("Trainee data updated successfully","");
        showSnackBar("Trainee data updated successfully","");
      }else{
        DialogHelper.hideLoading();
        showSnackBar("Error",response.message.toString());
      }

    }
    else{
      showSnackBar("All fileds are mandatory", "Please fill the data in all fields");
    }

  }



  Future openCamera() async {
    final ImagePicker openCameraPicker = ImagePicker();
    final image = await openCameraPicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath.value = image.path.toString();
      imageInBaseValue =  AppCommonMethods().getBase64Image(image.path.toString());
    }
  }

  Future openGallery() async {
    final ImagePicker openCameraPicker = ImagePicker();
    final image = await openCameraPicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path.toString();
      imageInBaseValue =  AppCommonMethods().getBase64Image(image.path.toString());
    }
  }

  Future<void> delay() async {
    await Future.delayed(const Duration(seconds: 3));
  }



}

