import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/models/collections/user_collection.dart';
import 'package:engineering_thesis/shared/extensions.dart';
import 'package:engineering_thesis/shared/utils/enums.dart';

import 'collections/collection.dart';

enum Gender {
  male,
  female,
  prefer_not_to_say,
}

class AppUser {
  DocumentReference ref;
  String email;
  String firstName;
  String secondName;
  DateTime birthday;
  Gender gender;
  String about;
  String phone;

  AppUser.fromDocument(DocumentSnapshot doc) {
    this.ref = doc.reference;
    this.email = doc.getField(UserCollection.email);
    this.firstName = doc.getField(UserCollection.firstName);
    this.secondName = doc.getField(UserCollection.secondName);
    this.birthday = doc.getField<DateTime>(UserCollection.birthday);
    this.gender = enumFromString<Gender>(
        Gender.values, doc.getField(UserCollection.gender));
    this.about = doc.getField(UserCollection.about);
    this.phone = doc.getField(UserCollection.phone);
  }

  AppUser.fromMap(Map<String, dynamic> data) {
    data = Collection.fillRemainsData(data, UserCollection.allFields);
    this.email = data[UserCollection.email.fieldName];
    this.firstName = data[UserCollection.firstName.fieldName];
    this.secondName = data[UserCollection.secondName.fieldName];
    this.birthday = data[UserCollection.birthday.fieldName];
    this.gender = data[UserCollection.gender.fieldName];
    this.about = data[UserCollection.about.fieldName];
    this.phone = data[UserCollection.phone.fieldName];
  }

  toMap() {
    return {
      UserCollection.email.fieldName: email,
      UserCollection.firstName.fieldName: firstName,
      UserCollection.secondName.fieldName: secondName,
      UserCollection.birthday.fieldName: birthday,
      UserCollection.gender.fieldName: gender,
      UserCollection.about.fieldName: about,
      UserCollection.phone.fieldName: phone,
    };
  }
}
