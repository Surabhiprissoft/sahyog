


import 'package:sahyog/network/api_baseHelper.dart';

class UserRepository{
  final ApiBaseHelper apiBaseHelper;

  UserRepository(this.apiBaseHelper);


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