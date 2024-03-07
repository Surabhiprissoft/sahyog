class AppConstants
{
  // API EXCEPTIONS
  static const NO_INTERNET = "Please check your internet connection";
  static const BAD_REQUEST = "Bad request";
  static const INTERNAL_SERVER = "Internal server error";
  static const RESOURCE_NOT_FOUND = "Resource not found";
  static const INVALID_TOKEN = "Unauthorised user";
  static const USER_EXISTS = "User already exists";
  static const INVALID_USER = "Invalid username or password";
  static const USERNAME = "Username";

  // TOKEN
  static const USER_TOKEN = "UserToken";
  static const USER_ID = "UserId";
  static const BOOK_ID = "bookId";
  static const ROLE = "Role";
  static const USER_MOBILE = "Mobile";
  static const USER_EMAIL = "Email";
  static const PROFILE_UPDATED = "profile";

  //ENDPOINT OF API

  static const LOGIN="login/";
  static const OTP_REQUEST="UserManagement/auth/otpRequest";
  static const SIGN_UP="UserManagement/auth/signup";

  static const RESET_PASSWORD="UserManagement/auth/userGuid";
  static const CHECK_EMAIL="UserManagement/auth/checkIdExist?user_guid=";
  static const SAVE_PROFILE="UserProfile/update";




}