import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

abstract class Collection {
  final String collectionName;

  Collection({@required this.collectionName});

  dynamic fromQuerySnapshot(QuerySnapshot querySnapshot);

  Map<String, dynamic> fillRemainsData(Map<String, dynamic> data);
}
