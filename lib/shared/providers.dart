import 'package:engineering_thesis/blocs/auth/auth_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/login/login_bloc.dart';
import 'package:engineering_thesis/blocs/register/register_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activity_filters_bloc.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:engineering_thesis/repositories/auth_repository.dart';
import 'package:engineering_thesis/repositories/geolocation_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

dynamic getRepositoryProviders() => [
      RepositoryProvider<AuthRepository>(
        create: (_) => AuthRepository(),
      ),
      RepositoryProvider<GeolocationRepository>(
        create: (_) => GeolocationRepository(),
      ),
      RepositoryProvider<ActivityRepository>(
        create: (_) => ActivityRepository(),
      ),
    ];

dynamic getBlocProviders() => [
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
      BlocProvider(
        create: (context) => SearchActivitiesSearchFilterBloc(
          geolocationRepository:
              RepositoryProvider.of<GeolocationRepository>(context),
        ),
      ),
      BlocProvider(
        create: (context) => SearchActivitiesFiltersBloc(),
      ),
    ];
