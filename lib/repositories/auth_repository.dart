import 'package:engineering_thesis/constants/enums.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/shared/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({FirebaseAuth firebaseAuth})
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
      } else if (e is PlatformException) {
        throw LoginException(loginError: LoginError.other, message: e.code);
      }
      throw LoginException(loginError: LoginError.other, message: e.toString());
    }
  }

  Stream<AppUser> get authStream {
    return _firebaseAuth.authStateChanges().asyncMap(AppUser.toAppUser);
  }

  Future<void> signOut() async {
    return Future.wait([_firebaseAuth.signOut()]);
  }
}
