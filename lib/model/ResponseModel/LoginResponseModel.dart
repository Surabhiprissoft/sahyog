import 'dart:convert';
/// photo : "/media/photos/IMG20240225211104.jpg"
/// first_name : "John"
/// last_name : "Doe"
/// gender : "Male"
/// age : 0
/// username : "john"
/// contact : "9422968315"
/// email : "john@gmail.com"
/// address : "John house no 21, Pune"
/// role : 1
/// center : 1
/// year_of_experience : 0
/// training_type : ""
/// discount : "0.00"
/// fees_paid : ""
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzA5ODE0NTE5LCJpYXQiOjE3MDk4MTM5MTksImp0aSI6IjgyYzA2NmY4YWJiNzRkN2ZhMTE5ZDUyZTI4NmE3MGY3IiwidXNlcl9pZCI6MX0.eZhQM0yhLMbA92fjxkhMkTLdmY_1cx9mo4vRAFcnSnQ"

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));
String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());
class LoginResponseModel {
  LoginResponseModel({
      String? photo, 
      String? firstName, 
      String? lastName, 
      String? gender, 
      num? age, 
      String? username, 
      String? contact, 
      String? email, 
      String? address, 
      num? role, 
      num? center, 
      num? yearOfExperience, 
      String? trainingType, 
      String? discount, 
      String? feesPaid, 
      String? token,}){
    _photo = photo;
    _firstName = firstName;
    _lastName = lastName;
    _gender = gender;
    _age = age;
    _username = username;
    _contact = contact;
    _email = email;
    _address = address;
    _role = role;
    _center = center;
    _yearOfExperience = yearOfExperience;
    _trainingType = trainingType;
    _discount = discount;
    _feesPaid = feesPaid;
    _token = token;
}

  LoginResponseModel.fromJson(dynamic json) {
    _photo = json['photo'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _gender = json['gender'];
    _age = json['age'];
    _username = json['username'];
    _contact = json['contact'];
    _email = json['email'];
    _address = json['address'];
    _role = json['role'];
    _center = json['center'];
    _yearOfExperience = json['year_of_experience'];
    _trainingType = json['training_type'];
    _discount = json['discount'];
    _feesPaid = json['fees_paid'];
    _token = json['token'];
  }
  String? _photo;
  String? _firstName;
  String? _lastName;
  String? _gender;
  num? _age;
  String? _username;
  String? _contact;
  String? _email;
  String? _address;
  num? _role;
  num? _center;
  num? _yearOfExperience;
  String? _trainingType;
  String? _discount;
  String? _feesPaid;
  String? _token;
LoginResponseModel copyWith({  String? photo,
  String? firstName,
  String? lastName,
  String? gender,
  num? age,
  String? username,
  String? contact,
  String? email,
  String? address,
  num? role,
  num? center,
  num? yearOfExperience,
  String? trainingType,
  String? discount,
  String? feesPaid,
  String? token,
}) => LoginResponseModel(  photo: photo ?? _photo,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  gender: gender ?? _gender,
  age: age ?? _age,
  username: username ?? _username,
  contact: contact ?? _contact,
  email: email ?? _email,
  address: address ?? _address,
  role: role ?? _role,
  center: center ?? _center,
  yearOfExperience: yearOfExperience ?? _yearOfExperience,
  trainingType: trainingType ?? _trainingType,
  discount: discount ?? _discount,
  feesPaid: feesPaid ?? _feesPaid,
  token: token ?? _token,
);
  String? get photo => _photo;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get gender => _gender;
  num? get age => _age;
  String? get username => _username;
  String? get contact => _contact;
  String? get email => _email;
  String? get address => _address;
  num? get role => _role;
  num? get center => _center;
  num? get yearOfExperience => _yearOfExperience;
  String? get trainingType => _trainingType;
  String? get discount => _discount;
  String? get feesPaid => _feesPaid;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['photo'] = _photo;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['gender'] = _gender;
    map['age'] = _age;
    map['username'] = _username;
    map['contact'] = _contact;
    map['email'] = _email;
    map['address'] = _address;
    map['role'] = _role;
    map['center'] = _center;
    map['year_of_experience'] = _yearOfExperience;
    map['training_type'] = _trainingType;
    map['discount'] = _discount;
    map['fees_paid'] = _feesPaid;
    map['token'] = _token;
    return map;
  }

}