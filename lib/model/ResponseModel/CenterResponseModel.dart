import 'dart:convert';
/// id : 1
/// name : "NoCenter"
/// address : "DEFAULT ADDRESS"

CenterResponseModel centerResponseModelFromJson(String str) => CenterResponseModel.fromJson(json.decode(str));
String centerResponseModelToJson(CenterResponseModel data) => json.encode(data.toJson());
class CenterResponseModel {
  CenterResponseModel({
      int? id, 
      String? name, 
      String? address,}){
    _id = id;
    _name = name;
    _address = address;
}

  @override
  String toString() {
    return 'CenterResponseModel{_id: $_id, _name: $_name, _address: $_address}';
  }

  CenterResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _address = json['address'];
  }
  int? _id;
  String? _name;
  String? _address;
CenterResponseModel copyWith({  int? id,
  String? name,
  String? address,
}) => CenterResponseModel(  id: id ?? _id,
  name: name ?? _name,
  address: address ?? _address,
);
  int? get id => _id;
  String? get name => _name;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['address'] = _address;
    return map;
  }

}