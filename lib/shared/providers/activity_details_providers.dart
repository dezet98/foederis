import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/specific_blocs/common/categories_fetching_bloc.dart';
import '../../repositories/category_repository.dart';

dynamic getActivityDetailsScreenBlocProviders() => [
      BlocProvider(
        create: (context) => CategoriesFetchingBloc(
          categoryRepository:
              RepositoryProvider.of<CategoryRepository>(context),
        ),
      ),
    ];
