import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/shared/app_logger.dart';
import 'package:engineering_thesis/shared/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<UserCredential> signAnon() async {
    var x = await _firebaseAuth.signInAnonymously();
    x != null
        ? AppLogger()
            .log(message: 'Logged in (anonymously)', logLevel: LogLevel.info)
        : AppLogger().log(
            message: 'Not logged in (anonymously)', logLevel: LogLevel.error);
    return x;
  }

  Future<void> signInWithEmailAndPassword(
      {@required String email, @required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (exception) {
      throw (exception.toString());
    }
  }

  Stream<AppUser> get authStream {
    return _firebaseAuth.authStateChanges().asyncMap(AppUser.toAppUser);
  }

  Future<void> signOut() async {
    return Future.wait([_firebaseAuth.signOut()]);
  }
}
