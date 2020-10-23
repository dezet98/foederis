import 'package:engineering_thesis/models/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<UserCredential> signAnon() async {
    var x = await _firebaseAuth.signInAnonymously();
    print(x); // TODO
    return x;
  }

  Stream<AppUser> get authStream {
    return _firebaseAuth.authStateChanges().asyncMap(AppUser.toAppUser);
  }

  Future<void> signOut() async {
    return Future.wait([_firebaseAuth.signOut()]);
  }
}
