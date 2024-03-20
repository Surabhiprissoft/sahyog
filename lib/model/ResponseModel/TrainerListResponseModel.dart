import 'dart:convert';
/// id : 2
/// username : "trainer1"
/// email : "trainer1"
/// role : "trainer"
/// profile_photo : "/media/trainer1-free-nature-images.jpg"
/// first_name : ""
/// last_name : ""
/// gender : null
/// phone : null
/// address : " "
/// center : "NoCenter"
/// created_at : "2024-03-10T15:13:07.853545Z"
/// modified_at : "2024-03-10T15:13:07.853545Z"
/// year_of_experience : 0
/// training_type : ""
/// discount : "0.00"

TrainerListResponseModel trainerListResponseModelFromJson(String str) => TrainerListResponseModel.fromJson(json.decode(str));
String trainerListResponseModelToJson(TrainerListResponseModel data) => json.encode(data.toJson());
class TrainerListResponseModel {
  TrainerListResponseModel({
      num? id, 
      String? username, 
      String? email, 
      String? role, 
      String? profilePhoto, 
      String? firstName, 
      String? lastName, 
      dynamic gender, 
      dynamic phone, 
      String? address, 
      String? center, 
      String? createdAt, 
      String? modifiedAt, 
      num? yearOfExperience, 
      String? trainingType, 
      String? discount,}){
    _id = id;
    _username = username;
    _email = email;
    _role = role;
    _profilePhoto = profilePhoto;
    _firstName = firstName;
    _lastName = lastName;
    _gender = gender;
    _phone = phone;
    _address = address;
    _center = center;
    _createdAt = createdAt;
    _modifiedAt = modifiedAt;
    _yearOfExperience = yearOfExperience;
    _trainingType = trainingType;
    _discount = discount;
}

  @override
  String toString() {
    return 'TrainerListResponseModel{_id: $_id, _username: $_username, _email: $_email, _role: $_role, _profilePhoto: $_profilePhoto, _firstName: $_firstName, _lastName: $_lastName, _gender: $_gender, _phone: $_phone, _address: $_address, _center: $_center, _createdAt: $_createdAt, _modifiedAt: $_modifiedAt, _yearOfExperience: $_yearOfExperience, _trainingType: $_trainingType, _discount: $_discount}';
  }

  TrainerListResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _email = json['email'];
    _role = json['role'];
    _profilePhoto = json['profile_photo'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _gender = json['gender'];
    _phone = json['phone'];
    _address = json['address'];
    _center = json['center'];
    _createdAt = json['created_at'];
    _modifiedAt = json['modified_at'];
    _yearOfExperience = json['year_of_experience'];
    _trainingType = json['training_type'];
    _discount = json['discount'];
  }
  num? _id;
  String? _username;
  String? _email;
  String? _role;
  String? _profilePhoto;
  String? _firstName;
  String? _lastName;
  dynamic _gender;
  dynamic _phone;
  String? _address;
  String? _center;
  String? _createdAt;
  String? _modifiedAt;
  num? _yearOfExperience;
  String? _trainingType;
  String? _discount;
TrainerListResponseModel copyWith({  num? id,
  String? username,
  String? email,
  String? role,
  String? profilePhoto,
  String? firstName,
  String? lastName,
  dynamic gender,
  dynamic phone,
  String? address,
  String? center,
  String? createdAt,
  String? modifiedAt,
  num? yearOfExperience,
  String? trainingType,
  String? discount,
}) => TrainerListResponseModel(  id: id ?? _id,
  username: username ?? _username,
  email: email ?? _email,
  role: role ?? _role,
  profilePhoto: profilePhoto ?? _profilePhoto,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  gender: gender ?? _gender,
  phone: phone ?? _phone,
  address: address ?? _address,
  center: center ?? _center,
  createdAt: createdAt ?? _createdAt,
  modifiedAt: modifiedAt ?? _modifiedAt,
  yearOfExperience: yearOfExperience ?? _yearOfExperience,
  trainingType: trainingType ?? _trainingType,
  discount: discount ?? _discount,
);
  num? get id => _id;
  String? get username => _username;
  String? get email => _email;
  String? get role => _role;
  String? get profilePhoto => _profilePhoto;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  dynamic get gender => _gender;
  dynamic get phone => _phone;
  String? get address => _address;
  String? get center => _center;
  String? get createdAt => _createdAt;
  String? get modifiedAt => _modifiedAt;
  num? get yearOfExperience => _yearOfExperience;
  String? get trainingType => _trainingType;
  String? get discount => _discount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['email'] = _email;
    map['role'] = _role;
    map['profile_photo'] = _profilePhoto;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['gender'] = _gender;
    map['phone'] = _phone;
    map['address'] = _address;
    map['center'] = _center;
    map['created_at'] = _createdAt;
    map['modified_at'] = _modifiedAt;
    map['year_of_experience'] = _yearOfExperience;
    map['training_type'] = _trainingType;
    map['discount'] = _discount;
    return map;
  }

}