import 'dart:convert';
/// trainee_profilephoto : "/media/jatinprissoft.net-f13b6033-9590-4f3b-bf62-83981a8fac35.jpg"
/// trainee_firstname : "jatin"
/// trainee_lastname : "mewada"
/// dob : "2003-02-02"
/// gender : "Male"
/// email : "jatin@prissoft.net"
/// phone : "8956123452"
/// address : "Warje pune maharashtra"
/// training_type : "Beginner"
/// center_id : 4
/// center_name : "SP"
/// center_address : "SP Prasarakh Mandali, SP College, Tilak Road"
/// assigned_trainers : [{"id":45,"profile_photo":null,"year_of_experience":3,"firstname":"Parag","lastname":"Sahbhaag","phone":"9756345823","start_time":"18:30:00","end_time":"20:00:00"}]
/// fees_status_by_month : [{"year":2024,"month":"March","fees_status":true},{"year":2024,"month":"April","fees_status":true}]
/// fees_status_false_count : 0

TraineeDashboardResponseModel traineeDashboardResponseModelFromJson(String str) => TraineeDashboardResponseModel.fromJson(json.decode(str));
String traineeDashboardResponseModelToJson(TraineeDashboardResponseModel data) => json.encode(data.toJson());
class TraineeDashboardResponseModel {
  TraineeDashboardResponseModel({
      String? traineeProfilephoto, 
      String? traineeFirstname, 
      String? traineeLastname, 
      String? dob, 
      String? gender, 
      String? email, 
      String? phone, 
      String? address, 
      String? trainingType, 
      num? centerId, 
      String? centerName, 
      String? centerAddress, 
      List<AssignedTrainers>? assignedTrainers, 
      List<FeesStatusByMonth>? feesStatusByMonth, 
      num? feesStatusFalseCount,}){
    _traineeProfilephoto = traineeProfilephoto;
    _traineeFirstname = traineeFirstname;
    _traineeLastname = traineeLastname;
    _dob = dob;
    _gender = gender;
    _email = email;
    _phone = phone;
    _address = address;
    _trainingType = trainingType;
    _centerId = centerId;
    _centerName = centerName;
    _centerAddress = centerAddress;
    _assignedTrainers = assignedTrainers;
    _feesStatusByMonth = feesStatusByMonth;
    _feesStatusFalseCount = feesStatusFalseCount;
}

  TraineeDashboardResponseModel.fromJson(dynamic json) {
    _traineeProfilephoto = json['trainee_profilephoto'];
    _traineeFirstname = json['trainee_firstname'];
    _traineeLastname = json['trainee_lastname'];
    _dob = json['dob'];
    _gender = json['gender'];
    _email = json['email'];
    _phone = json['phone'];
    _address = json['address'];
    _trainingType = json['training_type'];
    _centerId = json['center_id'];
    _centerName = json['center_name'];
    _centerAddress = json['center_address'];
    if (json['assigned_trainers'] != null) {
      _assignedTrainers = [];
      json['assigned_trainers'].forEach((v) {
        _assignedTrainers?.add(AssignedTrainers.fromJson(v));
      });
    }
    if (json['fees_status_by_month'] != null) {
      _feesStatusByMonth = [];
      json['fees_status_by_month'].forEach((v) {
        _feesStatusByMonth?.add(FeesStatusByMonth.fromJson(v));
      });
    }
    _feesStatusFalseCount = json['fees_status_false_count'];
  }
  String? _traineeProfilephoto;
  String? _traineeFirstname;
  String? _traineeLastname;
  String? _dob;
  String? _gender;
  String? _email;
  String? _phone;
  String? _address;
  String? _trainingType;
  num? _centerId;
  String? _centerName;
  String? _centerAddress;
  List<AssignedTrainers>? _assignedTrainers;
  List<FeesStatusByMonth>? _feesStatusByMonth;
  num? _feesStatusFalseCount;
TraineeDashboardResponseModel copyWith({  String? traineeProfilephoto,
  String? traineeFirstname,
  String? traineeLastname,
  String? dob,
  String? gender,
  String? email,
  String? phone,
  String? address,
  String? trainingType,
  num? centerId,
  String? centerName,
  String? centerAddress,
  List<AssignedTrainers>? assignedTrainers,
  List<FeesStatusByMonth>? feesStatusByMonth,
  num? feesStatusFalseCount,
}) => TraineeDashboardResponseModel(  traineeProfilephoto: traineeProfilephoto ?? _traineeProfilephoto,
  traineeFirstname: traineeFirstname ?? _traineeFirstname,
  traineeLastname: traineeLastname ?? _traineeLastname,
  dob: dob ?? _dob,
  gender: gender ?? _gender,
  email: email ?? _email,
  phone: phone ?? _phone,
  address: address ?? _address,
  trainingType: trainingType ?? _trainingType,
  centerId: centerId ?? _centerId,
  centerName: centerName ?? _centerName,
  centerAddress: centerAddress ?? _centerAddress,
  assignedTrainers: assignedTrainers ?? _assignedTrainers,
  feesStatusByMonth: feesStatusByMonth ?? _feesStatusByMonth,
  feesStatusFalseCount: feesStatusFalseCount ?? _feesStatusFalseCount,
);
  String? get traineeProfilephoto => _traineeProfilephoto;
  String? get traineeFirstname => _traineeFirstname;
  String? get traineeLastname => _traineeLastname;
  String? get dob => _dob;
  String? get gender => _gender;
  String? get email => _email;
  String? get phone => _phone;
  String? get address => _address;
  String? get trainingType => _trainingType;
  num? get centerId => _centerId;
  String? get centerName => _centerName;
  String? get centerAddress => _centerAddress;
  List<AssignedTrainers>? get assignedTrainers => _assignedTrainers;
  List<FeesStatusByMonth>? get feesStatusByMonth => _feesStatusByMonth;
  num? get feesStatusFalseCount => _feesStatusFalseCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['trainee_profilephoto'] = _traineeProfilephoto;
    map['trainee_firstname'] = _traineeFirstname;
    map['trainee_lastname'] = _traineeLastname;
    map['dob'] = _dob;
    map['gender'] = _gender;
    map['email'] = _email;
    map['phone'] = _phone;
    map['address'] = _address;
    map['training_type'] = _trainingType;
    map['center_id'] = _centerId;
    map['center_name'] = _centerName;
    map['center_address'] = _centerAddress;
    if (_assignedTrainers != null) {
      map['assigned_trainers'] = _assignedTrainers?.map((v) => v.toJson()).toList();
    }
    if (_feesStatusByMonth != null) {
      map['fees_status_by_month'] = _feesStatusByMonth?.map((v) => v.toJson()).toList();
    }
    map['fees_status_false_count'] = _feesStatusFalseCount;
    return map;
  }

}

