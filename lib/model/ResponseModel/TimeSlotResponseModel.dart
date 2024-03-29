import 'dart:convert';
/// id : 58
/// ctable : {"id":4,"name":"SP","address":"SP Prasarakh Mandali, SP College, Tilak Road","total_trainees":4}
/// ttable : {"id":1,"start_timme":"18:30:00","end_time":"20:00:00"}
/// date : "2024-03-26"
/// assigned_trainers : [{"id":37,"firstname":"Sunil"}]

TimeSlotResponseModel timeSlotResponseModelFromJson(String str) => TimeSlotResponseModel.fromJson(json.decode(str));
String timeSlotResponseModelToJson(TimeSlotResponseModel data) => json.encode(data.toJson());
class TimeSlotResponseModel {
  TimeSlotResponseModel({
      num? id, 
      Ctable? ctable, 
      Ttable? ttable, 
      String? date, 
      List<AssignedTrainers>? assignedTrainers,}){
    _id = id;
    _ctable = ctable;
    _ttable = ttable;
    _date = date;
    _assignedTrainers = assignedTrainers;
}

  TimeSlotResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _ctable = json['ctable'] != null ? Ctable.fromJson(json['ctable']) : null;
    _ttable = json['ttable'] != null ? Ttable.fromJson(json['ttable']) : null;
    _date = json['date'];
    if (json['assigned_trainers'] != null) {
      _assignedTrainers = [];
      json['assigned_trainers'].forEach((v) {
        _assignedTrainers?.add(AssignedTrainers.fromJson(v));
      });
    }
  }
  num? _id;
  Ctable? _ctable;
  Ttable? _ttable;
  String? _date;
  List<AssignedTrainers>? _assignedTrainers;
TimeSlotResponseModel copyWith({  num? id,
  Ctable? ctable,
  Ttable? ttable,
  String? date,
  List<AssignedTrainers>? assignedTrainers,
}) => TimeSlotResponseModel(  id: id ?? _id,
  ctable: ctable ?? _ctable,
  ttable: ttable ?? _ttable,
  date: date ?? _date,
  assignedTrainers: assignedTrainers ?? _assignedTrainers,
);
  num? get id => _id;
  Ctable? get ctable => _ctable;
  Ttable? get ttable => _ttable;
  String? get date => _date;
  List<AssignedTrainers>? get assignedTrainers => _assignedTrainers;

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
    if (_assignedTrainers != null) {
      map['assigned_trainers'] = _assignedTrainers?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 37
/// firstname : "Sunil"

AssignedTrainers assignedTrainersFromJson(String str) => AssignedTrainers.fromJson(json.decode(str));
String assignedTrainersToJson(AssignedTrainers data) => json.encode(data.toJson());
class AssignedTrainers {
  AssignedTrainers({
      num? id, 
      String? firstname,}){
    _id = id;
    _firstname = firstname;
}

  AssignedTrainers.fromJson(dynamic json) {
    _id = json['id'];
    _firstname = json['firstname'];
  }
  num? _id;
  String? _firstname;
AssignedTrainers copyWith({  num? id,
  String? firstname,
}) => AssignedTrainers(  id: id ?? _id,
  firstname: firstname ?? _firstname,
);
  num? get id => _id;
  String? get firstname => _firstname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['firstname'] = _firstname;
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
      num? id, 
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
  num? _id;
  String? _startTimme;
  String? _endTime;
Ttable copyWith({  num? id,
  String? startTimme,
  String? endTime,
}) => Ttable(  id: id ?? _id,
  startTimme: startTimme ?? _startTimme,
  endTime: endTime ?? _endTime,
);
  num? get id => _id;
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
      num? id, 
      String? name, 
      String? address, 
      num? totalTrainees,}){
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
  num? _id;
  String? _name;
  String? _address;
  num? _totalTrainees;
Ctable copyWith({  num? id,
  String? name,
  String? address,
  num? totalTrainees,
}) => Ctable(  id: id ?? _id,
  name: name ?? _name,
  address: address ?? _address,
  totalTrainees: totalTrainees ?? _totalTrainees,
);
  num? get id => _id;
  String? get name => _name;
  String? get address => _address;
  num? get totalTrainees => _totalTrainees;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['address'] = _address;
    map['total_trainees'] = _totalTrainees;
    return map;
  }

}