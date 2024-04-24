import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sahyog/model/Centers.dart';
import 'package:sahyog/model/GeoLocation.dart';
import 'package:sahyog/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  /*static String getString(String key, [String? defValue]) {
    return _prefsInstance!.getString(key) ?? defValue ?? "";
  }*/

  static String getString(String key, [String? defValue]) {
    return _prefsInstance!.getString(key) ?? defValue ?? "";
  }
  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static int getInt(String key, [int? defValue]) {
    return _prefsInstance!.getInt(key) ?? defValue ??0;
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key, value);
  }

  static bool getBool(String key, [bool? defValue]) {
    return _prefsInstance!.getBool(key) ?? defValue ?? false;
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

  static Future<bool> setCustomGeoLocationList(String key, List<GeoLocation> list) async {
    var prefs = await _instance;
    List<String> jsonList = list.map((item) => jsonEncode(item.toMap())).toList();
    return await prefs.setStringList(key, jsonList); // Await the result of setStringList
  }

  static Future<List<GeoLocation>> getCustomGeoList(String key) async {
    var prefs = await _instance;
    List<String>? jsonStringList = prefs.getStringList(key);
    if (jsonStringList != null) {
      return jsonStringList.map((jsonString) =>
          GeoLocation.fromMap(jsonDecode(jsonString))).toList();
    } else {
      return []; // Return an empty list if no value is found for the key
    }
  }
  static Future<bool> setCustomList<T>(
      String key, List<T> list, Map<String, dynamic> Function(T) toMap
      ) async {
    var prefs = await _instance;
    List<String> jsonList = list.map((item) => jsonEncode(toMap(item))).toList();
    return prefs.setStringList(key, jsonList);
  }

  static List<T> getCustomList<T>(
      String key, T Function(Map<String, dynamic>) fromMap
      ) {
    List<String>? jsonStringList = _prefsInstance?.getStringList(key);
    if (jsonStringList != null) {
      return jsonStringList.map((jsonString) =>
          fromMap(jsonDecode(jsonString))).toList();
    } else {
      return []; // Return an empty list if no value is found for the key
    }
  }


  static Future<bool> setCenterList(String key, List<CenterModel> list) async {
    var prefs = await _instance;
    List<String> jsonList = list.map((item) => jsonEncode(item.toMap())).toList();
    return await prefs.setStringList(key, jsonList); // Await the result of setStringList
  }

  static Future<List<CenterModel>> getCenterList(String key) async {
    var prefs = await _instance;
    List<String>? jsonStringList = prefs.getStringList(key);
    if (jsonStringList != null) {
      return jsonStringList.map((jsonString) =>
          CenterModel.fromMap(jsonDecode(jsonString))).toList();
    } else {
      return []; // Return an empty list if no value is found for the key
    }
  }
  static Future<bool> setDateTime(String key, DateTime value) async {
    var prefs = await _instance;
    return prefs.setString(key, value.toIso8601String());
  }

  static DateTime? getDateTime(String key) {
    String? dateString = _prefsInstance?.getString(key);
    if (dateString != null) {
      return DateTime.tryParse(dateString);
    } else {
      return null; // Return null if no value is found for the key
    }
  }

  static Future<bool> removekey(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static Future<void> reload() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.reload();
  }
  static void clearAll() async {
    var prefs = await _instance;
    prefs.clear();
  }

}


