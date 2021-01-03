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

class UserDataRefreshInProgressState extends UserDataState {}

class UserDataRefreshSuccessfullState extends UserDataState {}

class UserDataRefreshFailureState extends UserDataState {
  final UserLoadDataError userLoadDataError;
  final String message;

  UserDataRefreshFailureState({@required this.userLoadDataError, this.message});

  @override
  String toString() =>
      'UserDataRefreshFailureState { userLoadDataError: $userLoadDataError, message: $message }';
}

class UserDataClearInProgressState extends UserDataState {}

class UserDataClearSuccessfullState extends UserDataState {}

class UserDataClearFailureState extends UserDataState {
  final UserLoadDataError userLoadDataError;
  final String message;

  UserDataClearFailureState({@required this.userLoadDataError, this.message});

  @override
  String toString() =>
      'UserDataClearFailureState { userLoadDataError: $userLoadDataError, message: $message }';
}
