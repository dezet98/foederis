part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitialEvent extends AuthEvent {}

class AuthUserChangedEvent extends AuthEvent {
  final AppUser user;

  AuthUserChangedEvent({@required this.user}); // TODO check required here

  @override
  List<Object> get props => [user];
}
