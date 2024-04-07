import 'dart:convert';
/// user_id : 57
/// fees_status_by_month : [{"year":2024,"month":"March","fees_status":false},{"year":2024,"month":"April","fees_status":false}]

FeeStatusResponseModel feeStatusResponseModelFromJson(String str) => FeeStatusResponseModel.fromJson(json.decode(str));
String feeStatusResponseModelToJson(FeeStatusResponseModel data) => json.encode(data.toJson());
class FeeStatusResponseModel {
  FeeStatusResponseModel({
      num? userId, 
      List<FeesStatusByMonth>? feesStatusByMonth,}){
    _userId = userId;
    _feesStatusByMonth = feesStatusByMonth;
}

  FeeStatusResponseModel.fromJson(dynamic json) {
    _userId = json['user_id'];
    if (json['fees_status_by_month'] != null) {
      _feesStatusByMonth = [];
      json['fees_status_by_month'].forEach((v) {
        _feesStatusByMonth?.add(FeesStatusByMonth.fromJson(v));
      });
    }
  }
  num? _userId;
  List<FeesStatusByMonth>? _feesStatusByMonth;
FeeStatusResponseModel copyWith({  num? userId,
  List<FeesStatusByMonth>? feesStatusByMonth,
}) => FeeStatusResponseModel(  userId: userId ?? _userId,
  feesStatusByMonth: feesStatusByMonth ?? _feesStatusByMonth,
);
  num? get userId => _userId;
  List<FeesStatusByMonth>? get feesStatusByMonth => _feesStatusByMonth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    if (_feesStatusByMonth != null) {
      map['fees_status_by_month'] = _feesStatusByMonth?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// year : 2024
/// month : "March"
/// fees_status : false

FeesStatusByMonth feesStatusByMonthFromJson(String str) => FeesStatusByMonth.fromJson(json.decode(str));
String feesStatusByMonthToJson(FeesStatusByMonth data) => json.encode(data.toJson());
class FeesStatusByMonth {
  FeesStatusByMonth({
      num? year, 
      String? month, 
      bool? feesStatus,}){
    _year = year;
    _month = month;
    _feesStatus = feesStatus;
}

  FeesStatusByMonth.fromJson(dynamic json) {
    _year = json['year'];
    _month = json['month'];
    _feesStatus = json['fees_status'];
  }
  num? _year;
  String? _month;
  bool? _feesStatus;
FeesStatusByMonth copyWith({  num? year,
  String? month,
  bool? feesStatus,
}) => FeesStatusByMonth(  year: year ?? _year,
  month: month ?? _month,
  feesStatus: feesStatus ?? _feesStatus,
);
  num? get year => _year;
  String? get month => _month;
  bool? get feesStatus => _feesStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['year'] = _year;
    map['month'] = _month;
    map['fees_status'] = _feesStatus;
    return map;
  }

}