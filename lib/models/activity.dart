import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/shared/extensions.dart';
import 'package:flutter/cupertino.dart';

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
    this.startDate = doc.getDataTimeField('startDate');
    this.endDate = doc.getDataTimeField('endDate');
    this.maxEntry = doc.getField('maxEntry');
    this.minEntry = doc.getField('minEntry');
    this.freeJoin = doc.getField('freeJoin');
    this.regular = doc.getField('regular');
    this.geolocationRef = doc.getField('geolocationRef');
  }
}
