import 'dart:convert';
/// fees_status : "True"
/// payment_date : "2024-04-03"
/// user_id : 48
/// month_id : 4
/// year_id : 2024

MarkFeeStatusRequestModel markFeeStatusRequestModelFromJson(String str) => MarkFeeStatusRequestModel.fromJson(json.decode(str));
String markFeeStatusRequestModelToJson(MarkFeeStatusRequestModel data) => json.encode(data.toJson());
class MarkFeeStatusRequestModel {
  MarkFeeStatusRequestModel({
      String? feesStatus, 
      String? paymentDate, 
      num? userId, 
      num? monthId, 
      num? yearId,}){
    _feesStatus = feesStatus;
    _paymentDate = paymentDate;
    _userId = userId;
    _monthId = monthId;
    _yearId = yearId;
}

  MarkFeeStatusRequestModel.fromJson(dynamic json) {
    _feesStatus = json['fees_status'];
    _paymentDate = json['payment_date'];
    _userId = json['user_id'];
    _monthId = json['month_id'];
    _yearId = json['year_id'];
  }
  String? _feesStatus;
  String? _paymentDate;
  num? _userId;
  num? _monthId;
  num? _yearId;
MarkFeeStatusRequestModel copyWith({  String? feesStatus,
  String? paymentDate,
  num? userId,
  num? monthId,
  num? yearId,
}) => MarkFeeStatusRequestModel(  feesStatus: feesStatus ?? _feesStatus,
  paymentDate: paymentDate ?? _paymentDate,
  userId: userId ?? _userId,
  monthId: monthId ?? _monthId,
  yearId: yearId ?? _yearId,
);
  String? get feesStatus => _feesStatus;
  String? get paymentDate => _paymentDate;
  num? get userId => _userId;
  num? get monthId => _monthId;
  num? get yearId => _yearId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fees_status'] = _feesStatus;
    map['payment_date'] = _paymentDate;
    map['user_id'] = _userId;
    map['month_id'] = _monthId;
    map['year_id'] = _yearId;
    return map;
  }

}