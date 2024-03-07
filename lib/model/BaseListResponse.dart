import 'package:sahyog/model/BaseResponse.dart';

class ListResponse<T> extends BaseResponse {
  List<T> data;

  ListResponse({
    required String message,
    required int status,
    required this.data,
  }) : super(message: message, status: status);

  factory ListResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) create) {
    var jsonDataList = json['data'] as List<dynamic>;
    var data = List<T>.from(jsonDataList.map((itemJson) => create(itemJson)));

    return ListResponse<T>(
      status: json["status"],
      message: json["message"],
      data: data,
    );
  }
}