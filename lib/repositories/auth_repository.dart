import 'package:engineering_thesis/shared/services/firebase_auth_service.dart';
import 'package:meta/meta.dart';

class AuthRepository {
  final FirebaseAuthService firebaseAuthService;

  AuthRepository({@required this.firebaseAuthService});

  Future<void> signAnon() async {
    firebaseAuthService.signAnon();
  }
}
