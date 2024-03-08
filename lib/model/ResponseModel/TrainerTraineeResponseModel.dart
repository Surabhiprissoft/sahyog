import 'dart:convert';
/// status : 201
/// message : "Trainer created successfully"

TrainerTraineeResponseModel trainerTraineeResponseModelFromJson(String str) => TrainerTraineeResponseModel.fromJson(json.decode(str));
String trainerTraineeResponseModelToJson(TrainerTraineeResponseModel data) => json.encode(data.toJson());
class TrainerTraineeResponseModel {
  TrainerTraineeResponseModel({
      num? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  TrainerTraineeResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  num? _status;
  String? _message;
TrainerTraineeResponseModel copyWith({  num? status,
  String? message,
}) => TrainerTraineeResponseModel(  status: status ?? _status,
  message: message ?? _message,
);
  num? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}