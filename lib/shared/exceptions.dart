import 'package:engineering_thesis/constants/enums.dart';
import 'package:flutter/cupertino.dart';

class AppException implements Exception {
  String errorMsg;

  AppException({this.errorMsg});

  set setError(String error) {
    errorMsg = error;
  }

  String get errors => errorMsg;
}

class LoginException implements Exception {
  LoginError loginError;
  String message;

  LoginException({@required this.loginError, this.message});
}
