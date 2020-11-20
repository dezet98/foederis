import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Geolocation {
  DocumentReference id;
  Float latitude;
  Float longitude;
  String city;

  Geolocation({@required this.id, this.latitude, this.longitude});
}
