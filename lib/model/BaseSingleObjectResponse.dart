import 'package:sahyog/model/BaseResponse.dart';

class SingleResponse<T> extends BaseResponse {
  T data;

  SingleResponse({
    required String message,
    required int status,
    required this.data,
  }) : super(message: message, status: status);

  factory SingleResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return SingleResponse<T>(
        status: json["status"],
        message: json["message"],
        data: create(json["data"]));
  }
}