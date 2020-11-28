part of 'search_activities_bloc.dart';

abstract class SearchActivitiesState extends Equatable {
  const SearchActivitiesState();

  @override
  List<Object> get props => [];
}

class SearchActivitiesInitialState extends SearchActivitiesState {}

class SearchActivitiesFetchingState extends SearchActivitiesState {}

class SearchActivitiesFetchSuccessState extends SearchActivitiesState {
  final List<Activity> activites;

  SearchActivitiesFetchSuccessState({@required this.activites});
}

class SearchActivitiesFetchFailureState extends SearchActivitiesState {
  final QueryException fetchException;
  final String message;

  SearchActivitiesFetchFailureState({this.fetchException, this.message});
}
