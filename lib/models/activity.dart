import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/models/collections/collection.dart';
import 'package:engineering_thesis/shared/extensions.dart';

import 'collections/activity_collection.dart';

class ActivityAttributes {
  static String ref = 'ref';
  static String title = 'title';
  static String categoryRef = 'categoryRef';
  static String startDate = 'startDate';
  static String endDate = 'endDate';
  static String maxEntry = 'maxEntry';
  static String minEntry = 'minEntry';
  static String freeJoin = "freeJoin";
  static String regular = 'regular';
  static String geolocationRef = 'geolocationRef';
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

  // Activity({
  //   @required this.ref,
  //   @required this.title,
  //   @required this.categoryRef,
  //   @required this.endDate,
  //   @required this.freeJoin,
  //   @required this.geolocationRef,
  //   @required this.maxEntry,
  //   @required this.minEntry,
  //   @required this.regular,
  //   @required this.startDate,
  // });

  Activity.fromDocument(QueryDocumentSnapshot doc) {
    this.ref = doc.reference;
    this.title = doc.getField(ActivityAttributes.title);
    this.categoryRef = doc.getField(ActivityAttributes.categoryRef);
    this.startDate = doc.getField<DateTime>(ActivityAttributes.startDate);
    this.endDate = doc.getField<DateTime>(ActivityAttributes.endDate);
    this.maxEntry = doc.getField(ActivityAttributes.maxEntry);
    this.minEntry = doc.getField(ActivityAttributes.minEntry);
    this.freeJoin = doc.getField(ActivityAttributes.freeJoin);
    this.regular = doc.getField(ActivityAttributes.regular);
    this.geolocationRef = doc.getField(ActivityAttributes.geolocationRef);
  }

  Activity.fromMap(Map<String, dynamic> data) {
    data = Collection.fillRemainsData(data, ActivityCollection.allFields);
    this.title = data[ActivityCollection.title.fieldName];
    this.categoryRef = data[ActivityCollection.categoryRef.fieldName];
    this.startDate = data[ActivityCollection.startDate.fieldName];
    this.endDate = data[ActivityCollection.endDate.fieldName];
    this.maxEntry = data[ActivityCollection.maxEntry.fieldName];
    this.minEntry = data[ActivityCollection.minEntry.fieldName];
    this.freeJoin = data[ActivityCollection.freeJoin.fieldName];
    this.regular = data[ActivityCollection.regular.fieldName];
    this.geolocationRef = data[ActivityCollection.geolocationRef.fieldName];
  }

  toMap() {
    return {
      ActivityCollection.ref.fieldName: null,
      ActivityCollection.title.fieldName: title,
      ActivityCollection.regular.fieldName: regular,
      ActivityCollection.endDate.fieldName: endDate,
      ActivityCollection.startDate.fieldName: startDate,
      ActivityCollection.freeJoin.fieldName: freeJoin,
      ActivityCollection.geolocationRef.fieldName: geolocationRef,
      ActivityCollection.categoryRef.fieldName: categoryRef,
      ActivityCollection.maxEntry.fieldName: maxEntry,
      ActivityCollection.minEntry.fieldName: minEntry,
    };
  }
}
