import 'dart:convert';

import 'package:crypto/crypto.dart';

import '../model/errors/dio_errors.dart';

abstract class Utils {
  static String textToMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }

  static Future<void>? handlingExceptions(int? statusCode) {
    switch (statusCode) {
      case 400:
        throw DioErrors.badRequest;
      case 401:
        throw DioErrors.unauthorized;
      case 403:
        throw DioErrors.forbiden;
      case 404:
        throw DioErrors.notFound;
      case 409:
        throw DioErrors.invalidParameter;
      case 500:
        throw DioErrors.serverError;
      default:
        throw DioErrors.invalidData;
    }
  }
}
