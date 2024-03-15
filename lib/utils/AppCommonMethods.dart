import 'dart:convert';
import 'dart:io' as io;
import 'dart:math';

import 'package:flutter/material.dart';

class AppCommonMethods
{
  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getBase64Image(String imagePath)
  {
    String base64Image="";
    if(imagePath!=null && imagePath!="")
    {
      final bytes = io.File(imagePath).readAsBytesSync();
      base64Image = base64Encode(bytes);
      print(base64Image);
    }

    return base64Image;
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

}

Future<String> getDatePicker(BuildContext context) async {

  String selectedDate="";
  //final CounterController counterController = Get.put(CounterController());
  DateTime? picked = await showDatePicker(
      context: context,
      //initialDate: DateTime.now(), // Provide an initial date if desired
      firstDate: DateTime(1990),
      lastDate: DateTime.now()
  );
  if(picked!=null)
  {
    selectedDate= picked.toString().split(" ")[0];
  }
  return selectedDate;
}