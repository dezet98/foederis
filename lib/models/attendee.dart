import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/models/collections/attendee_collection.dart';

import '../shared/extensions.dart';
import 'collections/collection.dart';

class Attendee {
  DocumentReference ref;
  DocumentReference activityRef;
  DocumentReference userRef;
  DateTime joinDate;

  Attendee.fromDocument(DocumentSnapshot doc) {
    this.ref = doc.reference;
    this.activityRef = doc.getField(AttendeeCollection.activityRef);
    this.userRef = doc.getField(AttendeeCollection.userRef);
    this.joinDate = doc.getField<DateTime>(AttendeeCollection.joinDate);
  }

  Attendee.fromMap(Map<String, dynamic> data) {
    data = Collection.fillRemainsData(data, AttendeeCollection.allFields);
    this.activityRef = data[AttendeeCollection.activityRef.fieldName];
    this.userRef = data[AttendeeCollection.userRef.fieldName];
    this.joinDate = data[AttendeeCollection.joinDate.fieldName];
  }

  toMap() {
    return {
      AttendeeCollection.activityRef.fieldName: activityRef,
      AttendeeCollection.userRef.fieldName: userRef,
      AttendeeCollection.joinDate.fieldName: joinDate,
    };
  }
}
