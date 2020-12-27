import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/models/collections/user_collection.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:engineering_thesis/shared/extensions.dart';

import 'collections/collection.dart';

class AppUser {
  DocumentReference ref;
  String email;
  String firstName;
  String secondName;

  // AppUser({this.ref, this.firstName, this.secondName, this.email});

  // static AppUser toAppUser(User firebaseUser) {
  //   return firebaseUser == null ? null : AppUser(ref: firebaseUser?.uid);
  // }

  AppUser.fromDocument(DocumentSnapshot doc) {
    this.ref = doc.reference;
    this.email = doc.getField(UserCollection.email);
    this.firstName = doc.getField(UserCollection.firstName);
  }

  AppUser.fromMap(Map<String, dynamic> data) {
    data = Collection.fillRemainsData(data, UserCollection.allFields);
    this.email = data[UserCollection.email.fieldName];
    this.firstName = data[UserCollection.firstName.fieldName];
    this.secondName = data[UserCollection.secondName.fieldName];
  }

  toMap() {
    return {
      UserCollection.email.fieldName: email,
      UserCollection.firstName.fieldName: firstName,
      UserCollection.secondName.fieldName: secondName,
    };
  }
}
