part of 'search_filter_bloc.dart';

abstract class SearchFilterState extends Equatable {
  const SearchFilterState();

  @override
  List<Object> get props => [];
}

class SearchFilterInProgressState extends SearchFilterState {}

class SearchFilterInitialState extends SearchFilterState {}

class SearchFilterLoadResultsState extends SearchFilterState {}

class SearchFilterLoadResultsSuccessState extends SearchFilterState {}

class SearchFilterLoadResultsFailureState extends SearchFilterState {
  final String message;

  SearchFilterLoadResultsFailureState({this.message});

  @override
  String toString() => 'GeolocationFilterLoadFailureState {error: $message}';
}

class SearchFilterLoadSuggestionState extends SearchFilterState {}

class SearchFilterLoadSuggestionSuccessState extends SearchFilterState {}

class SearchFilterLoadSuggestionFailureState extends SearchFilterState {
  final String message;

  SearchFilterLoadSuggestionFailureState({this.message});

  @override
  String toString() =>
      'SearchFilterLoadSuggestionFailureState {error: $message}';
}

class SearchFilterLoadRecentSearchesState extends SearchFilterState {}

class SearchFilterLoadRecentSearchesSuccessState extends SearchFilterState {}

class SearchFilterLoadRecentSearchesFailureState extends SearchFilterState {
  final String message;

  SearchFilterLoadRecentSearchesFailureState({this.message});

  @override
  String toString() =>
      'SearchFilterLoadRecentSearchesFailureState {error: $message}';
}

class SearchFilterSelectedOptionState<FilterDataType>
    extends SearchFilterState {
  final FilterDataType selectedElement;

  SearchFilterSelectedOptionState({@required this.selectedElement});
}
