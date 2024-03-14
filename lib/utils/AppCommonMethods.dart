import 'dart:convert';
import 'dart:io' as io;
import 'dart:math';

class AppCommonMethods
{
  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getBase64Image(String imagePath)
  {
    String base64Image="";
    if(imagePath!=null)
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