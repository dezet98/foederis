import 'package:engineering_thesis/data/repositories/activity_repository.dart';
import 'package:engineering_thesis/data/repositories/appeal_to_join_repository.dart';
import 'package:engineering_thesis/data/repositories/attendee_repository.dart';
import 'package:engineering_thesis/data/repositories/category_repository.dart';
import 'package:engineering_thesis/data/repositories/transaction_and_batch_repository.dart';
import 'package:engineering_thesis/data/repositories/user_repository.dart';
import 'package:engineering_thesis/data/services/remote_auth_service.dart';
import 'package:engineering_thesis/data/services/remote_database_service.dart';
import 'package:engineering_thesis/data/services/remote_storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

dynamic getMainRepositoryProviders() => [
      RepositoryProvider<RemoteAuthService>(
        create: (_) => RemoteAuthService(),
      ),
      RepositoryProvider<RemoteDatabaseService>(
        create: (_) => RemoteDatabaseService(),
      ),
      RepositoryProvider<UserRepository>(
        create: (context) => UserRepository(
            RepositoryProvider.of<RemoteDatabaseService>(context)),
      ),
      RepositoryProvider<AttendeeRepository>(
        create: (context) => AttendeeRepository(
            RepositoryProvider.of<RemoteDatabaseService>(context)),
      ),
      RepositoryProvider<CategoryRepository>(
        create: (context) => CategoryRepository(
            database: RepositoryProvider.of<RemoteDatabaseService>(context)),
      ),
      RepositoryProvider<ActivityRepository>(
        create: (context) => ActivityRepository(
            RepositoryProvider.of<RemoteDatabaseService>(context)),
      ),
      RepositoryProvider<AppealToJoinRepository>(
        create: (context) => AppealToJoinRepository(
            RepositoryProvider.of<RemoteDatabaseService>(context)),
      ),
      RepositoryProvider<TransactionAndBatchRepository>(
        create: (context) => TransactionAndBatchRepository(
            RepositoryProvider.of<RemoteDatabaseService>(context)),
      ),
      RepositoryProvider<RemoteStorageService>(
          create: (context) => RemoteStorageService()),
    ];
