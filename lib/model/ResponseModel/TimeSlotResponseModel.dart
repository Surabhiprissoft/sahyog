import 'dart:convert';
/// id : 1
/// ctable : {"id":4,"name":"SP","address":"SP Prasarakh Mandali, SP College, Tilak Road","total_trainees":4}
/// ttable : {"id":1,"start_timme":"18:30:00","end_time":"20:00:00"}
/// date : "2024-03-23"

TimeSlotResponseModel timeSlotResponseModelFromJson(String str) => TimeSlotResponseModel.fromJson(json.decode(str));
String timeSlotResponseModelToJson(TimeSlotResponseModel data) => json.encode(data.toJson());
class TimeSlotResponseModel {
  TimeSlotResponseModel({
      int? id, 
      Ctable? ctable, 
      Ttable? ttable, 
      String? date,}){
    _id = id;
    _ctable = ctable;
    _ttable = ttable;
    _date = date;
}

  TimeSlotResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _ctable = json['ctable'] != null ? Ctable.fromJson(json['ctable']) : null;
    _ttable = json['ttable'] != null ? Ttable.fromJson(json['ttable']) : null;
    _date = json['date'];
  }
  int? _id;
  Ctable? _ctable;
  Ttable? _ttable;
  String? _date;
TimeSlotResponseModel copyWith({  int? id,
  Ctable? ctable,
  Ttable? ttable,
  String? date,
}) => TimeSlotResponseModel(  id: id ?? _id,
  ctable: ctable ?? _ctable,
  ttable: ttable ?? _ttable,
  date: date ?? _date,
);
  int? get id => _id;
  Ctable? get ctable => _ctable;
  Ttable? get ttable => _ttable;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_ctable != null) {
      map['ctable'] = _ctable?.toJson();
    }
    if (_ttable != null) {
      map['ttable'] = _ttable?.toJson();
    }
    map['date'] = _date;
    return map;
  }

}

/// id : 1
/// start_timme : "18:30:00"
/// end_time : "20:00:00"

Ttable ttableFromJson(String str) => Ttable.fromJson(json.decode(str));
String ttableToJson(Ttable data) => json.encode(data.toJson());
class Ttable {
  Ttable({
      int? id, 
      String? startTimme, 
      String? endTime,}){
    _id = id;
    _startTimme = startTimme;
    _endTime = endTime;
}

  Ttable.fromJson(dynamic json) {
    _id = json['id'];
    _startTimme = json['start_timme'];
    _endTime = json['end_time'];
  }
  int? _id;
  String? _startTimme;
  String? _endTime;
Ttable copyWith({  int? id,
  String? startTimme,
  String? endTime,
}) => Ttable(  id: id ?? _id,
  startTimme: startTimme ?? _startTimme,
  endTime: endTime ?? _endTime,
);
  int? get id => _id;
  String? get startTimme => _startTimme;
  String? get endTime => _endTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['start_timme'] = _startTimme;
    map['end_time'] = _endTime;
    return map;
  }

}

/// id : 4
/// name : "SP"
/// address : "SP Prasarakh Mandali, SP College, Tilak Road"
/// total_trainees : 4

Ctable ctableFromJson(String str) => Ctable.fromJson(json.decode(str));
String ctableToJson(Ctable data) => json.encode(data.toJson());
class Ctable {
  Ctable({
      int? id, 
      String? name, 
      String? address, 
      int? totalTrainees,}){
    _id = id;
    _name = name;
    _address = address;
    _totalTrainees = totalTrainees;
}

  Ctable.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _address = json['address'];
    _totalTrainees = json['total_trainees'];
  }
  int? _id;
  String? _name;
  String? _address;
  int? _totalTrainees;
Ctable copyWith({  int? id,
  String? name,
  String? address,
  int? totalTrainees,
}) => Ctable(  id: id ?? _id,
  name: name ?? _name,
  address: address ?? _address,
  totalTrainees: totalTrainees ?? _totalTrainees,
);
  int? get id => _id;
  String? get name => _name;
  String? get address => _address;
  int? get totalTrainees => _totalTrainees;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['address'] = _address;
    map['total_trainees'] = _totalTrainees;
    return map;
  }

}