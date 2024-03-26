


import 'package:sahyog/Screens/AddTrainee.dart';
import 'package:sahyog/Screens/AdminDashboard.dart';
import 'package:sahyog/model/BaseListResponse.dart';
import 'package:sahyog/model/BaseSingleObjectResponse.dart';
import 'package:sahyog/model/RequestModel/AddTraineeRequestModel.dart';
import 'package:sahyog/model/RequestModel/AddTrainerRequestModel.dart';
import 'package:sahyog/model/RequestModel/ChangePasswordRequestModel.dart';
import 'package:sahyog/model/RequestModel/ForgotPasswordRequestModel.dart';
import 'package:sahyog/model/RequestModel/LoginRequestModel.dart';
import 'package:sahyog/model/RequestModel/RegistrationUpdateRequestModel.dart';
import 'package:sahyog/model/ResponseModel/AdminDashboardResponseModel.dart';
import 'package:sahyog/model/ResponseModel/CenterResponseModel.dart';
import 'package:sahyog/model/ResponseModel/ChangePasswordResponseModel.dart';
import 'package:sahyog/model/ResponseModel/LoginResponseModel.dart';
import 'package:sahyog/model/ResponseModel/TraineeListResponseModel.dart';
import 'package:sahyog/model/ResponseModel/TrainerListResponseModel.dart';
import 'package:sahyog/model/ResponseModel/TrainerTraineeResponseModel.dart';
import 'package:sahyog/network/api_baseHelper.dart';
import 'package:sahyog/utils/app_constants.dart';

class UserRepository{
  final ApiBaseHelper apiBaseHelper;

  UserRepository(this.apiBaseHelper);



  Future<ListResponse<CenterResponseModel>> getCenters() async {
    try {
      // Make an asynchronous API call to fetch the login response
      final user = await apiBaseHelper.getWithoutToken(AppConstants.GETCENTERS);

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
      print('Error occurred while Creating Trainer: $error');
      throw error;
    }
  }

  Future<TrainerTraineeResponseModel> trainerSelfRegistration(AddTrainerRequestModel addTrainerRequestModel) async {
    try {
      // Make an asynchronous API call to fetch the login response
      final trainertrainee = await apiBaseHelper.postWithoutToken(AppConstants.SELFREGISTERED, addTrainerRequestModel.toJson());
      return TrainerTraineeResponseModel.fromJson(trainertrainee);
    } catch (error) {
      // Handle any errors that occur during the API call
      print('Error occurred while Registration: $error');
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

  Future<TrainerTraineeResponseModel> traineeSelfRegistration(AddTraineeRequestModel addTraineeRequestModel) async {
    try {
      // Make an asynchronous API call to fetch the login response
      final trainertrainee = await apiBaseHelper.postWithoutToken(AppConstants.SELFREGISTERED, addTraineeRequestModel.toJson());
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

  Future<ChangePasswordResponseModel> ForgotUserPassword(ForgotPasswordRequestModel forgotPasswordRequestModel) async {
    try {
      // Make an asynchronous API call to fetch the login response
      final forgotPassword = await apiBaseHelper.patchWithoutToken(AppConstants.FORGOTPASSWORD,forgotPasswordRequestModel.toJson());
      return ChangePasswordResponseModel.fromJson(forgotPassword);
    } catch (error) {
      // Handle any errors that occur during the API call
      print('Error occurred while updating password: $error');
      throw error;
    }
  }



  Future<ListResponse<TrainerListResponseModel>> getTrainerList() async {
    try {
      // Make an asynchronous API call to fetch the login response
      final trainers = await apiBaseHelper.get(AppConstants.TRAINERLIST);

      // Parse the response JSON into a SingleResponse object
      ListResponse<TrainerListResponseModel> trainerListResponse = ListResponse.fromJson(
          trainers,
              (json) => TrainerListResponseModel.fromJson(json)
      );

      return trainerListResponse;
    } catch (error) {
      // Handle any errors that occur during the API call
      print('Error occurred while fetching trainer list: $error');
      throw error;
    }
  }

  Future<ListResponse<TrainerListResponseModel>> getUnApprovedTrainerList() async {
    try {
      // Make an asynchronous API call to fetch the login response
      final unApprovedTrainers = await apiBaseHelper.get(AppConstants.UNAPPROVEDRTAINERLIST);

      // Parse the response JSON into a SingleResponse object
      ListResponse<TrainerListResponseModel> trainerListResponse = ListResponse.fromJson(
          unApprovedTrainers,
              (json) => TrainerListResponseModel.fromJson(json)
      );

      return trainerListResponse;
    } catch (error) {
      // Handle any errors that occur during the API call
      print('Error occurred while fetching unapproved trainer list: $error');
      throw error;
    }
  }



  Future<ListResponse<TraineeListResponseModel>> getTraineeList() async {
    try {
      // Make an asynchronous API call to fetch the login response
      final trainees = await apiBaseHelper.get(AppConstants.TRAINEELIST);

      // Parse the response JSON into a SingleResponse object
      ListResponse<TraineeListResponseModel> traineeListResponse = ListResponse.fromJson(
          trainees,
              (json) => TraineeListResponseModel.fromJson(json)
      );

      return traineeListResponse;
    } catch (error) {
      // Handle any errors that occur during the API call
      print('Error occurred while fetching trainer list: $error');
      throw error;
    }
  }

  Future<ListResponse<TraineeListResponseModel>> getUnApprovedTraineeList() async {
    try {
      // Make an asynchronous API call to fetch the login response
      final unApprovedTrainees = await apiBaseHelper.get(AppConstants.UNAPPROVEDTRAINEELIST);

      // Parse the response JSON into a SingleResponse object
      ListResponse<TraineeListResponseModel> traineeListResponse = ListResponse.fromJson(
          unApprovedTrainees,
              (json) => TraineeListResponseModel.fromJson(json)
      );

      return traineeListResponse;
    } catch (error) {
      // Handle any errors that occur during the API call
      print('Error occurred while fetching trainer list: $error');
      throw error;
    }
  }

  Future<TrainerTraineeResponseModel> actionOnRegistrationRequest(RegistrationUpdateRequestModel registrationRequest,int userId) async {
    try {
      // Make an asynchronous API call to fetch the login response
      final response = await apiBaseHelper.patch("user/$userId/", registrationRequest.toJson());
      return TrainerTraineeResponseModel.fromJson(response);

    } catch (error) {
      // Handle any errors that occur during the API call
      print('Error occurred while checking login: $error');
      throw error;
    }
  }


  Future<SingleResponse<AdminDashboardResponseModel>> getAdminDashboardData() async {
    try {
      // Make an asynchronous API call to fetch the login response
      final details = await apiBaseHelper.get(AppConstants.ADMINDASHBOARD);

      // Parse the response JSON into a SingleResponse object
      SingleResponse<AdminDashboardResponseModel> detailList = SingleResponse.fromJson(
          details,
              (json) => AdminDashboardResponseModel.fromJson(json)
      );

      return detailList;
    } catch (error) {
      // Handle any errors that occur during the API call
      print('Error occurred while fetching Dashboard Data: $error');
      throw error;
    }
  }



}
