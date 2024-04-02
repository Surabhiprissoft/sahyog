import 'dart:convert';
/// id : 45
/// username : "parag@gmail.com"
/// email : "parag@gmail.com"
/// role : "trainer"
/// profile_photo : null
/// first_name : "Parag"
/// last_name : "Sahbhaag"
/// gender : "Male"
/// dob : "2000-03-09"
/// phone : "9756345823"
/// address : "Pune, Maharashtra"
/// center : "NoCenter"
/// is_active : true
/// created_at : "2024-03-19T10:02:40.385027Z"
/// modified_at : "2024-03-29T06:43:33.003657Z"
/// year_of_experience : 3
/// training_type : ""
/// discount : "0.00"
/// schedule : [{"date":"2024-04-01","center":"Race","start_timme":"17:00:00","end_time":"20:00:00","user_id":45}]

TrainerListResponseModel trainerListResponseModelFromJson(String str) => TrainerListResponseModel.fromJson(json.decode(str));
String trainerListResponseModelToJson(TrainerListResponseModel data) => json.encode(data.toJson());
class TrainerListResponseModel {
  TrainerListResponseModel({
      num? id, 
      String? username, 
      String? email, 
      String? role, 
      dynamic profilePhoto, 
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
      List<Schedule>? schedule,}){
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
    _schedule = schedule;
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
    if (json['schedule'] != null) {
      _schedule = [];
      json['schedule'].forEach((v) {
        _schedule?.add(Schedule.fromJson(v));
      });
    }
  }
  num? _id;
  String? _username;
  String? _email;
  String? _role;
  dynamic _profilePhoto;
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
  List<Schedule>? _schedule;
TrainerListResponseModel copyWith({  num? id,
  String? username,
  String? email,
  String? role,
  dynamic profilePhoto,
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
  List<Schedule>? schedule,
}) => TrainerListResponseModel(  id: id ?? _id,
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
  schedule: schedule ?? _schedule,
);
  num? get id => _id;
  String? get username => _username;
  String? get email => _email;
  String? get role => _role;
  dynamic get profilePhoto => _profilePhoto;
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
  List<Schedule>? get schedule => _schedule;

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
    if (_schedule != null) {
      map['schedule'] = _schedule?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// date : "2024-04-01"
/// center : "Race"
/// start_timme : "17:00:00"
/// end_time : "20:00:00"
/// user_id : 45

Schedule scheduleFromJson(String str) => Schedule.fromJson(json.decode(str));
String scheduleToJson(Schedule data) => json.encode(data.toJson());
class Schedule {
  Schedule({
      String? date, 
      String? center, 
      String? startTimme, 
      String? endTime, 
      num? userId,}){
    _date = date;
    _center = center;
    _startTimme = startTimme;
    _endTime = endTime;
    _userId = userId;
}

  Schedule.fromJson(dynamic json) {
    _date = json['date'];
    _center = json['center'];
    _startTimme = json['start_timme'];
    _endTime = json['end_time'];
    _userId = json['user_id'];
  }
  String? _date;
  String? _center;
  String? _startTimme;
  String? _endTime;
  num? _userId;
Schedule copyWith({  String? date,
  String? center,
  String? startTimme,
  String? endTime,
  num? userId,
}) => Schedule(  date: date ?? _date,
  center: center ?? _center,
  startTimme: startTimme ?? _startTimme,
  endTime: endTime ?? _endTime,
  userId: userId ?? _userId,
);
  String? get date => _date;
  String? get center => _center;
  String? get startTimme => _startTimme;
  String? get endTime => _endTime;
  num? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['center'] = _center;
    map['start_timme'] = _startTimme;
    map['end_time'] = _endTime;
    map['user_id'] = _userId;
    return map;
  }

}