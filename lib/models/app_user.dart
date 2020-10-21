import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AppUser {
  String id;
  String firstName;
  String secondName;
  String email;

  AppUser({@required this.id, this.firstName, this.secondName, this.email});

  static AppUser toAppUser(User firebaseUser) {
    return AppUser(id: firebaseUser.uid);
  }
}
