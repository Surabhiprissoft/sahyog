import 'dart:convert';
/// status : 200
/// message : "Attendance updated successfully"
/// is_present : "Absent"

UpdateAttendanceResponseModel updateAttendanceResponseModelFromJson(String str) => UpdateAttendanceResponseModel.fromJson(json.decode(str));
String updateAttendanceResponseModelToJson(UpdateAttendanceResponseModel data) => json.encode(data.toJson());
class UpdateAttendanceResponseModel {
  UpdateAttendanceResponseModel({
      num? status, 
      String? message, 
      String? isPresent,}){
    _status = status;
    _message = message;
    _isPresent = isPresent;
}

  UpdateAttendanceResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _isPresent = json['is_present'];
  }
  num? _status;
  String? _message;
  String? _isPresent;
UpdateAttendanceResponseModel copyWith({  num? status,
  String? message,
  String? isPresent,
}) => UpdateAttendanceResponseModel(  status: status ?? _status,
  message: message ?? _message,
  isPresent: isPresent ?? _isPresent,
);
  num? get status => _status;
  String? get message => _message;
  String? get isPresent => _isPresent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['is_present'] = _isPresent;
    return map;
  }

}