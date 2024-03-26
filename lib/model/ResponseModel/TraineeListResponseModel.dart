import 'dart:convert';
/// id : 47
/// username : "musadsarguru@prissoft.net"
/// email : "musadsarguru@prissoft.net"
/// role : "trainee"
/// profile_photo : "/media/musadsarguruprissoft.net-2846f789-464b-4e94-92ab-68bb35e2d453.jpg"
/// first_name : "Musad"
/// last_name : "Sarguru"
/// gender : "Male"
/// dob : "2000-03-15"
/// phone : "9436786138"
/// address : "Pune, Maharashtra"
/// center : "Sahabhag Hall"
/// is_active : true
/// created_at : "2024-03-19T11:06:29.114444Z"
/// modified_at : "2024-03-19T14:03:04.807917Z"
/// year_of_experience : 0
/// training_type : "Intermediate"
/// discount : "0.00"

TraineeListResponseModel traineeListResponseModelFromJson(String str) => TraineeListResponseModel.fromJson(json.decode(str));
String traineeListResponseModelToJson(TraineeListResponseModel data) => json.encode(data.toJson());
class TraineeListResponseModel {
  TraineeListResponseModel({
      num? id, 
      String? username, 
      String? email, 
      String? role, 
      String? profilePhoto, 
      String? firstName, 
      String? lastName, 
      String? gender, 
      String? dob, 
      String? phone, 
      String? address, 
      String? center, 
      bool? isActive, 
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
    _dob = dob;
    _phone = phone;
    _address = address;
    _center = center;
    _isActive = isActive;
    _createdAt = createdAt;
    _modifiedAt = modifiedAt;
    _yearOfExperience = yearOfExperience;
    _trainingType = trainingType;
    _discount = discount;
}

  TraineeListResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _email = json['email'];
    _role = json['role'];
    _profilePhoto = json['profile_photo'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _gender = json['gender'];
    _dob = json['dob'];
    _phone = json['phone'];
    _address = json['address'];
    _center = json['center'];
    _isActive = json['is_active'];
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
  String? _gender;
  String? _dob;
  String? _phone;
  String? _address;
  String? _center;
  bool? _isActive;
  String? _createdAt;
  String? _modifiedAt;
  num? _yearOfExperience;
  String? _trainingType;
  String? _discount;
TraineeListResponseModel copyWith({  num? id,
  String? username,
  String? email,
  String? role,
  String? profilePhoto,
  String? firstName,
  String? lastName,
  String? gender,
  String? dob,
  String? phone,
  String? address,
  String? center,
  bool? isActive,
  String? createdAt,
  String? modifiedAt,
  num? yearOfExperience,
  String? trainingType,
  String? discount,
}) => TraineeListResponseModel(  id: id ?? _id,
  username: username ?? _username,
  email: email ?? _email,
  role: role ?? _role,
  profilePhoto: profilePhoto ?? _profilePhoto,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  gender: gender ?? _gender,
  dob: dob ?? _dob,
  phone: phone ?? _phone,
  address: address ?? _address,
  center: center ?? _center,
  isActive: isActive ?? _isActive,
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
  String? get gender => _gender;
  String? get dob => _dob;
  String? get phone => _phone;
  String? get address => _address;
  String? get center => _center;
  bool? get isActive => _isActive;
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
    map['dob'] = _dob;
    map['phone'] = _phone;
    map['address'] = _address;
    map['center'] = _center;
    map['is_active'] = _isActive;
    map['created_at'] = _createdAt;
    map['modified_at'] = _modifiedAt;
    map['year_of_experience'] = _yearOfExperience;
    map['training_type'] = _trainingType;
    map['discount'] = _discount;
    return map;
  }

}