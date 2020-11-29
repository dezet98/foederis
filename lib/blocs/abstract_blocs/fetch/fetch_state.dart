part of 'fetch_bloc.dart';

abstract class FetchState extends Equatable {
  const FetchState();

  @override
  List<Object> get props => [];
}

class FetchInitialState extends FetchState {}

class FetchInProgressState extends FetchState {}

class FetchSuccessState<T> extends FetchState {
  final T data;

  FetchSuccessState({@required this.data});
}

class FetchFailureState extends FetchState {
  final FetchingError fetchingError;
  final String message;

  FetchFailureState({@required this.fetchingError, this.message});
}
