import 'dart:convert';
/// email : "sunil@gmail.com"
/// profile_photo : "/media/sunilgmail.com-51cf4cf8-c3c1-45ee-b3fc-d047bc21af36.jpg"
/// first_name : "Sunil"
/// last_name : "Sahbhaag"
/// gender : "Male"
/// dob : "2000-03-01"
/// phone : "9454638801"
/// address : "Pune, Maharashtra"
/// is_active : true
/// year_of_experience : 5

UpdateTrainerRequestModel updateTrainerRequestModelFromJson(String str) => UpdateTrainerRequestModel.fromJson(json.decode(str));
String updateTrainerRequestModelToJson(UpdateTrainerRequestModel data) => json.encode(data.toJson());
class UpdateTrainerRequestModel {
  UpdateTrainerRequestModel({
      String? email, 
      String? profilePhoto, 
      String? firstName, 
      String? lastName, 
      String? gender, 
      String? dob, 
      String? phone, 
      String? address, 
      bool? isActive, 
      num? yearOfExperience,}){
    _email = email;
    _profilePhoto = profilePhoto;
    _firstName = firstName;
    _lastName = lastName;
    _gender = gender;
    _dob = dob;
    _phone = phone;
    _address = address;
    _isActive = isActive;
    _yearOfExperience = yearOfExperience;
}

  UpdateTrainerRequestModel.fromJson(dynamic json) {
    _email = json['email'];
    _profilePhoto = json['profile_photo'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _gender = json['gender'];
    _dob = json['dob'];
    _phone = json['phone'];
    _address = json['address'];
    _isActive = json['is_active'];
    _yearOfExperience = json['year_of_experience'];
  }
  String? _email;
  String? _profilePhoto;
  String? _firstName;
  String? _lastName;
  String? _gender;
  String? _dob;
  String? _phone;
  String? _address;
  bool? _isActive;
  num? _yearOfExperience;
UpdateTrainerRequestModel copyWith({  String? email,
  String? profilePhoto,
  String? firstName,
  String? lastName,
  String? gender,
  String? dob,
  String? phone,
  String? address,
  bool? isActive,
  num? yearOfExperience,
}) => UpdateTrainerRequestModel(  email: email ?? _email,
  profilePhoto: profilePhoto ?? _profilePhoto,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  gender: gender ?? _gender,
  dob: dob ?? _dob,
  phone: phone ?? _phone,
  address: address ?? _address,
  isActive: isActive ?? _isActive,
  yearOfExperience: yearOfExperience ?? _yearOfExperience,
);
  String? get email => _email;
  String? get profilePhoto => _profilePhoto;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get gender => _gender;
  String? get dob => _dob;
  String? get phone => _phone;
  String? get address => _address;
  bool? get isActive => _isActive;
  num? get yearOfExperience => _yearOfExperience;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['profile_photo'] = _profilePhoto;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['gender'] = _gender;
    map['dob'] = _dob;
    map['phone'] = _phone;
    map['address'] = _address;
    map['is_active'] = _isActive;
    map['year_of_experience'] = _yearOfExperience;
    return map;
  }

}