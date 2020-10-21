import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  StreamSubscription<AppUser> _userStreamSubscription;

  AuthBloc({@required this.authRepository}) : super(AuthInitial()) {
    _userStreamSubscription =
        authRepository.authStream.listen((AppUser newUser) {
      add(AuthUserChangedEvent(user: newUser));
    });
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield AuthInitial();
    if (event is AuthUserChangedEvent) {
      yield* mapAuthUserChangedEvent(event.user);
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
}
