import 'dart:convert';
/// profile_photo : ""
/// first_name : "trainee"
/// last_name : "testing"
/// gender : "male"
/// dob : "2001-05-22"
/// phone : "9255275469"
/// email : "hrutik.2406@gmail.com"
/// address : "Pune, Maharashtra"
/// center : 5
/// training_type : "Intermediate"
/// is_active : true

UpdateTraineeDataRequestModel updateTraineeDataRequestModelFromJson(String str) => UpdateTraineeDataRequestModel.fromJson(json.decode(str));
String updateTraineeDataRequestModelToJson(UpdateTraineeDataRequestModel data) => json.encode(data.toJson());
class UpdateTraineeDataRequestModel {
  UpdateTraineeDataRequestModel({
      String? profilePhoto, 
      String? firstName, 
      String? lastName, 
      String? gender, 
      String? dob, 
      String? phone, 
      String? email, 
      String? address, 
      num? center, 
      String? trainingType, 
      bool? isActive,}){
    _profilePhoto = profilePhoto;
    _firstName = firstName;
    _lastName = lastName;
    _gender = gender;
    _dob = dob;
    _phone = phone;
    _email = email;
    _address = address;
    _center = center;
    _trainingType = trainingType;
    _isActive = isActive;
}

  UpdateTraineeDataRequestModel.fromJson(dynamic json) {
    _profilePhoto = json['profile_photo'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _gender = json['gender'];
    _dob = json['dob'];
    _phone = json['phone'];
    _email = json['email'];
    _address = json['address'];
    _center = json['center'];
    _trainingType = json['training_type'];
    _isActive = json['is_active'];
  }
  String? _profilePhoto;
  String? _firstName;
  String? _lastName;
  String? _gender;
  String? _dob;
  String? _phone;
  String? _email;
  String? _address;
  num? _center;
  String? _trainingType;
  bool? _isActive;
UpdateTraineeDataRequestModel copyWith({  String? profilePhoto,
  String? firstName,
  String? lastName,
  String? gender,
  String? dob,
  String? phone,
  String? email,
  String? address,
  num? center,
  String? trainingType,
  bool? isActive,
}) => UpdateTraineeDataRequestModel(  profilePhoto: profilePhoto ?? _profilePhoto,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  gender: gender ?? _gender,
  dob: dob ?? _dob,
  phone: phone ?? _phone,
  email: email ?? _email,
  address: address ?? _address,
  center: center ?? _center,
  trainingType: trainingType ?? _trainingType,
  isActive: isActive ?? _isActive,
);
  String? get profilePhoto => _profilePhoto;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get gender => _gender;
  String? get dob => _dob;
  String? get phone => _phone;
  String? get email => _email;
  String? get address => _address;
  num? get center => _center;
  String? get trainingType => _trainingType;
  bool? get isActive => _isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profile_photo'] = _profilePhoto;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['gender'] = _gender;
    map['dob'] = _dob;
    map['phone'] = _phone;
    map['email'] = _email;
    map['address'] = _address;
    map['center'] = _center;
    map['training_type'] = _trainingType;
    map['is_active'] = _isActive;
    return map;
  }

}