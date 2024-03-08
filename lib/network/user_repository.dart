


import 'package:sahyog/Screens/AddTrainee.dart';
import 'package:sahyog/model/BaseSingleObjectResponse.dart';
import 'package:sahyog/model/RequestModel/AddTraineeRequestModel.dart';
import 'package:sahyog/model/RequestModel/AddTrainerRequestModel.dart';
import 'package:sahyog/model/RequestModel/LoginRequestModel.dart';
import 'package:sahyog/model/ResponseModel/LoginResponseModel.dart';
import 'package:sahyog/network/api_baseHelper.dart';
import 'package:sahyog/utils/app_constants.dart';

class UserRepository{
  final ApiBaseHelper apiBaseHelper;

  UserRepository(this.apiBaseHelper);


  Future<LoginResponseModel> login(LoginRequestModel loginRequest) async
  {

   /* var data = {"emailAddress": loginRequest.email.toString(), "user_password": loginRequest.userPassword.toString()};
    print("login_data ="+data.toString());*/
    final user = await apiBaseHelper.post(AppConstants.LOGIN, loginRequest.toJson());
    print("USER DATA ${user}");
    return LoginResponseModel.fromJson(user);

  }



  Future<SingleResponse<LoginResponseModel>> checkLogin(LoginRequestModel loginRequest) async {
    try {
      // Make an asynchronous API call to fetch the login response
      final user = await apiBaseHelper.post(AppConstants.LOGIN, loginRequest.toJson());

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


  Future<SingleResponse<LoginResponseModel>> addTrainer(AddTrainerRequestModel addTrainerRequestModel) async {
    try {
      // Make an asynchronous API call to fetch the login response
      final user = await apiBaseHelper.post(AppConstants.ADDTRAINER, addTrainerRequestModel.toJson());

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

  Future<SingleResponse<LoginResponseModel>> addTrainee(AddTraineeRequestModel addTraineeRequestModel) async {
    try {
      // Make an asynchronous API call to fetch the login response
      final user = await apiBaseHelper.post(AppConstants.ADDTRAINEE, addTraineeRequestModel.toJson());

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
/*  Future<LoginResponse> login(LoginRequest loginRequest) async
  {

    var data = {"emailAddress": loginRequest.email.toString(), "user_password": loginRequest.userPassword.toString()};
    print("login_data ="+data.toString());
    final user = await apiBaseHelper.post(AppConstants.LOGIN, loginRequest.toJson());
    print("USER DATA ${user}");
    return LoginResponse.fromJson(user);

  }


  Future<ResponseOtp> signup_OTP(RequestOtp requestOtp) async
  {

    //var data = {"emailAddress": requestOtp.email.toString(), "user_password": requestOtp.userPassword.toString()};
    //print("requset_otp =$data");
    final otpdata = await apiBaseHelper.post(AppConstants.OTP_REQUEST, requestOtp.toJson());
    print("OTP DATA ${otpdata}");
    return ResponseOtp.fromJson(otpdata);

  }

  Future<SignUpResponse> signUp(SignUpRequest signUpRequest) async
  {

    final sign_up_data = await apiBaseHelper.post(AppConstants.SIGN_UP, signUpRequest.toJson());
    print("Sign_up DATA ${sign_up_data}");
    return SignUpResponse.fromJson(sign_up_data);

  }

  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest resetPasswordRequest) async
  {
    final resetPassword = await apiBaseHelper.post(AppConstants.RESET_PASSWORD, resetPasswordRequest.toJson());
    print("resetPassword DATA ${resetPassword}");
    return ResetPasswordResponse.fromJson(resetPassword);

  }

  Future<CheckGuidExist> checkGuid(String Guid) async
  {
    final guidData = await apiBaseHelper.get(AppConstants.CHECK_EMAIL+Guid);
    print("guidexist DATA ${guidData}");
    return CheckGuidExist.fromJson(guidData);

  }

  Future<SaveProfileResponse> saveProfile(SaveProfileRequest SaveProfileRequest) async
  {

    final save_profile_data = await apiBaseHelper.post(AppConstants.SAVE_PROFILE, SaveProfileRequest.toJson());
    print("save_profile DATA ${save_profile_data}");
    return SaveProfileResponse.fromJson(save_profile_data);

  }*/


}
