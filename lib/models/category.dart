import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Category {
  DocumentReference id;
  String title;

  Category({@required this.id, this.title});
}
