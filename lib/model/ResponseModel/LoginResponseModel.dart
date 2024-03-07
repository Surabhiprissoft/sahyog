import 'dart:convert';
/// user : {"photo":"/photos/IMG20240225211104.jpg","first_name":"John","last_name":"Doe","gender":"Male","username":"john","password":"pbkdf2_sha256$720000$FpEi2Axr7s55AUaiQ1b3FD$8r93pm75TeCQpKghDszlw9b0QPDJDNnC2t+XDnoqUck=","contact":"9422968315","email":"john@gmail.com","address":"John house no 21, Pune","role":1,"center":1,"year_of_experience":0,"training_type":"","discount":"0.00","fees_paid":""}
/// role : "Admin"
/// message : "Login successful"
/// access : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzA5NzUyMTM2LCJpYXQiOjE3MDk3NTE1MzYsImp0aSI6IjFkMGNhY2E5YjQzZTQzNTZiZDI3YWY5ODg2N2E5OTAzIiwidXNlcl9pZCI6MX0.xUAtGacT8u0CSZAkbxwvB0brvfD3OitioCrRAVsyk9M"

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));
String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());
class LoginResponseModel {
  LoginResponseModel({
      User? user, 
      String? role, 
      String? message, 
      String? access,}){
    _user = user;
    _role = role;
    _message = message;
    _access = access;
}

  LoginResponseModel.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _role = json['role'];
    _message = json['message'];
    _access = json['access'];
  }
  User? _user;
  String? _role;
  String? _message;
  String? _access;
LoginResponseModel copyWith({  User? user,
  String? role,
  String? message,
  String? access,
}) => LoginResponseModel(  user: user ?? _user,
  role: role ?? _role,
  message: message ?? _message,
  access: access ?? _access,
);
  User? get user => _user;
  String? get role => _role;
  String? get message => _message;
  String? get access => _access;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['role'] = _role;
    map['message'] = _message;
    map['access'] = _access;
    return map;
  }

}

/// photo : "/photos/IMG20240225211104.jpg"
/// first_name : "John"
/// last_name : "Doe"
/// gender : "Male"
/// username : "john"
/// password : "pbkdf2_sha256$720000$FpEi2Axr7s55AUaiQ1b3FD$8r93pm75TeCQpKghDszlw9b0QPDJDNnC2t+XDnoqUck="
/// contact : "9422968315"
/// email : "john@gmail.com"
/// address : "John house no 21, Pune"
/// role : 1
/// center : 1
/// year_of_experience : 0
/// training_type : ""
/// discount : "0.00"
/// fees_paid : ""

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      String? photo, 
      String? firstName, 
      String? lastName, 
      String? gender, 
      String? username, 
      String? password, 
      String? contact, 
      String? email, 
      String? address, 
      num? role, 
      num? center, 
      num? yearOfExperience, 
      String? trainingType, 
      String? discount, 
      String? feesPaid,}){
    _photo = photo;
    _firstName = firstName;
    _lastName = lastName;
    _gender = gender;
    _username = username;
    _password = password;
    _contact = contact;
    _email = email;
    _address = address;
    _role = role;
    _center = center;
    _yearOfExperience = yearOfExperience;
    _trainingType = trainingType;
    _discount = discount;
    _feesPaid = feesPaid;
}

  User.fromJson(dynamic json) {
    _photo = json['photo'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _gender = json['gender'];
    _username = json['username'];
    _password = json['password'];
    _contact = json['contact'];
    _email = json['email'];
    _address = json['address'];
    _role = json['role'];
    _center = json['center'];
    _yearOfExperience = json['year_of_experience'];
    _trainingType = json['training_type'];
    _discount = json['discount'];
    _feesPaid = json['fees_paid'];
  }
  String? _photo;
  String? _firstName;
  String? _lastName;
  String? _gender;
  String? _username;
  String? _password;
  String? _contact;
  String? _email;
  String? _address;
  num? _role;
  num? _center;
  num? _yearOfExperience;
  String? _trainingType;
  String? _discount;
  String? _feesPaid;
User copyWith({  String? photo,
  String? firstName,
  String? lastName,
  String? gender,
  String? username,
  String? password,
  String? contact,
  String? email,
  String? address,
  num? role,
  num? center,
  num? yearOfExperience,
  String? trainingType,
  String? discount,
  String? feesPaid,
}) => User(  photo: photo ?? _photo,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  gender: gender ?? _gender,
  username: username ?? _username,
  password: password ?? _password,
  contact: contact ?? _contact,
  email: email ?? _email,
  address: address ?? _address,
  role: role ?? _role,
  center: center ?? _center,
  yearOfExperience: yearOfExperience ?? _yearOfExperience,
  trainingType: trainingType ?? _trainingType,
  discount: discount ?? _discount,
  feesPaid: feesPaid ?? _feesPaid,
);
  String? get photo => _photo;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get gender => _gender;
  String? get username => _username;
  String? get password => _password;
  String? get contact => _contact;
  String? get email => _email;
  String? get address => _address;
  num? get role => _role;
  num? get center => _center;
  num? get yearOfExperience => _yearOfExperience;
  String? get trainingType => _trainingType;
  String? get discount => _discount;
  String? get feesPaid => _feesPaid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['photo'] = _photo;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['gender'] = _gender;
    map['username'] = _username;
    map['password'] = _password;
    map['contact'] = _contact;
    map['email'] = _email;
    map['address'] = _address;
    map['role'] = _role;
    map['center'] = _center;
    map['year_of_experience'] = _yearOfExperience;
    map['training_type'] = _trainingType;
    map['discount'] = _discount;
    map['fees_paid'] = _feesPaid;
    return map;
  }

}