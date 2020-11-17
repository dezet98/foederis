import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Activity {
  DocumentReference id;
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
    @required this.id,
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
}
