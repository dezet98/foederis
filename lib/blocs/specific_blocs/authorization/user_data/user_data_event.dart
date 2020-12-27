part of 'user_data_bloc.dart';

abstract class UserDataEvent extends Equatable {
  const UserDataEvent();

  @override
  List<Object> get props => [];
}

class UserDataLoadEvent extends UserDataEvent {
  final User firebaseUser;

  UserDataLoadEvent({@required this.firebaseUser});
}

class UserDataClearEvent extends UserDataEvent {}
