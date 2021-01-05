import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../../repositories/remote_auth_service.dart';
import '../../../../shared/exceptions/exceptions.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RemoteAuthService _authRepository;
  final UserDataBloc _userDataBloc;

  StreamSubscription<User> _userStreamSubscription;
  User _firebaseUser;

  AuthBloc(this._authRepository, this._userDataBloc)
      : super(AuthInitialState()) {
    _userStreamSubscription =
        _authRepository.authStream.listen((User firebaseUser) {
      add(AuthUserChangedEvent(firebaseUser: firebaseUser));
    });
  }

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
      _firebaseUser = firebaseUser;
      yield AuthUserAuthenticatedState();
      _userDataBloc.add(UserDataLoadEvent(firebaseUser: _firebaseUser));
    }
  }

  Stream<AuthState> mapAuthSignOutEvent() async* {
    try {
      _userDataBloc.add(UserDataClearEvent());
      await _authRepository.signOut();
      yield AuthSignOutSuccessState();
    } on SignOutException catch (e) {
      yield AuthSignOutFailureState(message: e.error);
    }
  }
}
