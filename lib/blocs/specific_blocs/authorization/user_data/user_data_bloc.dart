import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/repositories/user_repository.dart';
import 'package:engineering_thesis/shared/constants/enums.dart';
import 'package:engineering_thesis/shared/exceptions.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'user_data_event.dart';
part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final UserRepository _userRepository;
  UserDataBloc(this._userRepository) : super(UserDataInitialState());

  AppUser _user;

  AppUser get user => _user;

  @override
  Stream<UserDataState> mapEventToState(
    UserDataEvent event,
  ) async* {
    if (event is UserDataLoadEvent) {
      yield* mapUserDataLoadEvent(event.firebaseUser);
    } else if (event is UserDataClearEvent) {
      yield* mapUserDataClearEvent();
    } else if (event is UserDataCreateEvent) {
      yield* mapUserDataCreateEvent(event.firebaseUser);
    } else if (event is UserDataRefreshEvent) {
      yield* mapUserDataRefreshEvent();
    }
  }

  Stream<UserDataState> mapUserDataLoadEvent(User firebaseUser) async* {
    try {
      yield UserDataLoadInProgressState();
      _user = await _userRepository.fetchUser(firebaseUser.uid);
      yield UserDataLoadSuccessfullState();
    } catch (e) {
      if (e is FetchingException &&
          e.fetchingError == FetchingError.field_not_exist) {
        add(UserDataCreateEvent(firebaseUser: firebaseUser));
        yield UserDataClearFailureState(
          userLoadDataError: UserLoadDataError.undefined,
          message: e.toString(),
        );
      } else {
        yield UserDataClearFailureState(
          userLoadDataError: UserLoadDataError.undefined,
          message: e.toString(),
        );
      }
    }
  }

  Stream<UserDataState> mapUserDataCreateEvent(User firebaseUser) async* {
    try {
      yield UserDataCreateInProgressState();
      await _userRepository.createUser(firebaseUser);
      add(UserDataLoadEvent(firebaseUser: firebaseUser));
      yield UserDataCreateSuccessfullState();
    } catch (e) {
      yield UserDataClearFailureState(
        userLoadDataError: UserLoadDataError.undefined,
        message: e.toString(),
      );
    }
  }

  Stream<UserDataState> mapUserDataRefreshEvent() async* {
    try {
      yield UserDataRefreshInProgressState();
      _user = await _userRepository.fetchUser(user.ref.id);
      yield UserDataRefreshSuccessfullState();
    } catch (e) {
      yield UserDataRefreshFailureState(
        userLoadDataError: UserLoadDataError.undefined,
        message: e.toString(),
      );
    }
  }

  Stream<UserDataState> mapUserDataClearEvent() async* {
    try {
      yield UserDataClearInProgressState();
      _user = null;
      yield UserDataClearSuccessfullState();
    } catch (e) {
      yield UserDataClearFailureState(
        userLoadDataError: UserLoadDataError.undefined,
        message: e.toString(),
      );
    }
  }
}
