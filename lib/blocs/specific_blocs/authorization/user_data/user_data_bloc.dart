import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/repositories/user_repository.dart';
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
    }
  }

  Stream<UserDataState> mapUserDataLoadEvent(User firebaseUser) async* {
    try {
      yield UserDataLoadInProgressState();
      _user = await _userRepository.fetchUser(firebaseUser.uid);
      yield UserDataLoadSuccessfullState();
    } catch (e) {
      yield UserDataLoadFailureState(message: e.toString());
    }
  }
}
