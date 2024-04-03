import 'dart:convert';
/// year : 2024
/// user_id : 74
/// fees_status_by_month : [{"month":"January","fees_status":true},{"month":"February","fees_status":false},{"month":"March","fees_status":false},{"month":"April","fees_status":false}]

FeeStatusResponseModel feeStatusResponseModelFromJson(String str) => FeeStatusResponseModel.fromJson(json.decode(str));
String feeStatusResponseModelToJson(FeeStatusResponseModel data) => json.encode(data.toJson());
class FeeStatusResponseModel {
  FeeStatusResponseModel({
      num? year, 
      num? userId, 
      List<FeesStatusByMonth>? feesStatusByMonth,}){
    _year = year;
    _userId = userId;
    _feesStatusByMonth = feesStatusByMonth;
}

  FeeStatusResponseModel.fromJson(dynamic json) {
    _year = json['year'];
    _userId = json['user_id'];
    if (json['fees_status_by_month'] != null) {
      _feesStatusByMonth = [];
      json['fees_status_by_month'].forEach((v) {
        _feesStatusByMonth?.add(FeesStatusByMonth.fromJson(v));
      });
    }
  }
  num? _year;
  num? _userId;
  List<FeesStatusByMonth>? _feesStatusByMonth;
FeeStatusResponseModel copyWith({  num? year,
  num? userId,
  List<FeesStatusByMonth>? feesStatusByMonth,
}) => FeeStatusResponseModel(  year: year ?? _year,
  userId: userId ?? _userId,
  feesStatusByMonth: feesStatusByMonth ?? _feesStatusByMonth,
);
  num? get year => _year;
  num? get userId => _userId;
  List<FeesStatusByMonth>? get feesStatusByMonth => _feesStatusByMonth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['year'] = _year;
    map['user_id'] = _userId;
    if (_feesStatusByMonth != null) {
      map['fees_status_by_month'] = _feesStatusByMonth?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// month : "January"
/// fees_status : true

FeesStatusByMonth feesStatusByMonthFromJson(String str) => FeesStatusByMonth.fromJson(json.decode(str));
String feesStatusByMonthToJson(FeesStatusByMonth data) => json.encode(data.toJson());
class FeesStatusByMonth {
  FeesStatusByMonth({
      String? month, 
      bool? feesStatus,}){
    _month = month;
    _feesStatus = feesStatus;
}

  FeesStatusByMonth.fromJson(dynamic json) {
    _month = json['month'];
    _feesStatus = json['fees_status'];
  }
  String? _month;
  bool? _feesStatus;
FeesStatusByMonth copyWith({  String? month,
  bool? feesStatus,
}) => FeesStatusByMonth(  month: month ?? _month,
  feesStatus: feesStatus ?? _feesStatus,
);
  String? get month => _month;
  bool? get feesStatus => _feesStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['month'] = _month;
    map['fees_status'] = _feesStatus;
    return map;
  }

}