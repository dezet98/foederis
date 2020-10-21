part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {}

class AuthUserChangedEvent extends AuthEvent {
  final AppUser user;

  AuthUserChangedEvent({@required this.user});

  @override
  List<Object> get props => [user];
}
