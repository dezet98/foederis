import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:geohash/geohash.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../shared/extensions/extensions.dart';
import 'attendee.dart';
import 'category.dart';
import 'collections/activity_collection.dart';

class Activity {
  DocumentReference ref;
  DocumentReference userRef;
  String title;
  DocumentReference categoryRef;
  DateTime startDate;
  int maxEntry;
  int minEntry;
  bool freeJoin;
  String description;
  String geohash;
  String address;
  bool isCancel;

  // additional fields
  Category category;
  Attendee attendee;

  Activity.fromDocument(DocumentSnapshot doc) {
    this.ref = doc.reference;
    this.userRef = doc.getField(ActivityCollection.userRef);
    this.title = doc.getField(ActivityCollection.title);
    this.categoryRef = doc.getField(ActivityCollection.categoryRef);
    this.startDate = doc.getField<DateTime>(ActivityCollection.startDate);
    this.maxEntry = doc.getField(ActivityCollection.maxEntry);
    this.minEntry = doc.getField(ActivityCollection.minEntry);
    this.freeJoin = doc.getField(ActivityCollection.freeJoin);
    this.description = doc.getField(ActivityCollection.description);
    this.geohash = doc.getField(ActivityCollection.geohash);
    this.address = doc.getField(ActivityCollection.address);
    this.isCancel = doc.getField(ActivityCollection.isCancel);
  }

  Activity.fromMap(Map<String, dynamic> data) {
    this.userRef = data[ActivityCollection.userRef.fieldName];
    this.title = data[ActivityCollection.title.fieldName];
    this.categoryRef = data[ActivityCollection.categoryRef.fieldName];
    this.startDate = data[ActivityCollection.startDate.fieldName];
    this.maxEntry = data[ActivityCollection.maxEntry.fieldName];
    this.minEntry = data[ActivityCollection.minEntry.fieldName];
    this.freeJoin = data[ActivityCollection.freeJoin.fieldName];
    this.description = data[ActivityCollection.description.fieldName];
    this.geohash = data[ActivityCollection.geohash.fieldName];
    this.address = data[ActivityCollection.address.fieldName];
    this.isCancel = data[ActivityCollection.isCancel.fieldName];
  }

  toMap() {
    return {
      ActivityCollection.userRef.fieldName: userRef,
      ActivityCollection.title.fieldName: title,
      ActivityCollection.description.fieldName: description,
      ActivityCollection.startDate.fieldName: startDate,
      ActivityCollection.freeJoin.fieldName: freeJoin,
      ActivityCollection.geohash.fieldName: geohash,
      ActivityCollection.categoryRef.fieldName: categoryRef,
      ActivityCollection.maxEntry.fieldName: maxEntry,
      ActivityCollection.minEntry.fieldName: minEntry,
      ActivityCollection.address.fieldName: address,
      ActivityCollection.isCancel.fieldName: isCancel,
    };
  }

  LatLng get latLng => LatLng(
        Geohash.decode(this.geohash).x,
        Geohash.decode(this.geohash).y,
      );

  bool get isFinish => this.startDate.isBefore(DateTime.now());

  String status(BuildContext context, List<Attendee> attendees) {
    if (isCancel) return S.of(context).activity_cancel_status;

    if (startDate.isBefore(DateTime.now()))
      return S.of(context).activity_finish_status;

    if (attendees.length > maxEntry)
      return S.of(context).activity_no_places_status;

    return S.of(context).activity_open_status;
  }

  Duration get timeToStart => startDate.difference(DateTime.now());
}
