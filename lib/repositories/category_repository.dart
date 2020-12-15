import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/models/category.dart';
import 'package:engineering_thesis/models/collections/category_collection.dart';
import 'package:engineering_thesis/models/fetch_filter.dart';
import 'package:engineering_thesis/shared/remote_repository.dart';
import 'package:meta/meta.dart';

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
