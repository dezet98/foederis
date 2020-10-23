import 'package:engineering_thesis/blocs/auth/auth_bloc.dart';
import 'package:engineering_thesis/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

dynamic getRepositoryProviders() => [
      RepositoryProvider<AuthRepository>(
        create: (_) => AuthRepository(),
      )
    ];

dynamic getBlocProviders() => [
      BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
      ),
    ];