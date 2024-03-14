


import 'package:sahyog/Screens/AddTrainee.dart';
import 'package:sahyog/model/BaseListResponse.dart';
import 'package:sahyog/model/BaseSingleObjectResponse.dart';
import 'package:sahyog/model/RequestModel/AddTraineeRequestModel.dart';
import 'package:sahyog/model/RequestModel/AddTrainerRequestModel.dart';
import 'package:sahyog/model/RequestModel/ChangePasswordRequestModel.dart';
import 'package:sahyog/model/RequestModel/LoginRequestModel.dart';
import 'package:sahyog/model/ResponseModel/CenterResponseModel.dart';
import 'package:sahyog/model/ResponseModel/ChangePasswordResponseModel.dart';
import 'package:sahyog/model/ResponseModel/LoginResponseModel.dart';
import 'package:sahyog/model/ResponseModel/TrainerTraineeResponseModel.dart';
import 'package:sahyog/network/api_baseHelper.dart';
import 'package:sahyog/utils/app_constants.dart';

class UserRepository{
  final ApiBaseHelper apiBaseHelper;

  UserRepository(this.apiBaseHelper);



  Future<ListResponse<CenterResponseModel>> getCenters() async {
    try {
      // Make an asynchronous API call to fetch the login response
      final user = await apiBaseHelper.get(AppConstants.GETCENTERS);

      // Parse the response JSON into a SingleResponse object
      ListResponse<CenterResponseModel> centerResponse = ListResponse.fromJson(
          user,
              (json) => CenterResponseModel.fromJson(json)
      );

      return centerResponse;
    } catch (error) {
      // Handle any errors that occur during the API call
      print('Error occurred while checking login: $error');
      throw error;
    }
  }

  Future<SingleResponse<LoginResponseModel>> checkLogin(LoginRequestModel loginRequest) async {
    try {
      // Make an asynchronous API call to fetch the login response
      final user = await apiBaseHelper.postWithoutToken(AppConstants.LOGIN, loginRequest.toJson());

      // Parse the response JSON into a SingleResponse object
      SingleResponse<LoginResponseModel> loginResponse = SingleResponse.fromJson(
          user,
              (json) => LoginResponseModel.fromJson(json)
      );

      return loginResponse;
    } catch (error) {
      // Handle any errors that occur during the API call
      print('Error occurred while checking login: $error');
      throw error;
    }
  }


  Future<TrainerTraineeResponseModel> addTrainer(AddTrainerRequestModel addTrainerRequestModel) async {
    try {
      // Make an asynchronous API call to fetch the login response
      final trainertrainee = await apiBaseHelper.post(AppConstants.ADDTRAINER, addTrainerRequestModel.toJson());
      return TrainerTraineeResponseModel.fromJson(trainertrainee);
    } catch (error) {
      // Handle any errors that occur during the API call
      print('Error occurred while checking login: $error');
      throw error;
    }
  }

  Future<TrainerTraineeResponseModel> addTrainee(AddTraineeRequestModel addTraineeRequestModel) async {
    try {
      // Make an asynchronous API call to fetch the login response
      final trainertrainee = await apiBaseHelper.post(AppConstants.ADDTRAINEE, addTraineeRequestModel.toJson());
      return TrainerTraineeResponseModel.fromJson(trainertrainee);
    } catch (error) {
      // Handle any errors that occur during the API call
      print('Error occurred while checking login: $error');
      throw error;
    }
  }

  Future<ChangePasswordResponseModel> ChangeUserPassword(ChangePasswordRequestModel changePasswordRequestModel) async {
    try {
      // Make an asynchronous API call to fetch the login response
      final changePassword = await apiBaseHelper.patch(AppConstants.UPDATEPASSWORD,changePasswordRequestModel.toJson());
      return ChangePasswordResponseModel.fromJson(changePassword);
    } catch (error) {
      // Handle any errors that occur during the API call
      print('Error occurred while updating password: $error');
      throw error;
    }
  }


}
