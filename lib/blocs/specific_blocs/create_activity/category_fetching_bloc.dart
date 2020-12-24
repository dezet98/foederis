import 'package:meta/meta.dart';

import '../../../models/category.dart';
import '../../../models/fetch_filter.dart';
import '../../../repositories/category_repository.dart';
import '../../abstract_blocs/fetch/fetch_bloc.dart';

class CategoryFetchingBloc extends FetchBloc<List<Category>> {
  CategoryRepository categoryRepository;

  CategoryFetchingBloc({@required this.categoryRepository});

  @override
  Future<List<Category>> fetch(List<FetchFilter> filters) async {
    return await categoryRepository.fetchAllCategories(filters);
  }

  @override
  List get initialFilters => null;
}
