import 'dart:convert';
/// date : "2024-03-23"

TimeSlotRequestModel timeSlotRequestModelFromJson(String str) => TimeSlotRequestModel.fromJson(json.decode(str));
String timeSlotRequestModelToJson(TimeSlotRequestModel data) => json.encode(data.toJson());
class TimeSlotRequestModel {
  TimeSlotRequestModel({
      String? date,}){
    _date = date;
}

  TimeSlotRequestModel.fromJson(dynamic json) {
    _date = json['date'];
  }
  String? _date;
TimeSlotRequestModel copyWith({  String? date,
}) => TimeSlotRequestModel(  date: date ?? _date,
);
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    return map;
  }

  @override
  String toString() {
    return 'TimeSlotRequestModel{_date: $_date}';
  }
}