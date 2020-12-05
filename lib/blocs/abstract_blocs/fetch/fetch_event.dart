part of 'fetch_bloc.dart';

abstract class FetchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchInitialEvent extends FetchEvent {
  final List<FetchFilter> initialFilters;

  FetchInitialEvent({this.initialFilters});
}

class FetchRefreshEvent extends FetchEvent {
  final List<FetchFilter> filters;

  FetchRefreshEvent({this.filters});
}
