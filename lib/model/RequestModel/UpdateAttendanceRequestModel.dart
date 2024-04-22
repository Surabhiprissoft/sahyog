import 'dart:convert';
/// lat : 18.583355
/// lon : 73.994681
/// user_id : 75
/// ct_id : 1179

UpdateAttendanceRequestModel updateAttendanceRequestModelFromJson(String str) => UpdateAttendanceRequestModel.fromJson(json.decode(str));
String updateAttendanceRequestModelToJson(UpdateAttendanceRequestModel data) => json.encode(data.toJson());
class UpdateAttendanceRequestModel {
  UpdateAttendanceRequestModel({
      num? lat, 
      num? lon, 
      num? userId, 
      num? ctId,}){
    _lat = lat;
    _lon = lon;
    _userId = userId;
    _ctId = ctId;
}

  UpdateAttendanceRequestModel.fromJson(dynamic json) {
    _lat = json['lat'];
    _lon = json['lon'];
    _userId = json['user_id'];
    _ctId = json['ct_id'];
  }
  num? _lat;
  num? _lon;
  num? _userId;
  num? _ctId;
UpdateAttendanceRequestModel copyWith({  num? lat,
  num? lon,
  num? userId,
  num? ctId,
}) => UpdateAttendanceRequestModel(  lat: lat ?? _lat,
  lon: lon ?? _lon,
  userId: userId ?? _userId,
  ctId: ctId ?? _ctId,
);
  num? get lat => _lat;
  num? get lon => _lon;
  num? get userId => _userId;
  num? get ctId => _ctId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['user_id'] = _userId;
    map['ct_id'] = _ctId;
    return map;
  }

}