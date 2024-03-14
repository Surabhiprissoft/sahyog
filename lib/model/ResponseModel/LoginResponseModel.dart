import 'dart:convert';
/// id : 14
/// profile_photo : null
/// email : "surabhi@prissoft.net"
/// first_name : "Surabhi"
/// last_name : "Loya"
/// username : "surabhi@prissoft.net"
/// role : 2
/// center : 3
/// phone : null
/// address : "pune"
/// gender : "Female"
/// dob : null
/// year_of_experience : 0
/// training_type : "Beginner"
/// discount : "0.00"
/// is_firsttime : false
/// created_at : "2024-03-14T15:29:49.255371+05:30"
/// updated_at : "2024-03-14T18:25:31.013320+05:30"
/// session_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzEwNDIxMjMxLCJpYXQiOjE3MTA0MjA5MzEsImp0aSI6ImE3MTgzNTQ2MDU2NDQxMDlhMWFiMTIzZjU0ZmViYWNjIiwidXNlcl9pZCI6IjE0In0.e09B_NXUXwN4k1d-m1QbSG8XJZMRkiffGiRnqSLOCrw"

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));
String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());
class LoginResponseModel {
  LoginResponseModel({
      int? id, 
      dynamic profilePhoto, 
      String? email, 
      String? firstName, 
      String? lastName, 
      String? username, 
      int? role, 
      int? center, 
      dynamic phone, 
      String? address, 
      String? gender, 
      dynamic dob, 
      int? yearOfExperience, 
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
    _dob = dob;
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
    _dob = json['dob'];
    _yearOfExperience = json['year_of_experience'];
    _trainingType = json['training_type'];
    _discount = json['discount'];
    _isFirsttime = json['is_firsttime'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _sessionToken = json['session_token'];
  }
  int? _id;
  dynamic _profilePhoto;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _username;
  int? _role;
  int? _center;
  dynamic _phone;
  String? _address;
  String? _gender;
  dynamic _dob;
  int? _yearOfExperience;
  String? _trainingType;
  String? _discount;
  bool? _isFirsttime;
  String? _createdAt;
  String? _updatedAt;
  String? _sessionToken;
LoginResponseModel copyWith({  int? id,
  dynamic profilePhoto,
  String? email,
  String? firstName,
  String? lastName,
  String? username,
  int? role,
  int? center,
  dynamic phone,
  String? address,
  String? gender,
  dynamic dob,
  int? yearOfExperience,
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
  dob: dob ?? _dob,
  yearOfExperience: yearOfExperience ?? _yearOfExperience,
  trainingType: trainingType ?? _trainingType,
  discount: discount ?? _discount,
  isFirsttime: isFirsttime ?? _isFirsttime,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  sessionToken: sessionToken ?? _sessionToken,
);
  int? get id => _id;
  dynamic get profilePhoto => _profilePhoto;
  String? get email => _email;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get username => _username;
  int? get role => _role;
  int? get center => _center;
  dynamic get phone => _phone;
  String? get address => _address;
  String? get gender => _gender;
  dynamic get dob => _dob;
  int? get yearOfExperience => _yearOfExperience;
  String? get trainingType => _trainingType;
  String? get discount => _discount;
  bool? get isFirsttime => _isFirsttime;
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
    map['dob'] = _dob;
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