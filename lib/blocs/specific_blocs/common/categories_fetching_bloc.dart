import 'package:meta/meta.dart';

import '../../../models/category.dart';
import '../../../repositories/category_repository.dart';
import '../../abstract_blocs/fetch/fetch_bloc.dart';

class CategoriesFetchingBloc extends FetchBloc {
  CategoryRepository categoryRepository;

  CategoriesFetchingBloc({@required this.categoryRepository});

  @override
  Future<List<Category>> fetch(_) async {
    return await categoryRepository.fetchAllCategories();
  }
}
