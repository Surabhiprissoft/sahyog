import 'dart:convert';
/// first_name : "Sujal"
/// last_name : "Ghuble"
/// gender : "male"
/// age : 21
/// username : "sujal"
/// password : "trainersujal"
/// contact : "9255674546"
/// email : "sujal@gmail.com"
/// address : "sujal house no 45, Pune"
/// role : 2
/// year_of_experience : 3

AddTrainerRequestModel addTrainerRequestModelFromJson(String str) => AddTrainerRequestModel.fromJson(json.decode(str));
String addTrainerRequestModelToJson(AddTrainerRequestModel data) => json.encode(data.toJson());
class AddTrainerRequestModel {
  AddTrainerRequestModel({
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
      num? yearOfExperience,}){
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
    _yearOfExperience = yearOfExperience;
}

  AddTrainerRequestModel.fromJson(dynamic json) {
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
    _yearOfExperience = json['year_of_experience'];
  }
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
  num? _yearOfExperience;
AddTrainerRequestModel copyWith({  String? firstName,
  String? lastName,
  String? gender,
  num? age,
  String? username,
  String? password,
  String? contact,
  String? email,
  String? address,
  num? role,
  num? yearOfExperience,
}) => AddTrainerRequestModel(  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  gender: gender ?? _gender,
  age: age ?? _age,
  username: username ?? _username,
  password: password ?? _password,
  contact: contact ?? _contact,
  email: email ?? _email,
  address: address ?? _address,
  role: role ?? _role,
  yearOfExperience: yearOfExperience ?? _yearOfExperience,
);
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
  num? get yearOfExperience => _yearOfExperience;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
    map['year_of_experience'] = _yearOfExperience;
    return map;
  }

}