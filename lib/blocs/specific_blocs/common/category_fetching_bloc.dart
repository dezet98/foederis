import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/data/models/category.dart';
import 'package:engineering_thesis/data/repositories/category_repository.dart';
import 'package:meta/meta.dart';

import '../../abstract_blocs/fetch/fetch_bloc.dart';

class CategoryFetchingBloc extends FetchBloc {
  CategoryRepository categoryRepository;
  DocumentReference categoryRef;

  CategoryFetchingBloc(
      {@required this.categoryRepository, @required this.categoryRef});

  @override
  Future<Category> fetch(_) async {
    return await categoryRepository.fetchCategory(categoryRef);
  }
}
