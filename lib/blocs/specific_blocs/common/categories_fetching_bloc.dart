import 'package:engineering_thesis/data/models/category.dart';
import 'package:engineering_thesis/data/repositories/category_repository.dart';
import 'package:meta/meta.dart';

import '../../abstract_blocs/fetch/fetch_bloc.dart';

class CategoriesFetchingBloc extends FetchBloc {
  CategoryRepository categoryRepository;

  CategoriesFetchingBloc({@required this.categoryRepository});

  @override
  Future<List<Category>> fetch(_) async {
    return await categoryRepository.fetchAllCategories();
  }
}
