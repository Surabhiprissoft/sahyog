import 'dart:convert';
/// email : "gajabhrutik@gmail.com"

ForgotPasswordRequestModel forgotPasswordRequestModelFromJson(String str) => ForgotPasswordRequestModel.fromJson(json.decode(str));
String forgotPasswordRequestModelToJson(ForgotPasswordRequestModel data) => json.encode(data.toJson());
class ForgotPasswordRequestModel {
  ForgotPasswordRequestModel({
      String? email,}){
    _email = email;
}

  ForgotPasswordRequestModel.fromJson(dynamic json) {
    _email = json['email'];
  }
  String? _email;
ForgotPasswordRequestModel copyWith({  String? email,
}) => ForgotPasswordRequestModel(  email: email ?? _email,
);
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    return map;
  }

}