part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthVerificationState extends AuthState {
} // TODO it's never use in listener

class AuthUserAuthenticatedState extends AuthState {}

class AuthUserUnauthenticatedState extends AuthState {}
