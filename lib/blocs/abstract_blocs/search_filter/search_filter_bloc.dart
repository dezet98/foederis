import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_filter_event.dart';
part 'search_filter_state.dart';

abstract class SearchFilterBloc<T>
    extends Bloc<SearchFilterEvent, SearchFilterState> {
  SearchFilterBloc() : super(SearchFilterInitialState()) {
    add(SearchFilterLoadEvent());
  }

  Future<List<T>> fetchResults();
  Future<List<T>> fetchSuggestion();
  Future<List<T>> fetchRecentSearches();
  List<T> filterResults(String query, List<T> results);
  String display(T element);

  List<T> _results = <T>[];
  List<T> _suggestion = <T>[];
  List<T> _recentSearches = <T>[];
  List<T> results(String query) => filterResults(query, _results);
  List<T> get suggestion => _suggestion;
  List<T> get recentSearches => _recentSearches;

  @override
  Stream<SearchFilterState> mapEventToState(
    SearchFilterEvent event,
  ) async* {
    if (event is SearchFilterLoadEvent) {
      yield* mapGeolocationFilterLoadEvent();
    }
  }

  Stream<SearchFilterState> mapGeolocationFilterLoadEvent() async* {
    try {
      _suggestion = await fetchSuggestion();
      _results = await fetchResults();
      _recentSearches = await fetchRecentSearches();
      yield SearchFilterLoadResultsSuccessState();
    } catch (e) {
      yield SearchFilterLoadSuggestionFailureState(message: e.toString());
    }
  }
}
