import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_bloc.dart';
import 'package:engineering_thesis/models/category.dart';
import 'package:engineering_thesis/models/fetch_filter.dart';
import 'package:engineering_thesis/repositories/category_repository.dart';
import 'package:meta/meta.dart';

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
