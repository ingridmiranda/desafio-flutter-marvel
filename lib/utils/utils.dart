import 'dart:convert';

import 'package:crypto/crypto.dart';

abstract class Utils {
  static String textToMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }
}
