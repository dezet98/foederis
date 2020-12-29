import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/models/collections/attendee_collection.dart';
import 'package:engineering_thesis/shared/utils/enums.dart';

import '../shared/extensions.dart';

class Attendee {
  DocumentReference ref;
  DocumentReference activityRef;
  DocumentReference userRef;
  DateTime joinDate;
  AttendeeRole role;

  Attendee.fromDocument(DocumentSnapshot doc) {
    this.ref = doc.reference;
    this.activityRef = doc.getField(AttendeeCollection.activityRef);
    this.userRef = doc.getField(AttendeeCollection.userRef);
    this.joinDate = doc.getField<DateTime>(AttendeeCollection.joinDate);
    this.role = enumFromString<AttendeeRole>(
        AttendeeRole.values, doc.getField(AttendeeCollection.role));
  }

  Attendee.fromMap(Map<String, dynamic> data) {
    this.activityRef = data[AttendeeCollection.activityRef.fieldName];
    this.userRef = data[AttendeeCollection.userRef.fieldName];
    this.joinDate = data[AttendeeCollection.joinDate.fieldName];
    this.role = data[AttendeeCollection.role.fieldName];
  }

  toMap() {
    return {
      AttendeeCollection.activityRef.fieldName: activityRef,
      AttendeeCollection.userRef.fieldName: userRef,
      AttendeeCollection.joinDate.fieldName: joinDate,
      AttendeeCollection.role.fieldName: enumToString(role),
    };
  }
}
