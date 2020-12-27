import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../../repositories/auth_repository.dart';
import '../../../../shared/exceptions.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AppUser _user;
  StreamSubscription<User> _userStreamSubscription;

  AuthBloc(this._authRepository)
      : super(AuthInitialState()) {
    _userStreamSubscription =
        _authRepository.authStream.listen((User firebaseUser) {
      add(AuthUserChangedEvent(firebaseUser: firebaseUser));
    });
  }

  AppUser get user => _user;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield AuthInProgressState();
    if (event is AuthUserChangedEvent) {
      yield* mapAuthUserChangedEvent(event.firebaseUser);
    } else if (event is AuthSignOutEvent) {
      yield AuthSigningOutState();
      yield* mapAuthSignOutEvent();
    }
  }

  @override
  Future<void> close() {
    _userStreamSubscription?.cancel();
    return super.close();
  }

  Stream<AuthState> mapAuthUserChangedEvent(User firebaseUser) async* {
    if (firebaseUser == null) {
      yield AuthUserUnauthenticatedState();
    } else {
      yield AuthUserAuthenticatedState();
    }
  }

  Stream<AuthState> mapAuthSignOutEvent() async* {
    try {
      await _authRepository.signOut();
      yield AuthSignOutSuccessState();
    } on SignOutException catch (e) {
      yield AuthSignOutFailureState(message: e.error);
    }
  }
}
