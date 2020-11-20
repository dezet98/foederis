import 'package:engineering_thesis/constants/enums.dart';
import 'package:meta/meta.dart';

class LoginException implements Exception {
  final LoginError loginError;
  final String message;

  LoginException({@required this.loginError, this.message});
}

class RegisterException implements Exception {
  final RegisterError registerError;
  final String message;

  RegisterException({@required this.registerError, this.message});
}

class SignOutException implements Exception {
  final String error;

  SignOutException({this.error});
}

class QueryException implements Exception {
  final QueryError queryError;
  final String message;

  QueryException({@required this.queryError, this.message});
}
