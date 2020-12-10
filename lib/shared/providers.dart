import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/filter_option/filter_option_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/multi_choice_filter_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/sort_choice_filter_bloc.dart';
import 'package:engineering_thesis/blocs/auth/auth_bloc.dart';
import 'package:engineering_thesis/blocs/create_activity/create_activity_form_data.dart';
import 'package:engineering_thesis/blocs/nav_bar/nav_bar_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_fetching_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_filters_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/login/login_bloc.dart';
import 'package:engineering_thesis/blocs/register/register_bloc.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:engineering_thesis/repositories/auth_repository.dart';
import 'package:engineering_thesis/repositories/geolocation_repository.dart';
import 'package:engineering_thesis/shared/datebase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

dynamic getRepositoryProviders() => [
      RepositoryProvider<Database>(
        create: (_) => Database(),
      ),
      RepositoryProvider<AuthRepository>(
        create: (_) => AuthRepository(),
      ),
      RepositoryProvider<GeolocationRepository>(
        create: (_) => GeolocationRepository(),
      ),
      RepositoryProvider<ActivityRepository>(
        create: (context) => ActivityRepository(
            database: RepositoryProvider.of<Database>(context)),
      ),
    ];

dynamic getMainBlocProviders() => [
      BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
      ),
      BlocProvider(
        create: (context) => LoginBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
      ),
      BlocProvider(
        create: (context) => RegisterBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
      ),
    ];

dynamic getHomeScreenBlocProviders() => [
      BlocProvider(
        create: (context) => NavBarBloc(innitialIndex: 0),
      ),
      BlocProvider(
        create: (context) => SearchActivitiesSearchFilterBloc(
          geolocationRepository:
              RepositoryProvider.of<GeolocationRepository>(context),
        ),
      ),
      BlocProvider(
        create: (context) => SearchActivitiesFetchingBloc(
          activityRepository:
              RepositoryProvider.of<ActivityRepository>(context),
        ),
      ),
      BlocProvider(
        create: (context) => SearchActivitiesFiltersBloc(
          filters: [
            SortChoiceFilterBloc<Activity, String>(
              options: [
                FilterOptionBloc<SortWay>(
                  filterFieldValue: SortWay.asc,
                  isSelected: true,
                  getLabel: (context) =>
                      S.of(context).filters_screen_filter_value_asc,
                ),
                FilterOptionBloc<SortWay>(
                  filterFieldValue: SortWay.desc,
                  isSelected: false,
                  getLabel: (context) =>
                      S.of(context).filters_screen_filter_value_desc,
                )
              ],
              getField: (Activity activity) => activity.title,
              getTitle: (context) =>
                  S.of(context).filters_screen_filter_subtitile_sort_by,
            ),
            MultiChoiceFilterBloc<Activity, bool>(
              getField: (Activity activity) => activity.regular,
              options: [
                FilterOptionBloc<bool>(
                  filterFieldValue: true,
                  isSelected: true,
                  getLabel: (context) =>
                      S.of(context).filters_screen_filter_value_regular,
                ),
                FilterOptionBloc<bool>(
                  filterFieldValue: false,
                  isSelected: true,
                  getLabel: (context) =>
                      S.of(context).filters_screen_filter_value_one_time,
                )
              ],
              getTitle: (context) =>
                  S.of(context).filters_screen_filter_subtitile_frequency,
            )
          ],
        ),
      ),
      BlocProvider(
        create: (context) => CreateActvityFormDataBloc(
          activityRepository:
              RepositoryProvider.of<ActivityRepository>(context),
        ),
      ),
    ];
