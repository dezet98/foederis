part of 'fetch_bloc.dart';

abstract class FetchState extends Equatable {
  const FetchState();

  @override
  List<Object> get props => [];
}

class FetchInitialState extends FetchState {}

class FetchInitialInProgressState extends FetchState {}

class FetchInitialSuccessState<T> extends FetchState {
  final T data;

  FetchInitialSuccessState({@required this.data});
}

class FetchInitialFailureState extends FetchState {
  final FetchingException fetchingException;

  FetchInitialFailureState({@required this.fetchingException});
}

class FetchRefreshInProgressState extends FetchState {}

class FetchRefreshSuccessState<DataType> extends FetchState {
  final DataType data;

  FetchRefreshSuccessState({@required this.data});
}

class FetchRefreshFailureState extends FetchState {
  final FetchingException fetchingException;

  FetchRefreshFailureState({@required this.fetchingException});
}
