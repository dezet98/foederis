import 'package:engineering_thesis/constants/enums.dart';
import 'package:meta/meta.dart';

class LoginException implements Exception {
  LoginError loginError;
  String message;

  LoginException({@required this.loginError, this.message});
}

class SignOutException implements Exception {
  final String error;

  SignOutException({this.error});
}
