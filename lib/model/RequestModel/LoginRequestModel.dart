import 'dart:convert';
/// username : "john"
/// password : "admin123"

LoginRequestModel loginRequestModelFromJson(String str) => LoginRequestModel.fromJson(json.decode(str));
String loginRequestModelToJson(LoginRequestModel data) => json.encode(data.toJson());
class LoginRequestModel {
  LoginRequestModel({
      String? username, 
      String? password,}){
    _username = username;
    _password = password;
}

  LoginRequestModel.fromJson(dynamic json) {
    _username = json['username'];
    _password = json['password'];
  }
  String? _username;
  String? _password;
LoginRequestModel copyWith({  String? username,
  String? password,
}) => LoginRequestModel(  username: username ?? _username,
  password: password ?? _password,
);
  String? get username => _username;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['password'] = _password;
    return map;
  }

}