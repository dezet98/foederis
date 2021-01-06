import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/data/repositories/user_repository.dart';
import 'package:engineering_thesis/data/services/remote_auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/specific_blocs/authorization/auth/auth_bloc.dart';
import '../../blocs/specific_blocs/authorization/login/login_bloc.dart';
import '../../blocs/specific_blocs/authorization/register/register_bloc.dart';

dynamic getMainBlocProviders() => [
      BlocProvider(
        create: (context) => UserDataBloc(
          RepositoryProvider.of<UserRepository>(context),
        ),
      ),
      BlocProvider(
        create: (context) => AuthBloc(
          RepositoryProvider.of<RemoteAuthService>(context),
          BlocProvider.of<UserDataBloc>(context),
        ),
      ),
      BlocProvider(
        create: (context) => LoginBloc(
          authRepository: RepositoryProvider.of<RemoteAuthService>(context),
        ),
      ),
      BlocProvider(
        create: (context) => RegisterBloc(
          authRepository: RepositoryProvider.of<RemoteAuthService>(context),
        ),
      ),
    ];
