import 'package:engineering_thesis/shared/constants/errors.dart';
import 'package:engineering_thesis/shared/exceptions/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../shared/exceptions/exceptions.dart';

class RemoteAuthService {
  final FirebaseAuth _firebaseAuth;

  RemoteAuthService({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassword(
      {@required String email, @required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      if (e is FirebaseAuthException &&
          (e.code == "user-not-found" || e.code == "wrong-password")) {
        throw LoginException(loginError: LoginError.bad_credentials);
      }
      throw LoginException(
          loginError: LoginError.undefined, message: e.toString());
    }
  }

  Future<void> createUserWithEmailAndPassword(
      {@required email, @required password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case "invalid-email":
            throw RegisterException(registerError: RegisterError.invalid_email);
          case "email-already-in-use":
            throw RegisterException(
                registerError: RegisterError.email_already_in_use);
          case "weak-password":
            throw RegisterException(registerError: RegisterError.weak_password);
          case "operation-not-allowed":
            throw RegisterException(
                registerError: RegisterError.operation_not_allowed);
        }
      }
      throw RegisterException(
          registerError: RegisterError.undefined, message: e.toString());
    }
  }

  Stream<User> get authStream {
    return _firebaseAuth.authStateChanges();
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw SignOutException(error: e.toString());
    }
  }
}
