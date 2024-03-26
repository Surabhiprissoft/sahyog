import 'dart:convert';
/// is_approve : true

RegistrationUpdateRequestModel registrationUpdateRequestModelFromJson(String str) => RegistrationUpdateRequestModel.fromJson(json.decode(str));
String registrationUpdateRequestModelToJson(RegistrationUpdateRequestModel data) => json.encode(data.toJson());
class RegistrationUpdateRequestModel {
  RegistrationUpdateRequestModel({
      bool? isApprove,}){
    _isApprove = isApprove;
}

  RegistrationUpdateRequestModel.fromJson(dynamic json) {
    _isApprove = json['is_approve'];
  }
  bool? _isApprove;
RegistrationUpdateRequestModel copyWith({  bool? isApprove,
}) => RegistrationUpdateRequestModel(  isApprove: isApprove ?? _isApprove,
);
  bool? get isApprove => _isApprove;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_approve'] = _isApprove;
    return map;
  }

}