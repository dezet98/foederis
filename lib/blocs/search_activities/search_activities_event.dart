part of 'search_activities_bloc.dart';

abstract class SearchActivitiesEvent extends Equatable {
  const SearchActivitiesEvent();

  @override
  List<Object> get props => [];
}

class SearchActivitiesFetchEvent extends SearchActivitiesEvent {
  final List<Filter> filters;

  SearchActivitiesFetchEvent({this.filters});
}
