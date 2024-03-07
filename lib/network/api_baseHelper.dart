import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sahyog/network/app_exception.dart';
import 'package:sahyog/utils/app_constants.dart';
import 'package:sahyog/utils/preference_utils.dart';



class ApiBaseHelper {


   //office
  final baseUrl = "http://192.168.0.117:8000/";

  final authToken=PreferenceUtils.getString(AppConstants.USER_TOKEN);
  // final authToken=PreferenceUtils.getString("token");
 // final authToken="";
  // final authToken="876654fd-3c24-4a7b-9784-ec80256bf995";



  //For all the GET requests
  Future<dynamic> get(String url) async {

    var responseJson;
      print("AUTH TOKEN IS"+authToken);
    try {
      final response = await http.get(Uri.parse(baseUrl + url),headers:{ "Accept": "application/json",
      "content-type":"application/json","Authorization":'Bearer $authToken'});
      print("the url is ${baseUrl+url}");
      responseJson =_returnResponse(response);
      print(responseJson);
      print("the url is ${baseUrl+url}");
      return responseJson;
    } on SocketException {
      throw FetchDataException(AppConstants.NO_INTERNET);
    }
  }

  //For all the POST form url encoded requests
  Future<dynamic>?formPost(String url, Map<String, String> body) async {
    var responseJson;
    print(baseUrl+url);
    print(body);
    try{
      final Uri uri = Uri.parse(baseUrl + url);
      final response = await http.post(uri, body: body, headers: {"Content-Type": "application/x-www-form-urlencoded"},
        encoding: Encoding.getByName('utf-8'),
      );
      print("URL IS"+baseUrl+url);
      print(response);
      responseJson=_returnResponse(response);
      return responseJson;
    }on SocketException{
      throw FetchDataException(AppConstants.NO_INTERNET);
    }
  }

  //For all the POST requests
  Future<dynamic>? post(String url, Map<String, Object?> requestBody) async {
    var responseJson;
    print("auth token jwt ="+authToken);
    try{

      final Uri uri = Uri.parse(baseUrl + url);
      print("url is ${baseUrl+url}");
      print("url is requestBody ${requestBody}");
      final response = await http.post(uri, body: jsonEncode(requestBody),
          encoding: Encoding.getByName('utf-8'), headers: { "Accept": "application/json",
            "content-type":"application/json","Authorization":'Bearer $authToken'});
      //request.headers.set('Authorization', authToken,);
      debugPrint("RESPONSE CODE "+response.statusCode.toString());
      debugPrint("RESPONSE Body "+response.body);

      String jsonString=response.body.toString();

      responseJson =_returnResponse(response);


      return responseJson;


      //print("RESPONSE JSON IS"+jsonString);

    }on SocketException{
      throw FetchDataException(AppConstants.NO_INTERNET);
    }
  }


  Future<dynamic>? postwithoutjson(String url, Map<String, Object?> requestBody) async {
    var responseJson;

    try{

      final Uri uri = Uri.parse(baseUrl + url);
      print("url is ${baseUrl+url}");
      print("url is requestBody ${requestBody}");
      final response = await http.post(uri, body: jsonEncode(requestBody),
          encoding: Encoding.getByName('utf-8'));

      debugPrint("RESPONSE CODE "+response.statusCode.toString());
      debugPrint("RESPONSE Body "+response.body);
      debugPrint("RESPONSE Body "+response.body);

      String jsonString=response.body.toString();

      // responseJson =_returnResponse(response);


      return jsonString;

      //print("RESPONSE JSON IS"+jsonString);

    }on SocketException{
      throw FetchDataException(AppConstants.NO_INTERNET);
    }
  }
  //For all the PUT requests
  Future<dynamic>? put(String url,Map<String,Object?>? body) async {
    var responseJson;
    try{
      final Uri uri = Uri.parse(baseUrl + url);
      print("url is ${baseUrl+url}");
      print("url request body is ${body}");
      final response = await http.put(uri, body: jsonEncode(body),
          encoding: Encoding.getByName('utf-8'),headers: { "Accept": "application/json",
            "content-type":"application/json","Authorization":'Bearer $authToken'});

      //String jsonString=response.body.toString();
      responseJson=_returnResponse(response);
      //print(responseJson);
      //return responseJson;
      return responseJson;
    }on SocketException{
      throw FetchDataException(AppConstants.NO_INTERNET);
    }
  }

  Future<dynamic>? putAvoidExcep(String url,Map<String,Object?>? body) async {
    var responseJson;
    try{
      final Uri uri = Uri.parse(baseUrl + url);
      print("url is ${baseUrl+url}");
      print("url request body is ${body}");
      final response = await http.put(uri, body: jsonEncode(body),
          encoding: Encoding.getByName('utf-8'),headers: { "Accept": "application/json",
            "content-type":"application/json","Authorization":'Bearer $authToken'});

      //String jsonString=response.body.toString();
       responseJson = jsonDecode(utf8.decode(response.bodyBytes));
      responseJson=response;
      //print(responseJson);
      //return responseJson;
      return responseJson;
    }on SocketException{
      throw FetchDataException(AppConstants.NO_INTERNET);
    }
  }

  //For all the DELETE requests
  Future<dynamic>? delete(String url) async {
    var responseJson;
    try{
      final Uri uri = Uri.parse(baseUrl + url);
      print("url is ${baseUrl+url}");
      final response = await http.delete(uri,
          encoding: Encoding.getByName('utf-8'),headers: { "Accept": "application/json",
            "content-type":"application/json","Authorization":'Bearer $authToken'});
      String jsonString=response.body.toString();
      responseJson =_returnResponse(response);
      print("response body by delete ${response.body}");
      return responseJson;
    }on SocketException{
      throw FetchDataException(AppConstants.NO_INTERNET);
    }
  }

  //For all the DELETE requests
  Future<dynamic>? deleteWithBody(String url,Map<String,Object?>body) async {
    var responseJson;

    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.deleteUrl(Uri.parse(baseUrl+url));
    request.headers.set('content-type', 'application/json',);
    // request.headers.set('Authorization', authToken,);
    request.add(utf8.encode(json.encode(body)));

    HttpClientResponse response = await request.close();
    responseJson= await response.transform(utf8.decoder).join();
    httpClient.close();
    print("result is "+responseJson);
    return responseJson.toString();
  }

  Future<dynamic>fileUpload(File file,String url)async{
    var request = http.MultipartRequest("POST", Uri.parse(baseUrl+url));
    //add text fields
    // request.fields["text_field"] = text;
    //create multipart using filepath, string or bytes
    print("the url is ${baseUrl+url}");
    var pic = await http.MultipartFile.fromPath("file", file.path);
    //add multipart to request
    request.files.add(pic);
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    return jsonDecode(responseString);
    print(responseString);
  }

  dynamic _returnResponse(http.Response response) {
    print(" in http response"+response.statusCode.toString());
    switch (response.statusCode) {
      case 200 :
        var responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        return responseJson;
      case 400:
        var responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        return responseJson;
        //throw BadRequestException(AppConstants.BAD_REQUEST);
      case 401:
        var responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        return responseJson;
       // throw BadRequestException(AppConstants.INVALID_USER);
      case 403:
        throw UnAuthorisedException(AppConstants.INVALID_TOKEN,403);
      case 404:
        throw ResourceNotFoundException(AppConstants.RESOURCE_NOT_FOUND);
      case 406:
        throw BadRequestException(AppConstants.USER_EXISTS);
      case 500:
      default:
        throw FetchDataException(AppConstants.INTERNAL_SERVER);
    }
  }

}