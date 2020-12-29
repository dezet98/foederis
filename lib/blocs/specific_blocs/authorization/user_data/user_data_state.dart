part of 'user_data_bloc.dart';

abstract class UserDataState extends Equatable {
  const UserDataState();

  @override
  List<Object> get props => [];
}

class UserDataInitialState extends UserDataState {}

class UserDataLoadInProgressState extends UserDataState {}

class UserDataLoadSuccessfullState extends UserDataState {}

class UserDataLoadFailureState extends UserDataState {
  final String message;

  UserDataLoadFailureState({this.message});

  @override
  String toString() => 'UserDataLoadFailureState {error: $message}';
}

class UserDataCreateInProgressState extends UserDataState {}

class UserDataCreateSuccessfullState extends UserDataState {}

class UserDataCreateFailureState extends UserDataState {
  final String message;

  UserDataCreateFailureState({this.message});

  @override
  String toString() => 'UserDataCreateFailureState {error: $message}';
}

class UserDataClearInProgressState extends UserDataState {}

class UserDataClearSuccessfullState extends UserDataState {}

class UserDataClearFailureState extends UserDataState {
  final String message;

  UserDataClearFailureState({this.message});

  @override
  String toString() => 'UserDataClearFailureState {error: $message}';
}
