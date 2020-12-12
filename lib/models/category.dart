import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/models/collections/category_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:engineering_thesis/shared/extensions.dart';

class Category {
  DocumentReference ref;
  String title;

  Category({@required this.ref, this.title});

  Category.fromDocument(QueryDocumentSnapshot doc) {
    this.ref = doc.reference;
    this.title = doc.getField(CategoryCollection.title.fieldName);
  }
}
