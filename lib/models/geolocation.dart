import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:engineering_thesis/shared/extensions.dart';

class Geolocation {
  DocumentReference ref;
  double latitude;
  double longitude;
  String city;

  Geolocation({@required this.ref, this.latitude, this.longitude, this.city});

  Geolocation.fromDocument(QueryDocumentSnapshot doc) {
    this.ref = doc.reference;
    this.latitude = doc.getField<double>('latitude');
    this.longitude = doc.getField<double>('longitude');
    this.city = doc.getField<String>('city');
  }
}
