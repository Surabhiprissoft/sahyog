import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahyog/model/RequestModel/AddTrainerRequestModel.dart';
import 'package:sahyog/model/ResponseModel/TrainerTraineeResponseModel.dart';
import 'package:sahyog/network/user_repository.dart';

class AddTrainerController extends GetxController
{
  RxString imagePath = "".obs;

  final GlobalKey<FormState> trainerFormKey = GlobalKey<FormState>();
  String fullName="",age="",mobileNumber="",email="",yearsofExperience="",address="";
  late TextEditingController firstNameController,lastNameController,ageController,mobileNumberController,emailController,yearsofExperienceController,addressController;
  final UserRepository userRepository;

  late TrainerTraineeResponseModel trainerresponseModel;
  AddTrainerController(this.userRepository);

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

  Future<TrainerTraineeResponseModel> onAddTrainer()async
  {

    final isValid = trainerFormKey.currentState!.validate();
    if(isValid)
      {
        trainerFormKey.currentState!.save();
        AddTrainerRequestModel addTrainerRequestModel = AddTrainerRequestModel(
          firstName: firstNameController.text.toString(),
          lastName: lastNameController.text.toString(),
          gender: "Male",
          age: num.tryParse(ageController.text.toString()),
          username: "",
          password: "",
          contact: mobileNumberController.text.toString(),
          email: emailController.text.toString(),
          address:addressController.text.toString(),
          role: 2,
          photo: "",
          yearOfExperience:num.tryParse(yearsofExperienceController.text.toString())

        );

        print(addTrainerRequestModel);
        trainerresponseModel= await userRepository.addTrainer(addTrainerRequestModel);
        if(trainerresponseModel.status==200){
          Get.snackbar("Trainee Created!",trainerresponseModel.message.toString());
        }
        else
        {
          Get.snackbar("Something went wrong!",trainerresponseModel.message.toString());
        }

      }

         return trainerresponseModel;
    }
}