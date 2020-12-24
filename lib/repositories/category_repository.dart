import 'package:cloud_firestore/cloud_firestore.dart';
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
        .map((QueryDocumentSnapshot e) => Category.fromDocument(e))
        .toList();
  }

  Future<List<Category>> fetchAllCategories(List<FetchFilter> filters) async {
    return await database.fetchCollection<List<Category>>(
        filters, collectionName, _fromQuerySnapshot);
  }
}
