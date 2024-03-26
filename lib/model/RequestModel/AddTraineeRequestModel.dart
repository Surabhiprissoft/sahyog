import 'dart:convert';
/// profile_photo : ""
/// first_name : "trainee"
/// last_name : "testing"
/// gender : "male"
/// dob : "2001-05-22"
/// username : "trainee"
/// password : "prismatic123"
/// phone : "9255275469"
/// email : "hrutik.2406@gmail.com"
/// address : "Pune, Maharashtra"
/// role : 2
/// center : 5
/// training_type : "Intermediate"
/// discount : 10
/// is_approve : true
/// is_active : true

AddTraineeRequestModel addTraineeRequestModelFromJson(String str) => AddTraineeRequestModel.fromJson(json.decode(str));
String addTraineeRequestModelToJson(AddTraineeRequestModel data) => json.encode(data.toJson());
class AddTraineeRequestModel {
  AddTraineeRequestModel({
      String? profilePhoto, 
      String? firstName, 
      String? lastName, 
      String? gender, 
      String? dob, 
      String? username, 
      String? password, 
      String? phone, 
      String? email, 
      String? address, 
      num? role, 
      num? center, 
      String? trainingType, 
      num? discount, 
      bool? isApprove, 
      bool? isActive,}){
    _profilePhoto = profilePhoto;
    _firstName = firstName;
    _lastName = lastName;
    _gender = gender;
    _dob = dob;
    _username = username;
    _password = password;
    _phone = phone;
    _email = email;
    _address = address;
    _role = role;
    _center = center;
    _trainingType = trainingType;
    _discount = discount;
    _isApprove = isApprove;
    _isActive = isActive;
}

  AddTraineeRequestModel.fromJson(dynamic json) {
    _profilePhoto = json['profile_photo'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _gender = json['gender'];
    _dob = json['dob'];
    _username = json['username'];
    _password = json['password'];
    _phone = json['phone'];
    _email = json['email'];
    _address = json['address'];
    _role = json['role'];
    _center = json['center'];
    _trainingType = json['training_type'];
    _discount = json['discount'];
    _isApprove = json['is_approve'];
    _isActive = json['is_active'];
  }
  String? _profilePhoto;
  String? _firstName;
  String? _lastName;
  String? _gender;
  String? _dob;
  String? _username;
  String? _password;
  String? _phone;
  String? _email;
  String? _address;
  num? _role;
  num? _center;
  String? _trainingType;
  num? _discount;
  bool? _isApprove;
  bool? _isActive;
AddTraineeRequestModel copyWith({  String? profilePhoto,
  String? firstName,
  String? lastName,
  String? gender,
  String? dob,
  String? username,
  String? password,
  String? phone,
  String? email,
  String? address,
  num? role,
  num? center,
  String? trainingType,
  num? discount,
  bool? isApprove,
  bool? isActive,
}) => AddTraineeRequestModel(  profilePhoto: profilePhoto ?? _profilePhoto,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  gender: gender ?? _gender,
  dob: dob ?? _dob,
  username: username ?? _username,
  password: password ?? _password,
  phone: phone ?? _phone,
  email: email ?? _email,
  address: address ?? _address,
  role: role ?? _role,
  center: center ?? _center,
  trainingType: trainingType ?? _trainingType,
  discount: discount ?? _discount,
  isApprove: isApprove ?? _isApprove,
  isActive: isActive ?? _isActive,
);
  String? get profilePhoto => _profilePhoto;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get gender => _gender;
  String? get dob => _dob;
  String? get username => _username;
  String? get password => _password;
  String? get phone => _phone;
  String? get email => _email;
  String? get address => _address;
  num? get role => _role;
  num? get center => _center;
  String? get trainingType => _trainingType;
  num? get discount => _discount;
  bool? get isApprove => _isApprove;
  bool? get isActive => _isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profile_photo'] = _profilePhoto;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['gender'] = _gender;
    map['dob'] = _dob;
    map['username'] = _username;
    map['password'] = _password;
    map['phone'] = _phone;
    map['email'] = _email;
    map['address'] = _address;
    map['role'] = _role;
    map['center'] = _center;
    map['training_type'] = _trainingType;
    map['discount'] = _discount;
    map['is_approve'] = _isApprove;
    map['is_active'] = _isActive;
    return map;
  }

}