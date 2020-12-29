import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../models/category.dart';
import '../../../repositories/category_repository.dart';
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
