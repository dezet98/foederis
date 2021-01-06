import 'package:engineering_thesis/data/repositories/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/specific_blocs/common/categories_fetching_bloc.dart';

dynamic getActivityDetailsScreenBlocProviders() => [
      BlocProvider(
        create: (context) => CategoriesFetchingBloc(
          categoryRepository:
              RepositoryProvider.of<CategoryRepository>(context),
        ),
      ),
    ];
