import 'package:meta/meta.dart';

import '../constants/errors.dart';

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

class StreamException implements Exception {
  final StreamError streamError;
  final String message;

  StreamException({@required this.streamError, this.message});
}

class SendingDataException implements Exception {
  final UploadDataError sendingDataError;
  final String message;

  SendingDataException({@required this.sendingDataError, this.message});

  @override
  String toString() {
    return 'SendingDataException {errorCode: ${sendingDataError.toString()}, message: $message}';
  }
}

class StorageException implements Exception {
  final StorageError storageError;
  final String message;

  StorageException({@required this.storageError, this.message});
}
