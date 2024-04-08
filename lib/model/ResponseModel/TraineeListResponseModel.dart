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
/// center_id : 6
/// center_name : "Sahabhag Hall"
/// center_address : "Somvar Peth"
/// is_active : true
/// created_at : "2024-03-19T11:06:29.114444Z"
/// modified_at : "2024-03-26T06:59:15.492637Z"
/// year_of_experience : 0
/// training_type : "Intermediate"
/// discount : "0.00"
/// fees_status_false_count : 2

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
      num? centerId, 
      String? centerName, 
      String? centerAddress, 
      bool? isActive, 
      String? createdAt, 
      String? modifiedAt, 
      num? yearOfExperience, 
      String? trainingType, 
      String? discount, 
      num? feesStatusFalseCount,}){
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
    _centerId = centerId;
    _centerName = centerName;
    _centerAddress = centerAddress;
    _isActive = isActive;
    _createdAt = createdAt;
    _modifiedAt = modifiedAt;
    _yearOfExperience = yearOfExperience;
    _trainingType = trainingType;
    _discount = discount;
    _feesStatusFalseCount = feesStatusFalseCount;
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
    _centerId = json['center_id'];
    _centerName = json['center_name'];
    _centerAddress = json['center_address'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
    _modifiedAt = json['modified_at'];
    _yearOfExperience = json['year_of_experience'];
    _trainingType = json['training_type'];
    _discount = json['discount'];
    _feesStatusFalseCount = json['fees_status_false_count'];
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
  num? _centerId;
  String? _centerName;
  String? _centerAddress;
  bool? _isActive;
  String? _createdAt;
  String? _modifiedAt;
  num? _yearOfExperience;
  String? _trainingType;
  String? _discount;
  num? _feesStatusFalseCount;
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
  num? centerId,
  String? centerName,
  String? centerAddress,
  bool? isActive,
  String? createdAt,
  String? modifiedAt,
  num? yearOfExperience,
  String? trainingType,
  String? discount,
  num? feesStatusFalseCount,
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
  centerId: centerId ?? _centerId,
  centerName: centerName ?? _centerName,
  centerAddress: centerAddress ?? _centerAddress,
  isActive: isActive ?? _isActive,
  createdAt: createdAt ?? _createdAt,
  modifiedAt: modifiedAt ?? _modifiedAt,
  yearOfExperience: yearOfExperience ?? _yearOfExperience,
  trainingType: trainingType ?? _trainingType,
  discount: discount ?? _discount,
  feesStatusFalseCount: feesStatusFalseCount ?? _feesStatusFalseCount,
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
  num? get centerId => _centerId;
  String? get centerName => _centerName;
  String? get centerAddress => _centerAddress;
  bool? get isActive => _isActive;
  String? get createdAt => _createdAt;
  String? get modifiedAt => _modifiedAt;
  num? get yearOfExperience => _yearOfExperience;
  String? get trainingType => _trainingType;
  String? get discount => _discount;
  num? get feesStatusFalseCount => _feesStatusFalseCount;

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
    map['center_id'] = _centerId;
    map['center_name'] = _centerName;
    map['center_address'] = _centerAddress;
    map['is_active'] = _isActive;
    map['created_at'] = _createdAt;
    map['modified_at'] = _modifiedAt;
    map['year_of_experience'] = _yearOfExperience;
    map['training_type'] = _trainingType;
    map['discount'] = _discount;
    map['fees_status_false_count'] = _feesStatusFalseCount;
    return map;
  }

}