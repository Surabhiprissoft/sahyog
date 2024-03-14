import 'dart:convert';
/// status : 200
/// message : "Password changed successfully"

ChangePasswordResponseModel changePasswordResponseModelFromJson(String str) => ChangePasswordResponseModel.fromJson(json.decode(str));
String changePasswordResponseModelToJson(ChangePasswordResponseModel data) => json.encode(data.toJson());
class ChangePasswordResponseModel {
  ChangePasswordResponseModel({
      num? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  ChangePasswordResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  num? _status;
  String? _message;
ChangePasswordResponseModel copyWith({  num? status,
  String? message,
}) => ChangePasswordResponseModel(  status: status ?? _status,
  message: message ?? _message,
);
  num? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}