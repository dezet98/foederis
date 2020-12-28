import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/shared/constants/enums.dart';
import 'package:meta/meta.dart';

import '../models/category.dart';
import '../models/collections/category_collection.dart';
import '../models/fetch_filter.dart';
import '../shared/remote_repository.dart';

class CategoryRepository {
  final RemoteRepository database;
  final String collectionName = CategoryCollection.collectionName;
  CategoryRepository({@required this.database});

  List<Category> _fromQuerySnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((DocumentSnapshot e) => Category.fromDocument(e))
        .toList();
  }

  Category _fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return Category.fromDocument(documentSnapshot);
  }

  Future<List<Category>> fetchAllCategories({String title}) async {
    List<FetchFilter> filters = [];
    if (title != null)
      filters.add(
        FetchFilter(
          fieldName: CategoryCollection.title.fieldName,
          fieldValue: title,
          filterType: FetchFilterType.isEqualTo,
        ),
      );

    return await database.getCollection<List<Category>>(
        filters, collectionName, _fromQuerySnapshot);
  }

  Future<Category> fetchCategory(DocumentReference categoryRef) async {
    return await database.getCollectionItem<Category>(
      categoryRef.path,
      _fromDocumentSnapshot,
    );
  }
}
