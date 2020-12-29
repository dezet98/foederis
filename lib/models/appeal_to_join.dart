import 'package:cloud_firestore/cloud_firestore.dart';

import '../shared/extensions.dart';
import 'collections/appeal_to_join_collection.dart';

class AppealToJoin {
  DocumentReference ref;
  DocumentReference activityRef;
  DocumentReference userRef;
  DateTime submissionDate;
  String comment;

  AppealToJoin.fromDocument(DocumentSnapshot doc) {
    this.ref = doc.reference;
    this.activityRef = doc.getField(AppealToJoinCollection.activityRef);
    this.userRef = doc.getField(AppealToJoinCollection.userRef);
    this.submissionDate =
        doc.getField<DateTime>(AppealToJoinCollection.submissionDate);
    this.comment = doc.getField(AppealToJoinCollection.comment);
  }

  AppealToJoin.fromMap(Map<String, dynamic> data) {
    this.activityRef = data[AppealToJoinCollection.activityRef.fieldName];
    this.userRef = data[AppealToJoinCollection.userRef.fieldName];
    this.submissionDate = data[AppealToJoinCollection.submissionDate.fieldName];
    this.comment = data[AppealToJoinCollection.comment.fieldName];
  }

  toMap() {
    return {
      AppealToJoinCollection.activityRef.fieldName: activityRef,
      AppealToJoinCollection.userRef.fieldName: userRef,
      AppealToJoinCollection.submissionDate.fieldName: submissionDate,
      AppealToJoinCollection.comment.fieldName: comment,
    };
  }
}
