import 'dart:convert';
/// id : 1
/// profile_photo : null
/// email : "admin@admin.com"
/// first_name : "john"
/// last_name : "doe"
/// username : "admin"
/// role : 3
/// phone : null
/// gender : null
/// year_of_experience : 0
/// training_type : ""
/// discount : "0.00"
/// is_firsttime : true
/// session_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzEwMTYxNzcyLCJpYXQiOjE3MTAxNjE0NzIsImp0aSI6IjRlNzEwNTAzNWE2ODQxNWE5MTMzNDc3YTMzMzcxZmI5IiwidXNlcl9pZCI6IjEifQ.VMIocPGsAsD-kiMLlNrRFar6mp53dD0VnB3dLMbj4fY"

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));
String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());
class LoginResponseModel {
  LoginResponseModel({
      num? id, 
      dynamic profilePhoto, 
      String? email, 
      String? firstName, 
      String? lastName, 
      String? username, 
      num? role, 
      dynamic phone, 
      dynamic gender, 
      num? yearOfExperience, 
      String? trainingType, 
      String? discount, 
      bool? isFirsttime, 
      String? sessionToken,}){
    _id = id;
    _profilePhoto = profilePhoto;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _username = username;
    _role = role;
    _phone = phone;
    _gender = gender;
    _yearOfExperience = yearOfExperience;
    _trainingType = trainingType;
    _discount = discount;
    _isFirsttime = isFirsttime;
    _sessionToken = sessionToken;
}

  LoginResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _profilePhoto = json['profile_photo'];
    _email = json['email'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _username = json['username'];
    _role = json['role'];
    _phone = json['phone'];
    _gender = json['gender'];
    _yearOfExperience = json['year_of_experience'];
    _trainingType = json['training_type'];
    _discount = json['discount'];
    _isFirsttime = json['is_firsttime'];
    _sessionToken = json['session_token'];
  }
  num? _id;
  dynamic _profilePhoto;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _username;
  num? _role;
  dynamic _phone;
  dynamic _gender;
  num? _yearOfExperience;
  String? _trainingType;
  String? _discount;
  bool? _isFirsttime;
  String? _sessionToken;
LoginResponseModel copyWith({  num? id,
  dynamic profilePhoto,
  String? email,
  String? firstName,
  String? lastName,
  String? username,
  num? role,
  dynamic phone,
  dynamic gender,
  num? yearOfExperience,
  String? trainingType,
  String? discount,
  bool? isFirsttime,
  String? sessionToken,
}) => LoginResponseModel(  id: id ?? _id,
  profilePhoto: profilePhoto ?? _profilePhoto,
  email: email ?? _email,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  username: username ?? _username,
  role: role ?? _role,
  phone: phone ?? _phone,
  gender: gender ?? _gender,
  yearOfExperience: yearOfExperience ?? _yearOfExperience,
  trainingType: trainingType ?? _trainingType,
  discount: discount ?? _discount,
  isFirsttime: isFirsttime ?? _isFirsttime,
  sessionToken: sessionToken ?? _sessionToken,
);
  num? get id => _id;
  dynamic get profilePhoto => _profilePhoto;
  String? get email => _email;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get username => _username;
  num? get role => _role;
  dynamic get phone => _phone;
  dynamic get gender => _gender;
  num? get yearOfExperience => _yearOfExperience;
  String? get trainingType => _trainingType;
  String? get discount => _discount;
  bool? get isFirsttime => _isFirsttime;
  String? get sessionToken => _sessionToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['profile_photo'] = _profilePhoto;
    map['email'] = _email;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['username'] = _username;
    map['role'] = _role;
    map['phone'] = _phone;
    map['gender'] = _gender;
    map['year_of_experience'] = _yearOfExperience;
    map['training_type'] = _trainingType;
    map['discount'] = _discount;
    map['is_firsttime'] = _isFirsttime;
    map['session_token'] = _sessionToken;
    return map;
  }

}