part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthUserAuthenticatedState extends AuthState {}

class AuthUserUnauthenticatedState extends AuthState {}

// TODO
// class AuthUserGuestState extends AuthState {

// }
