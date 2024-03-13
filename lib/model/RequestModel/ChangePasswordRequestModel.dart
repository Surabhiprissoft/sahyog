import 'dart:convert';
/// email : "gajabhrutik@gmail.com"
/// password : "prismatic123"
/// new_password : "trainer123"

ChangePasswordRequestModel changePasswordRequestModelFromJson(String str) => ChangePasswordRequestModel.fromJson(json.decode(str));
String changePasswordRequestModelToJson(ChangePasswordRequestModel data) => json.encode(data.toJson());
class ChangePasswordRequestModel {
  ChangePasswordRequestModel({
      String? email, 
      String? password, 
      String? newPassword,}){
    _email = email;
    _password = password;
    _newPassword = newPassword;
}

  @override
  String toString() {
    return 'ChangePasswordRequestModel{_email: $_email, _password: $_password, _newPassword: $_newPassword}';
  }

  ChangePasswordRequestModel.fromJson(dynamic json) {
    _email = json['email'];
    _password = json['password'];
    _newPassword = json['new_password'];
  }
  String? _email;
  String? _password;
  String? _newPassword;
ChangePasswordRequestModel copyWith({  String? email,
  String? password,
  String? newPassword,
}) => ChangePasswordRequestModel(  email: email ?? _email,
  password: password ?? _password,
  newPassword: newPassword ?? _newPassword,
);
  String? get email => _email;
  String? get password => _password;
  String? get newPassword => _newPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['password'] = _password;
    map['new_password'] = _newPassword;
    return map;
  }

}