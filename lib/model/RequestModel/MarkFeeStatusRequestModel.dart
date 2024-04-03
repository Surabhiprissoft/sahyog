import 'dart:convert';
/// fees_status : "true"
/// payment_date : "2024-04-03"
/// month_id : 2
/// user_id : 57

MarkFeeStatusRequestModel markFeeStatusRequestModelFromJson(String str) => MarkFeeStatusRequestModel.fromJson(json.decode(str));
String markFeeStatusRequestModelToJson(MarkFeeStatusRequestModel data) => json.encode(data.toJson());
class MarkFeeStatusRequestModel {
  MarkFeeStatusRequestModel({
      String? feesStatus, 
      String? paymentDate, 
      num? monthId, 
      num? userId,}){
    _feesStatus = feesStatus;
    _paymentDate = paymentDate;
    _monthId = monthId;
    _userId = userId;
}

  MarkFeeStatusRequestModel.fromJson(dynamic json) {
    _feesStatus = json['fees_status'];
    _paymentDate = json['payment_date'];
    _monthId = json['month_id'];
    _userId = json['user_id'];
  }
  String? _feesStatus;
  String? _paymentDate;
  num? _monthId;
  num? _userId;
MarkFeeStatusRequestModel copyWith({  String? feesStatus,
  String? paymentDate,
  num? monthId,
  num? userId,
}) => MarkFeeStatusRequestModel(  feesStatus: feesStatus ?? _feesStatus,
  paymentDate: paymentDate ?? _paymentDate,
  monthId: monthId ?? _monthId,
  userId: userId ?? _userId,
);
  String? get feesStatus => _feesStatus;
  String? get paymentDate => _paymentDate;
  num? get monthId => _monthId;
  num? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fees_status'] = _feesStatus;
    map['payment_date'] = _paymentDate;
    map['month_id'] = _monthId;
    map['user_id'] = _userId;
    return map;
  }

}