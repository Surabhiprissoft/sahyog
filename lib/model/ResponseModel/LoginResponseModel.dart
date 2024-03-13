import 'dart:convert';
/// id : 1
/// profile_photo : null
/// email : "admin@admin.com"
/// first_name : "john"
/// last_name : "doe"
/// username : "admin"
/// role : 3
/// center : 1
/// phone : null
/// address : " "
/// gender : null
/// year_of_experience : 0
/// training_type : ""
/// discount : "0.00"
/// is_firsttime : true
/// created_at : "2024-03-10T15:06:33.553704Z"
/// updated_at : "2024-03-12T06:53:02.746863Z"
/// session_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzEwMjI2NjgyLCJpYXQiOjE3MTAyMjYzODIsImp0aSI6ImQ1NWQ1YWJkMmE0NzQ3Zjc4YWQzMzFkYzA4YTViMWI0IiwidXNlcl9pZCI6IjEifQ.1mvcmrn3Rf0ECnYv3FpHxOA1mefhYUSJhs0MXouGP8g"

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
      num? center, 
      dynamic phone, 
      String? address, 
      dynamic gender, 
      num? yearOfExperience, 
      String? trainingType, 
      String? discount, 
      bool? isFirsttime, 
      String? createdAt, 
      String? updatedAt, 
      String? sessionToken,}){
    _id = id;
    _profilePhoto = profilePhoto;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _username = username;
    _role = role;
    _center = center;
    _phone = phone;
    _address = address;
    _gender = gender;
    _yearOfExperience = yearOfExperience;
    _trainingType = trainingType;
    _discount = discount;
    _isFirsttime = isFirsttime;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
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
    _center = json['center'];
    _phone = json['phone'];
    _address = json['address'];
    _gender = json['gender'];
    _yearOfExperience = json['year_of_experience'];
    _trainingType = json['training_type'];
    _discount = json['discount'];
    _isFirsttime = json['is_firsttime'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _sessionToken = json['session_token'];
  }
  num? _id;
  dynamic _profilePhoto;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _username;
  num? _role;
  num? _center;
  dynamic _phone;
  String? _address;
  dynamic _gender;
  num? _yearOfExperience;
  String? _trainingType;
  String? _discount;
  bool? _isFirsttime;
  String? _createdAt;
  String? _updatedAt;
  String? _sessionToken;
LoginResponseModel copyWith({  num? id,
  dynamic profilePhoto,
  String? email,
  String? firstName,
  String? lastName,
  String? username,
  num? role,
  num? center,
  dynamic phone,
  String? address,
  dynamic gender,
  num? yearOfExperience,
  String? trainingType,
  String? discount,
  bool? isFirsttime,
  String? createdAt,
  String? updatedAt,
  String? sessionToken,
}) => LoginResponseModel(  id: id ?? _id,
  profilePhoto: profilePhoto ?? _profilePhoto,
  email: email ?? _email,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  username: username ?? _username,
  role: role ?? _role,
  center: center ?? _center,
  phone: phone ?? _phone,
  address: address ?? _address,
  gender: gender ?? _gender,
  yearOfExperience: yearOfExperience ?? _yearOfExperience,
  trainingType: trainingType ?? _trainingType,
  discount: discount ?? _discount,
  isFirsttime: isFirsttime ?? _isFirsttime,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  sessionToken: sessionToken ?? _sessionToken,
);
  num? get id => _id;
  dynamic get profilePhoto => _profilePhoto;
  String? get email => _email;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get username => _username;
  num? get role => _role;
  num? get center => _center;
  dynamic get phone => _phone;
  String? get address => _address;
  dynamic get gender => _gender;
  num? get yearOfExperience => _yearOfExperience;
  String? get trainingType => _trainingType;
  String? get discount => _discount;
  bool? get isFirsttime => _isFirsttime;

  @override
  String toString() {
    return 'LoginResponseModel{_id: $_id, _profilePhoto: $_profilePhoto, _email: $_email, _firstName: $_firstName, _lastName: $_lastName, _username: $_username, _role: $_role, _center: $_center, _phone: $_phone, _address: $_address, _gender: $_gender, _yearOfExperience: $_yearOfExperience, _trainingType: $_trainingType, _discount: $_discount, _isFirsttime: $_isFirsttime, _createdAt: $_createdAt, _updatedAt: $_updatedAt, _sessionToken: $_sessionToken}';
  }

  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
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
    map['center'] = _center;
    map['phone'] = _phone;
    map['address'] = _address;
    map['gender'] = _gender;
    map['year_of_experience'] = _yearOfExperience;
    map['training_type'] = _trainingType;
    map['discount'] = _discount;
    map['is_firsttime'] = _isFirsttime;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['session_token'] = _sessionToken;
    return map;
  }

}