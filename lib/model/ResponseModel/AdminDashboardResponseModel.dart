import 'dart:convert';
/// trainer_count : 10
/// trainee_count : 1
/// centers : [{"id":1,"name":"NoCenter","address":"DEFAULT ADDRESS","total_trainees":0},{"id":4,"name":"SP","address":"SP Prasarakh Mandali, SP College, Tilak Road","total_trainees":0},{"id":5,"name":"Race","address":"Salunke Vihar Road","total_trainees":0},{"id":6,"name":"Sahabhag Hall","address":"Somvar Peth","total_trainees":1},{"id":7,"name":"Symbiosis School","address":"Prabhat Road","total_trainees":0},{"id":8,"name":"Jnana Prabodhini","address":"Sadashiv Peth","total_trainees":0},{"id":9,"name":"RCBC","address":"Bund garden road","total_trainees":0},{"id":10,"name":"Pawar public school","address":"Nanded City","total_trainees":0},{"id":11,"name":"Versatile school","address":"Sinhagad road","total_trainees":0},{"id":12,"name":"Jnana Seva Foundation","address":"katraj","total_trainees":0},{"id":13,"name":"Apla Ghar","address":"Wagholi, nagar highway","total_trainees":0}]

AdminDashboardResponseModel adminDashboardResponseModelFromJson(String str) => AdminDashboardResponseModel.fromJson(json.decode(str));
String adminDashboardResponseModelToJson(AdminDashboardResponseModel data) => json.encode(data.toJson());
class AdminDashboardResponseModel {
  AdminDashboardResponseModel({
      num? trainerCount, 
      num? traineeCount, 
      List<Centers>? centers,}){
    _trainerCount = trainerCount;
    _traineeCount = traineeCount;
    _centers = centers;
}

  @override
  String toString() {
    return 'AdminDashboardResponseModel{_trainerCount: $_trainerCount, _traineeCount: $_traineeCount, _centers: $_centers}';
  }

  AdminDashboardResponseModel.fromJson(dynamic json) {
    _trainerCount = json['trainer_count'];
    _traineeCount = json['trainee_count'];
    if (json['centers'] != null) {
      _centers = [];
      json['centers'].forEach((v) {
        _centers?.add(Centers.fromJson(v));
      });
    }
  }
  num? _trainerCount;
  num? _traineeCount;
  List<Centers>? _centers;
AdminDashboardResponseModel copyWith({  num? trainerCount,
  num? traineeCount,
  List<Centers>? centers,
}) => AdminDashboardResponseModel(  trainerCount: trainerCount ?? _trainerCount,
  traineeCount: traineeCount ?? _traineeCount,
  centers: centers ?? _centers,
);
  num? get trainerCount => _trainerCount;
  num? get traineeCount => _traineeCount;
  List<Centers>? get centers => _centers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['trainer_count'] = _trainerCount;
    map['trainee_count'] = _traineeCount;
    if (_centers != null) {
      map['centers'] = _centers?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "NoCenter"
/// address : "DEFAULT ADDRESS"
/// total_trainees : 0

Centers centersFromJson(String str) => Centers.fromJson(json.decode(str));
String centersToJson(Centers data) => json.encode(data.toJson());
class Centers {
  Centers({
      num? id, 
      String? name, 
      String? address, 
      num? totalTrainees,}){
    _id = id;
    _name = name;
    _address = address;
    _totalTrainees = totalTrainees;
}

  Centers.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _address = json['address'];
    _totalTrainees = json['total_trainees'];
  }
  num? _id;
  String? _name;
  String? _address;
  num? _totalTrainees;
Centers copyWith({  num? id,
  String? name,
  String? address,
  num? totalTrainees,
}) => Centers(  id: id ?? _id,
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