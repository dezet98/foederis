part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  @override
  String toString() => 'Auth User Authenticated State';
}

class AuthInitialState extends AuthState {
  @override
  String toString() => 'Auth User Authenticated State';
}

class AuthInProgressState extends AuthState {
  @override
  String toString() => 'Auth Verification State';
} // TODO it's never use in listener

class AuthUserAuthenticatedState extends AuthState {
  @override
  String toString() => 'Auth User Authenticated State';
}

class AuthUserUnauthenticatedState extends AuthState {
  @override
  String toString() => 'Auth User Unauthenticated State';
}

class AuthSigningOutState extends AuthState {}

class AuthSignOutSuccessState extends AuthState {}

class AuthSignOutFailureState extends AuthState {}
