import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

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

  static showInternetSnackbar(BuildContext context) {
    const snackBar = SnackBar(
        content: Text(
            'Ops, verifique sua conexão com a internet e tente novamente!'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        }
      } on SocketException catch (_) {
        return false;
      }
    }
    return false;
  }
}
