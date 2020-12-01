import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/shared/extensions.dart';
import 'package:flutter/cupertino.dart';

enum ActivityAttributes {
  ref,
  title,
  categoryRef,
  startDate,
  maxEntry,
  minEntry,
  freeJoin,
  regular,
  geolocationRef
}

class Activity {
  DocumentReference ref;
  String title;
  DocumentReference categoryRef;
  DateTime startDate;
  DateTime endDate;
  int maxEntry;
  int minEntry;
  bool freeJoin;
  bool regular;
  DocumentReference geolocationRef;

  Activity({
    @required this.ref,
    this.title,
    this.categoryRef,
    this.endDate,
    this.freeJoin,
    this.geolocationRef,
    this.maxEntry,
    this.minEntry,
    this.regular,
    this.startDate,
  });

  Activity.fromDocument(QueryDocumentSnapshot doc) {
    this.ref = doc.reference;
    this.title = doc.getField('title');
    this.categoryRef = doc.getField('categoryRef');
    this.startDate = doc.getField<DateTime>('startDate');
    this.endDate = doc.getField<DateTime>('endDate');
    this.maxEntry = doc.getField('maxEntry');
    this.minEntry = doc.getField('minEntry');
    this.freeJoin = doc.getField('freeJoin');
    this.regular = doc.getField('regular');
    this.geolocationRef = doc.getField('geolocationRef');
  }

  dynamic getValue(ActivityAttributes activityAttributes) {
    switch (activityAttributes) {
      case ActivityAttributes.ref:
        return this.ref;
        break;
      case ActivityAttributes.title:
        return this.title;
        break;
      case ActivityAttributes.categoryRef:
        return this.categoryRef;
        break;
      case ActivityAttributes.startDate:
        return this.startDate;
        break;
      case ActivityAttributes.maxEntry:
        return this.maxEntry;
        break;
      case ActivityAttributes.minEntry:
        return this.minEntry;
        break;
      case ActivityAttributes.freeJoin:
        return this.freeJoin;
        break;
      case ActivityAttributes.regular:
        return this.regular;
        break;
      case ActivityAttributes.geolocationRef:
        return this.geolocationRef;
        break;
    }
  }
}
