part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitialState extends AuthState {
  @override
  String toString() => 'Auth User Authenticated State';
}

class AuthVerificationState extends AuthState {
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
