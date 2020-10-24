part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthInProgressState extends AuthState {
} // TODO it's never use in listener

class AuthUserAuthenticatedState extends AuthState {}

class AuthUserUnauthenticatedState extends AuthState {}

class AuthSigningOutState extends AuthState {}

class AuthSignOutSuccessState extends AuthState {}

class AuthSignOutFailureState extends AuthState {
  final String message;

  AuthSignOutFailureState({this.message});

  @override
  String toString() => 'AuthSignOutFailureState {error: $message}';
}
