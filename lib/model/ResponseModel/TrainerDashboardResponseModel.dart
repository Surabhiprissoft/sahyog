import 'dart:convert';
/// id : 75
/// username : "surabhi@prissoft.net"
/// email : "surabhi@prissoft.net"
/// role : "trainer"
/// profile_photo : null
/// first_name : "Surabhi"
/// last_name : "Loya"
/// gender : "Female"
/// dob : "1995-04-02"
/// phone : "9860038135"
/// address : "Pune"
/// center : 1
/// created_at : "2024-04-15T17:18:00.735464Z"
/// updated_at : "2024-04-15T17:41:30.280096Z"
/// year_of_experience : 5
/// training_type : ""
/// discount : "0.00"
/// schedule : [{"scheduled_date":"2024-04-15","provided_date":"2024-04-15","center":"SP","start_timme":"23:00:00","end_time":"23:45:00","ct_id":1179,"is_present":"Absent","count":0,"interval":3,"total_api":5}]

TrainerDashboardResponseModel trainerDashboardResponseModelFromJson(String str) => TrainerDashboardResponseModel.fromJson(json.decode(str));
String trainerDashboardResponseModelToJson(TrainerDashboardResponseModel data) => json.encode(data.toJson());
class TrainerDashboardResponseModel {
  TrainerDashboardResponseModel({
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
      num? center, 
      String? createdAt, 
      String? updatedAt, 
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
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _yearOfExperience = yearOfExperience;
    _trainingType = trainingType;
    _discount = discount;
    _schedule = schedule;
}

  TrainerDashboardResponseModel.fromJson(dynamic json) {
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
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
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
  num? _center;
  String? _createdAt;
  String? _updatedAt;
  num? _yearOfExperience;
  String? _trainingType;
  String? _discount;
  List<Schedule>? _schedule;
TrainerDashboardResponseModel copyWith({  num? id,
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
  num? center,
  String? createdAt,
  String? updatedAt,
  num? yearOfExperience,
  String? trainingType,
  String? discount,
  List<Schedule>? schedule,
}) => TrainerDashboardResponseModel(  id: id ?? _id,
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
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
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
  num? get center => _center;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
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
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['year_of_experience'] = _yearOfExperience;
    map['training_type'] = _trainingType;
    map['discount'] = _discount;
    if (_schedule != null) {
      map['schedule'] = _schedule?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// scheduled_date : "2024-04-15"
/// provided_date : "2024-04-15"
/// center : "SP"
/// start_timme : "23:00:00"
/// end_time : "23:45:00"
/// ct_id : 1179
/// is_present : "Absent"
/// count : 0
/// interval : 3
/// total_api : 5

Schedule scheduleFromJson(String str) => Schedule.fromJson(json.decode(str));
String scheduleToJson(Schedule data) => json.encode(data.toJson());
class Schedule {
  Schedule({
      String? scheduledDate, 
      String? providedDate, 
      String? center, 
      String? startTimme, 
      String? endTime, 
      num? ctId, 
      String? isPresent, 
      num? count, 
      num? interval, 
      num? totalApi,}){
    _scheduledDate = scheduledDate;
    _providedDate = providedDate;
    _center = center;
    _startTimme = startTimme;
    _endTime = endTime;
    _ctId = ctId;
    _isPresent = isPresent;
    _count = count;
    _interval = interval;
    _totalApi = totalApi;
}

  Schedule.fromJson(dynamic json) {
    _scheduledDate = json['scheduled_date'];
    _providedDate = json['provided_date'];
    _center = json['center'];
    _startTimme = json['start_timme'];
    _endTime = json['end_time'];
    _ctId = json['ct_id'];
    _isPresent = json['is_present'];
    _count = json['count'];
    _interval = json['interval'];
    _totalApi = json['total_api'];
  }
  String? _scheduledDate;
  String? _providedDate;
  String? _center;
  String? _startTimme;
  String? _endTime;
  num? _ctId;
  String? _isPresent;
  num? _count;
  num? _interval;
  num? _totalApi;
Schedule copyWith({  String? scheduledDate,
  String? providedDate,
  String? center,
  String? startTimme,
  String? endTime,
  num? ctId,
  String? isPresent,
  num? count,
  num? interval,
  num? totalApi,
}) => Schedule(  scheduledDate: scheduledDate ?? _scheduledDate,
  providedDate: providedDate ?? _providedDate,
  center: center ?? _center,
  startTimme: startTimme ?? _startTimme,
  endTime: endTime ?? _endTime,
  ctId: ctId ?? _ctId,
  isPresent: isPresent ?? _isPresent,
  count: count ?? _count,
  interval: interval ?? _interval,
  totalApi: totalApi ?? _totalApi,
);
  String? get scheduledDate => _scheduledDate;
  String? get providedDate => _providedDate;
  String? get center => _center;
  String? get startTimme => _startTimme;
  String? get endTime => _endTime;
  num? get ctId => _ctId;
  String? get isPresent => _isPresent;
  num? get count => _count;
  num? get interval => _interval;
  num? get totalApi => _totalApi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['scheduled_date'] = _scheduledDate;
    map['provided_date'] = _providedDate;
    map['center'] = _center;
    map['start_timme'] = _startTimme;
    map['end_time'] = _endTime;
    map['ct_id'] = _ctId;
    map['is_present'] = _isPresent;
    map['count'] = _count;
    map['interval'] = _interval;
    map['total_api'] = _totalApi;
    return map;
  }

}