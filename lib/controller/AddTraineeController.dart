import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahyog/Screens/AdminDashboard.dart';
import 'package:sahyog/model/RequestModel/AddTraineeRequestModel.dart';
import 'package:sahyog/model/ResponseModel/TrainerTraineeResponseModel.dart';
import 'package:sahyog/network/user_repository.dart';
import 'package:sahyog/widgets/DialogHelper.dart';

class AddTraineeController extends GetxController
{
  RxString imagePath = "".obs;

  final List<String> centers = ['Center1', 'Center2', 'Ceneter3'];

 // final RxString selectedCeneter= 'Center1'.obs;
  final RxString selectedCeneter= ''.obs;

  final RxBool isSubmitted = false.obs;

  final List<String> discount = ['30%', '40%', '50%'];

  final RxString selectedDiscount= '30%'.obs;


  final List<String> level = ['Beginner', 'Intermediate', 'Advanced'];
  final RxString selectedLevel = ''.obs;

  final List<String> Gender = ['Male', 'Female', 'Other'];
  final RxString selectedGender = ''.obs;

  final GlobalKey<FormState> traineeFormKey = GlobalKey<FormState>();
  String fullName="",age="",mobileNumber="",email="",yearsofExperience="",address="";
  late TextEditingController firstNameController,lastNameController,ageController,mobileNumberController,emailController,yearsofExperienceController,addressController;
  late TrainerTraineeResponseModel traineeResponseModel;
  final UserRepository userRepository;


  AddTraineeController(this.userRepository);

  @override
  void onInit() {
    firstNameController=TextEditingController();
    lastNameController=TextEditingController();
    ageController=TextEditingController();
    mobileNumberController=TextEditingController();
    emailController=TextEditingController();
    yearsofExperienceController=TextEditingController();
    addressController=TextEditingController();
  }

  Future openCamera() async{
    final ImagePicker openCameraPicker = ImagePicker();
    final image = await openCameraPicker.pickImage(source: ImageSource.camera);
    if(image!=null){
      imagePath.value = image.path.toString();
    }
  }

  Future openGallery() async{
    final ImagePicker openCameraPicker = ImagePicker();
    final image = await openCameraPicker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      imagePath.value = image.path.toString();
    }
  }
  Future<TrainerTraineeResponseModel> addTrainee() async
  {

    final isValid = traineeFormKey.currentState!.validate();
    if(isValid)
    {
      DialogHelper.showLoading();
      traineeFormKey.currentState!.save();
      AddTraineeRequestModel addTraineeRequestModel = AddTraineeRequestModel(
          firstName: firstNameController.text.toString(),
          lastName: lastNameController.text.toString(),
          gender: "Male",
          age: num.parse(ageController.text.toString()),
          username: emailController.text.toString(),
          password: "prismatic123",
          photo: null,
          contact: mobileNumberController.text.toString(),
          email: emailController.text.toString(),
          address:addressController.text.toString(),
          role: 3,
         //center: selectedCeneter.value.toString(),
         center: 3,
        trainingType: selectedLevel.value.toString(),
        feesPaid: "Yes"
      );
      traineeResponseModel= await userRepository.addTrainee(addTraineeRequestModel);
      if(traineeResponseModel.status==200){
        DialogHelper.hideLoading();
       Get.snackbar("Trainee Created!",traineeResponseModel.message.toString(),snackPosition: SnackPosition.BOTTOM);
       Get.to(AdminDasboard());
      }
      else
        {
          DialogHelper.hideLoading();
          Get.snackbar("Something went wrong!",traineeResponseModel.message.toString(),snackPosition: SnackPosition.BOTTOM);
        }

    }

    return traineeResponseModel;
    print("isValid"+isValid.toString());
  }
}