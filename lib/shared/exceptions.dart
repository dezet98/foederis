import 'package:meta/meta.dart';

import 'constants/enums.dart';

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

class FetchingException implements Exception {
  final FetchingError fetchingError;
  final String message;

  FetchingException({@required this.fetchingError, this.message});
}

class UploadDataException implements Exception {
  final UploadDataError sendingDataError;
  final String message;

  UploadDataException({@required this.sendingDataError, this.message});

  @override
  String toString() {
    return 'UploadDataException {errorCode: ${sendingDataError.toString()}, message: $message}';
  }
}
