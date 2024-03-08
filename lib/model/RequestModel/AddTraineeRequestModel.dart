import 'dart:convert';
/// photo : null
/// first_name : "Sujal"
/// last_name : "Ghuble"
/// gender : "male"
/// age : 21
/// username : "sujal"
/// password : "trainersujal"
/// contact : "9255674546"
/// email : "sujal@gmail.com"
/// address : "sujal house no 45, Pune"
/// role : 3
/// center : 2
/// training_type : "Advanced"
/// fees_paid : "yes"

AddTraineeRequestModel addTraineeRequestModelFromJson(String str) => AddTraineeRequestModel.fromJson(json.decode(str));
String addTraineeRequestModelToJson(AddTraineeRequestModel data) => json.encode(data.toJson());
class AddTraineeRequestModel {
  AddTraineeRequestModel({
      dynamic photo, 
      String? firstName, 
      String? lastName, 
      String? gender, 
      num? age, 
      String? username, 
      String? password, 
      String? contact, 
      String? email, 
      String? address, 
      num? role, 
      num? center, 
      String? trainingType, 
      String? feesPaid,}){
    _photo = photo;
    _firstName = firstName;
    _lastName = lastName;
    _gender = gender;
    _age = age;
    _username = username;
    _password = password;
    _contact = contact;
    _email = email;
    _address = address;
    _role = role;
    _center = center;
    _trainingType = trainingType;
    _feesPaid = feesPaid;
}

  AddTraineeRequestModel.fromJson(dynamic json) {
    _photo = json['photo'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _gender = json['gender'];
    _age = json['age'];
    _username = json['username'];
    _password = json['password'];
    _contact = json['contact'];
    _email = json['email'];
    _address = json['address'];
    _role = json['role'];
    _center = json['center'];
    _trainingType = json['training_type'];
    _feesPaid = json['fees_paid'];
  }
  dynamic _photo;
  String? _firstName;
  String? _lastName;
  String? _gender;
  num? _age;
  String? _username;
  String? _password;
  String? _contact;
  String? _email;
  String? _address;
  num? _role;
  num? _center;
  String? _trainingType;
  String? _feesPaid;
AddTraineeRequestModel copyWith({  dynamic photo,
  String? firstName,
  String? lastName,
  String? gender,
  num? age,
  String? username,
  String? password,
  String? contact,
  String? email,
  String? address,
  num? role,
  num? center,
  String? trainingType,
  String? feesPaid,
}) => AddTraineeRequestModel(  photo: photo ?? _photo,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  gender: gender ?? _gender,
  age: age ?? _age,
  username: username ?? _username,
  password: password ?? _password,
  contact: contact ?? _contact,
  email: email ?? _email,
  address: address ?? _address,
  role: role ?? _role,
  center: center ?? _center,
  trainingType: trainingType ?? _trainingType,
  feesPaid: feesPaid ?? _feesPaid,
);
  dynamic get photo => _photo;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get gender => _gender;
  num? get age => _age;
  String? get username => _username;
  String? get password => _password;
  String? get contact => _contact;
  String? get email => _email;
  String? get address => _address;
  num? get role => _role;
  num? get center => _center;
  String? get trainingType => _trainingType;
  String? get feesPaid => _feesPaid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['photo'] = _photo;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['gender'] = _gender;
    map['age'] = _age;
    map['username'] = _username;
    map['password'] = _password;
    map['contact'] = _contact;
    map['email'] = _email;
    map['address'] = _address;
    map['role'] = _role;
    map['center'] = _center;
    map['training_type'] = _trainingType;
    map['fees_paid'] = _feesPaid;
    return map;
  }

}