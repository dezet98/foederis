import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/create_activity/create_activity_send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/home_screen_bottom_nav_bar_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_distance_send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_fetching_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_filters_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_search_filter_bloc.dart';
import 'package:engineering_thesis/data/repositories/activity_repository.dart';
import 'package:engineering_thesis/data/repositories/attendee_repository.dart';
import 'package:engineering_thesis/data/repositories/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/specific_blocs/common/categories_fetching_bloc.dart';
import '../../blocs/specific_blocs/create_activity/create_activity_form_data.dart';
import '../../blocs/specific_blocs/shared_preferences/shared_preferences_bloc.dart';
import '../local_database/database_helper.dart';
import '../local_database/shared_preferences.dart';

dynamic getHomeScreenBlocProviders() => [
      BlocProvider(
        create: (context) => HomeScreenBottomNavBarBloc(),
      ),
      BlocProvider(
        create: (context) =>
            SharedPreferencesBloc(DatabaseHelper.instance, SharedPreferences()),
      ),
      BlocProvider(
        create: (context) => SearchActivitiesSearchFilterBloc(
            sharedPreferencesBloc:
                BlocProvider.of<SharedPreferencesBloc>(context)),
      ),
      BlocProvider(
        create: (context) => SearchActivitiesFetchingBloc(
          categoryRepository:
              RepositoryProvider.of<CategoryRepository>(context),
          activityRepository:
              RepositoryProvider.of<ActivityRepository>(context),
          userDataBloc: BlocProvider.of<UserDataBloc>(context),
        ),
      ),
      BlocProvider(
        create: (context) => SearchActivitiesFiltersBloc(),
      ),
      BlocProvider(
        create: (context) => CreateActivitySendBloc(
            RepositoryProvider.of<ActivityRepository>(context),
            RepositoryProvider.of<AttendeeRepository>(context),
            RepositoryProvider.of<UserDataBloc>(context)),
      ),
      BlocProvider(
        create: (context) => CategoriesFetchingBloc(
          categoryRepository:
              RepositoryProvider.of<CategoryRepository>(context),
        ),
      ),
      BlocProvider(
        create: (context) => CreateActvityFormDataBloc(
            activityRepository:
                RepositoryProvider.of<ActivityRepository>(context),
            categoryRepository:
                RepositoryProvider.of<CategoryRepository>(context),
            categoryFetchingBloc:
                BlocProvider.of<CategoriesFetchingBloc>(context)),
      ),
      BlocProvider(
        create: (context) => SearchActivitiesDistanceSendBloc(
          sharedPreferencesBloc:
              BlocProvider.of<SharedPreferencesBloc>(context),
        ),
      ),
    ];
