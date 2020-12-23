import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/models/collections/collection.dart';
import 'package:engineering_thesis/shared/extensions.dart';
import 'package:geohash/geohash.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'collections/activity_collection.dart';

class Activity {
  DocumentReference ref;
  String title;
  DocumentReference categoryRef;
  DateTime startDate;
  int maxEntry;
  int minEntry;
  bool freeJoin;
  bool regular;
  String geohash;
  String address;

  Activity.fromDocument(QueryDocumentSnapshot doc) {
    this.ref = doc.reference;
    this.title = doc.getField(ActivityCollection.title.fieldName);
    this.categoryRef = doc.getField(ActivityCollection.categoryRef.fieldName);
    this.startDate =
        doc.getField<DateTime>(ActivityCollection.startDate.fieldName);
    this.maxEntry = doc.getField(ActivityCollection.maxEntry.fieldName);
    this.minEntry = doc.getField(ActivityCollection.minEntry.fieldName);
    this.freeJoin = doc.getField(ActivityCollection.freeJoin.fieldName);
    this.regular = doc.getField(ActivityCollection.regular.fieldName);
    this.geohash = doc.getField(ActivityCollection.geohash.fieldName);
    this.address = doc.getField(ActivityCollection.address.fieldName);
  }

  Activity.fromMap(Map<String, dynamic> data) {
    data = Collection.fillRemainsData(data, ActivityCollection.allFields);
    this.title = data[ActivityCollection.title.fieldName];
    this.categoryRef = data[ActivityCollection.categoryRef.fieldName];
    this.startDate = data[ActivityCollection.startDate.fieldName];
    this.maxEntry = data[ActivityCollection.maxEntry.fieldName];
    this.minEntry = data[ActivityCollection.minEntry.fieldName];
    this.freeJoin = data[ActivityCollection.freeJoin.fieldName];
    this.regular = data[ActivityCollection.regular.fieldName];
    this.geohash = data[ActivityCollection.geohash.fieldName];
    this.address = data[ActivityCollection.address.fieldName];
  }

  toMap() {
    return {
      ActivityCollection.title.fieldName: title,
      ActivityCollection.regular.fieldName: regular,
      ActivityCollection.startDate.fieldName: startDate,
      ActivityCollection.freeJoin.fieldName: freeJoin,
      ActivityCollection.geohash.fieldName: geohash,
      ActivityCollection.categoryRef.fieldName: categoryRef,
      ActivityCollection.maxEntry.fieldName: maxEntry,
      ActivityCollection.minEntry.fieldName: minEntry,
      ActivityCollection.address.fieldName: address,
    };
  }

  LatLng get latLng => LatLng(
        Geohash.decode(this.geohash).x,
        Geohash.decode(this.geohash).y,
      );
}
