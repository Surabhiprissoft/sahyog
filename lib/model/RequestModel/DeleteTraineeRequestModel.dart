import 'dart:convert';
/// ct : 1179
/// user : 75
/// date : "2024-04-08"

DeleteTraineeRequestModel deleteTraineeRequestModelFromJson(String str) => DeleteTraineeRequestModel.fromJson(json.decode(str));
String deleteTraineeRequestModelToJson(DeleteTraineeRequestModel data) => json.encode(data.toJson());
class DeleteTraineeRequestModel {
  DeleteTraineeRequestModel({
      num? ct, 
      num? user, 
      String? date,}){
    _ct = ct;
    _user = user;
    _date = date;
}

  @override
  String toString() {
    return 'DeleteTraineeRequestModel{_ct: $_ct, _user: $_user, _date: $_date}';
  }

  DeleteTraineeRequestModel.fromJson(dynamic json) {
    _ct = json['ct'];
    _user = json['user'];
    _date = json['date'];
  }
  num? _ct;
  num? _user;
  String? _date;
DeleteTraineeRequestModel copyWith({  num? ct,
  num? user,
  String? date,
}) => DeleteTraineeRequestModel(  ct: ct ?? _ct,
  user: user ?? _user,
  date: date ?? _date,
);
  num? get ct => _ct;
  num? get user => _user;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ct'] = _ct;
    map['user'] = _user;
    map['date'] = _date;
    return map;
  }

}