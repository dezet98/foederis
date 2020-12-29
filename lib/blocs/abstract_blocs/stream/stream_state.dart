part of 'stream_bloc.dart';

abstract class StreamState extends Equatable {
  const StreamState();

  @override
  List<Object> get props => [];
}

class StreamInitialState extends StreamState {}

class StreamSubscribeFailed extends StreamState {
  final StreamError streamError;
  final String message;

  StreamSubscribeFailed({@required this.streamError, this.message});
}

class StreamRefreshInProgressState extends StreamState {}

class StreamRefreshSuccessState<T> extends StreamState {
  final T data;

  StreamRefreshSuccessState({@required this.data});
}

class StreamRefreshFailureState extends StreamState {
  final StreamError streamError;
  final String message;

  StreamRefreshFailureState({@required this.streamError, this.message});
}
