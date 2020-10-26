import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/repositories/auth_repository.dart';
import 'package:engineering_thesis/shared/exceptions.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<AppUser> _userStreamSubscription;

  AuthBloc({@required authRepository})
      : _authRepository = authRepository,
        super(AuthInitialState()) {
    _userStreamSubscription =
        _authRepository.authStream.listen((AppUser newUser) {
      add(AuthUserChangedEvent(user: newUser));
    });
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield AuthInProgressState(); // TODO it's never use in listener
    if (event is AuthUserChangedEvent) {
      yield* mapAuthUserChangedEvent(event.user);
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

  Stream<AuthState> mapAuthUserChangedEvent(AppUser user) async* {
    if (user == null) {
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
