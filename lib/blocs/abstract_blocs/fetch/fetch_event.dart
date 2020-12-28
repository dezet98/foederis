part of 'fetch_bloc.dart';

abstract class FetchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchInitialEvent extends FetchEvent {
  final FetchArgs initialFetchArgs;

  FetchInitialEvent({this.initialFetchArgs});
}

class FetchRefreshEvent extends FetchEvent {
  final FetchArgs fetchArgs;

  FetchRefreshEvent({this.fetchArgs});
}
