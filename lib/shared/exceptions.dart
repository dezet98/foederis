class AppException implements Exception {
  String errorMsg;

  AppException({this.errorMsg});

  set setError(String error) {
    errorMsg = error;
  }

  String get errors => errorMsg;
}

class SignInWithEmailAndPasswordFailure extends AppException {}
