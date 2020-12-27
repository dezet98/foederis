import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../shared/extensions.dart';
import 'collections/category_collection.dart';

class Category {
  DocumentReference ref;
  String title;

  Category({@required this.ref, this.title});

  Category.fromDocument(DocumentSnapshot doc) {
    this.ref = doc.reference;
    this.title = doc.getField(CategoryCollection.title.fieldName);
  }
}
