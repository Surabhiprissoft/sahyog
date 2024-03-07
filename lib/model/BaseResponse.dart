class BaseResponse {
  dynamic message;
  int status;


  BaseResponse(
      {this.message, required this.status});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
        status: json["success"],
        message: json["message"]);
  }
}