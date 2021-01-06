import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/utils/enums.dart';
import 'package:flutter/cupertino.dart';

import '../../shared/extensions/extensions.dart';
import 'collections/category_collection.dart';

enum CategoryName {
  football,
  beer,
}

class Category {
  DocumentReference ref;
  CategoryName title;

  Category.fromDocument(DocumentSnapshot doc) {
    this.ref = doc.reference;
    this.title = enumFromString<CategoryName>(
        CategoryName.values, doc.getField(CategoryCollection.title));
  }

  String titleAsString(BuildContext context) {
    switch (title) {
      case CategoryName.football:
        return S.of(context).category_football;
        break;
      case CategoryName.beer:
        return S.of(context).category_beer;
        break;
    }

    return enumToString(title);
  }
}
