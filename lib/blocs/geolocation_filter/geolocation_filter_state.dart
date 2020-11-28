part of 'geolocation_filter_bloc.dart';

abstract class GeolocationFilterState extends Equatable {
  const GeolocationFilterState();

  @override
  List<Object> get props => [];
}

class GeolocationFilterInitialState extends GeolocationFilterState {}

class GeolocationFilterLoadResultsState extends GeolocationFilterState {}

class GeolocationFilterLoadResultsSuccessState extends GeolocationFilterState {}

class GeolocationFilterLoadResultsFailureState extends GeolocationFilterState {
  final String message;

  GeolocationFilterLoadResultsFailureState({this.message});

  @override
  String toString() => 'GeolocationFilterLoadFailureState {error: $message}';
}

class GeolocationFilterLoadSuggestionState extends GeolocationFilterState {}

class GeolocationFilterLoadSuggestionSuccessState
    extends GeolocationFilterState {}

class GeolocationFilterLoadSuggestionFailureState
    extends GeolocationFilterState {
  final String message;

  GeolocationFilterLoadSuggestionFailureState({this.message});

  @override
  String toString() =>
      'GeolocationFilterLoadSuggestionFailureState {error: $message}';
}

class GeolocationFilterLoadRecentSearchesState extends GeolocationFilterState {}

class GeolocationFilterLoadRecentSearchesSuccessState
    extends GeolocationFilterState {}

class GeolocationFilterLoadRecentSearchesFailureState
    extends GeolocationFilterState {
  final String message;

  GeolocationFilterLoadRecentSearchesFailureState({this.message});

  @override
  String toString() =>
      'GeolocationFilterLoadRecentSearchesFailureState {error: $message}';
}
