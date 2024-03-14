import 'dart:convert';
/// photo : null
/// first_name : "Harsh"
/// last_name : "Nagesh"
/// gender : "male"
/// dob : "2001-02-29"
/// username : "harsh"
/// password : "prismatic123"
/// phone : "9255675536"
/// email : "harsh@gmail.com"
/// address : "Pune, Maharashtra"
/// role : 1
/// year_of_experience : 5

AddTrainerRequestModel addTrainerRequestModelFromJson(String str) => AddTrainerRequestModel.fromJson(json.decode(str));
String addTrainerRequestModelToJson(AddTrainerRequestModel data) => json.encode(data.toJson());
class AddTrainerRequestModel {
  AddTrainerRequestModel({
      dynamic photo, 
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
      num? yearOfExperience,}){
    _photo = photo;
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
    _yearOfExperience = yearOfExperience;
}

  AddTrainerRequestModel.fromJson(dynamic json) {
    _photo = json['photo'];
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
    _yearOfExperience = json['year_of_experience'];
  }
  dynamic _photo;
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
  num? _yearOfExperience;
AddTrainerRequestModel copyWith({  dynamic photo,
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
  num? yearOfExperience,
}) => AddTrainerRequestModel(  photo: photo ?? _photo,
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
  yearOfExperience: yearOfExperience ?? _yearOfExperience,
);
  dynamic get photo => _photo;
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
  num? get yearOfExperience => _yearOfExperience;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['photo'] = _photo;
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
    map['year_of_experience'] = _yearOfExperience;
    return map;
  }

}