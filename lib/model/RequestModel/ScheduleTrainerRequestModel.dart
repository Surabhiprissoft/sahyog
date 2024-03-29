import 'dart:convert';
/// ct_id : 1179
/// user_id : 40
/// no_of_days : 7
/// date : "2024-03-28"
/// interval : 1

ScheduleTrainerRequestModel scheduleTrainerRequestModelFromJson(String str) => ScheduleTrainerRequestModel.fromJson(json.decode(str));
String scheduleTrainerRequestModelToJson(ScheduleTrainerRequestModel data) => json.encode(data.toJson());
class ScheduleTrainerRequestModel {
  ScheduleTrainerRequestModel({
      num? ctId, 
      num? userId, 
      num? noOfDays, 
      String? date, 
      num? interval,}){
    _ctId = ctId;
    _userId = userId;
    _noOfDays = noOfDays;
    _date = date;
    _interval = interval;
}

  @override
  String toString() {
    return 'ScheduleTrainerRequestModel{_ctId: $_ctId, _userId: $_userId, _noOfDays: $_noOfDays, _date: $_date, _interval: $_interval}';
  }

  ScheduleTrainerRequestModel.fromJson(dynamic json) {
    _ctId = json['ct_id'];
    _userId = json['user_id'];
    _noOfDays = json['no_of_days'];
    _date = json['date'];
    _interval = json['interval'];
  }
  num? _ctId;
  num? _userId;
  num? _noOfDays;
  String? _date;
  num? _interval;
ScheduleTrainerRequestModel copyWith({  num? ctId,
  num? userId,
  num? noOfDays,
  String? date,
  num? interval,
}) => ScheduleTrainerRequestModel(  ctId: ctId ?? _ctId,
  userId: userId ?? _userId,
  noOfDays: noOfDays ?? _noOfDays,
  date: date ?? _date,
  interval: interval ?? _interval,
);
  num? get ctId => _ctId;
  num? get userId => _userId;
  num? get noOfDays => _noOfDays;
  String? get date => _date;
  num? get interval => _interval;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ct_id'] = _ctId;
    map['user_id'] = _userId;
    map['no_of_days'] = _noOfDays;
    map['date'] = _date;
    map['interval'] = _interval;
    return map;
  }

}