/// year : 2024
/// month : "March"
/// fees_status : true

FeesStatusByMonth feesStatusByMonthFromJson(String str) => FeesStatusByMonth.fromJson(json.decode(str));
String feesStatusByMonthToJson(FeesStatusByMonth data) => json.encode(data.toJson());
class FeesStatusByMonth {
  FeesStatusByMonth({
      num? year, 
      String? month, 
      bool? feesStatus,}){
    _year = year;
    _month = month;
    _feesStatus = feesStatus;
}

  FeesStatusByMonth.fromJson(dynamic json) {
    _year = json['year'];
    _month = json['month'];
    _feesStatus = json['fees_status'];
  }
  num? _year;
  String? _month;
  bool? _feesStatus;
FeesStatusByMonth copyWith({  num? year,
  String? month,
  bool? feesStatus,
}) => FeesStatusByMonth(  year: year ?? _year,
  month: month ?? _month,
  feesStatus: feesStatus ?? _feesStatus,
);
  num? get year => _year;
  String? get month => _month;
  bool? get feesStatus => _feesStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['year'] = _year;
    map['month'] = _month;
    map['fees_status'] = _feesStatus;
    return map;
  }

}

/// id : 45
/// profile_photo : null
/// year_of_experience : 3
/// firstname : "Parag"
/// lastname : "Sahbhaag"
/// phone : "9756345823"
/// start_time : "18:30:00"
/// end_time : "20:00:00"

AssignedTrainers assignedTrainersFromJson(String str) => AssignedTrainers.fromJson(json.decode(str));
String assignedTrainersToJson(AssignedTrainers data) => json.encode(data.toJson());
class AssignedTrainers {
  AssignedTrainers({
      num? id, 
      dynamic profilePhoto, 
      num? yearOfExperience, 
      String? firstname, 
      String? lastname, 
      String? phone, 
      String? startTime, 
      String? endTime,}){
    _id = id;
    _profilePhoto = profilePhoto;
    _yearOfExperience = yearOfExperience;
    _firstname = firstname;
    _lastname = lastname;
    _phone = phone;
    _startTime = startTime;
    _endTime = endTime;
}

  AssignedTrainers.fromJson(dynamic json) {
    _id = json['id'];
    _profilePhoto = json['profile_photo'];
    _yearOfExperience = json['year_of_experience'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _phone = json['phone'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
  }
  num? _id;
  dynamic _profilePhoto;
  num? _yearOfExperience;
  String? _firstname;
  String? _lastname;
  String? _phone;
  String? _startTime;
  String? _endTime;
AssignedTrainers copyWith({  num? id,
  dynamic profilePhoto,
  num? yearOfExperience,
  String? firstname,
  String? lastname,
  String? phone,
  String? startTime,
  String? endTime,
}) => AssignedTrainers(  id: id ?? _id,
  profilePhoto: profilePhoto ?? _profilePhoto,
  yearOfExperience: yearOfExperience ?? _yearOfExperience,
  firstname: firstname ?? _firstname,
  lastname: lastname ?? _lastname,
  phone: phone ?? _phone,
  startTime: startTime ?? _startTime,
  endTime: endTime ?? _endTime,
);
  num? get id => _id;
  dynamic get profilePhoto => _profilePhoto;
  num? get yearOfExperience => _yearOfExperience;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get phone => _phone;
  String? get startTime => _startTime;
  String? get endTime => _endTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['profile_photo'] = _profilePhoto;
    map['year_of_experience'] = _yearOfExperience;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['phone'] = _phone;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    return map;
  }

}