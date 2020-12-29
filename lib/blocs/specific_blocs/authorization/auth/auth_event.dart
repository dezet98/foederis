part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthUserChangedEvent extends AuthEvent {
  final User firebaseUser;

  AuthUserChangedEvent({@required this.firebaseUser});

  @override
  List<Object> get props => [firebaseUser];
}

class AuthSignOutEvent extends AuthEvent {}
