import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/create_activity/create_activity_send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/home_screen_bottom_nav_bar_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_distance_send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_fetching_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_filters_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_search_filter_bloc.dart';
import 'package:engineering_thesis/repositories/appeal_to_join_repository.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
import 'package:engineering_thesis/repositories/transaction_and_batch_repository.dart';
import 'package:engineering_thesis/repositories/user_repository.dart';
import 'package:engineering_thesis/screens/home/bottom_nav_bar_tabs/my_activities/my_activities_tab.dart';
import 'package:engineering_thesis/screens/home/bottom_nav_bar_tabs/search_activities/search_activities_tab.dart';
import 'package:engineering_thesis/screens/home/bottom_nav_bar_tabs/settings/settings_tab.dart';
import 'package:engineering_thesis/shared/remote_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/abstract_blocs/choice_filters/filter_option/filter_option_bloc.dart';
import '../blocs/abstract_blocs/choice_filters/multi_choice_filter_bloc.dart';
import '../blocs/abstract_blocs/choice_filters/sort_choice_filter_bloc.dart';
import '../blocs/specific_blocs/authorization/auth/auth_bloc.dart';
import '../blocs/specific_blocs/authorization/login/login_bloc.dart';
import '../blocs/specific_blocs/authorization/register/register_bloc.dart';
import '../blocs/specific_blocs/common/categories_fetching_bloc.dart';
import '../blocs/specific_blocs/create_activity/create_activity_form_data.dart';
import '../blocs/specific_blocs/shared_preferences/shared_preferences_bloc.dart';
import '../generated/l10n.dart';
import '../models/activity.dart';
import '../repositories/activity_repository.dart';
import '../repositories/auth_repository.dart';
import '../repositories/category_repository.dart';
import 'database_helper.dart';
import 'remote_repository.dart';
import 'shared_preferences.dart';

dynamic getMainRepositoryProviders() => [
      RepositoryProvider<AuthRepository>(
        create: (_) => AuthRepository(),
      ),
      RepositoryProvider<RemoteRepository>(
        create: (_) => RemoteRepository(),
      ),
      RepositoryProvider<UserRepository>(
        create: (context) =>
            UserRepository(RepositoryProvider.of<RemoteRepository>(context)),
      ),
      RepositoryProvider<AttendeeRepository>(
        create: (context) => AttendeeRepository(
            RepositoryProvider.of<RemoteRepository>(context)),
      ),
      RepositoryProvider<CategoryRepository>(
        create: (context) => CategoryRepository(
            database: RepositoryProvider.of<RemoteRepository>(context)),
      ),
      RepositoryProvider<ActivityRepository>(
        create: (context) => ActivityRepository(
            RepositoryProvider.of<RemoteRepository>(context)),
      ),
      RepositoryProvider<AppealToJoinRepository>(
        create: (context) => AppealToJoinRepository(
            RepositoryProvider.of<RemoteRepository>(context)),
      ),
      RepositoryProvider<TransactionAndBatchRepository>(
        create: (context) => TransactionAndBatchRepository(
            RepositoryProvider.of<RemoteRepository>(context)),
      ),
      RepositoryProvider<RemoteStorage>(create: (context) => RemoteStorage()),
    ];

dynamic getMainBlocProviders() => [
      BlocProvider(
        create: (context) => UserDataBloc(
          RepositoryProvider.of<UserRepository>(context),
        ),
      ),
      BlocProvider(
        create: (context) => AuthBloc(
          RepositoryProvider.of<AuthRepository>(context),
          BlocProvider.of<UserDataBloc>(context),
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
        create: (context) =>
            SharedPreferencesBloc(DatabaseHelper.instance, SharedPreferences()),
      ),
      BlocProvider(
        create: (context) => HomeScreenBottomNavBarBloc(navBarTabs: [
          SearchActivitiesTab(),
          MyActivitiesTab(),
          SettingsTab(),
        ]),
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

dynamic getActivityDetailsScreenBlocProviders() => [
      BlocProvider(
        create: (context) => CategoriesFetchingBloc(
          categoryRepository:
              RepositoryProvider.of<CategoryRepository>(context),
        ),
      ),
    ];
