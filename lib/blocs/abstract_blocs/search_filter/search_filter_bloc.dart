import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/models/fetch_filter.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'search_filter_event.dart';
part 'search_filter_state.dart';

abstract class SearchFilterBloc<FilterDataType>
    extends Bloc<SearchFilterEvent, SearchFilterState> {
  SearchFilterBloc() : super(SearchFilterInitialState()) {
    add(SearchFilterLoadEvent());
  }

  Future<List<FilterDataType>> fetchResults();
  Future<List<FilterDataType>> fetchSuggestion();
  Future<List<FilterDataType>> fetchRecentSearches();
  List<FilterDataType> filterResults(
      String query, List<FilterDataType> results);
  String display(FilterDataType element);

  List<FilterDataType> _results = <FilterDataType>[];
  List<FilterDataType> _suggestion = <FilterDataType>[];
  List<FilterDataType> _recentSearches = <FilterDataType>[];
  List<FilterDataType> results(String query) => filterResults(query, _results);
  List<FilterDataType> get suggestion => _suggestion;
  List<FilterDataType> get recentSearches => _recentSearches;

  FilterDataType selectedOption;

  FetchFilter getFetchFilter(FilterDataType selectedOption);

  FetchFilter get fetchFilter => selectedOption == null ? null : getFetchFilter(selectedOption);

  @override
  Stream<SearchFilterState> mapEventToState(
    SearchFilterEvent event,
  ) async* {
    yield SearchFilterInProgressState();
    if (event is SearchFilterLoadEvent) {
      yield* mapGeolocationFilterLoadEvent();
    } else if (event is SearchFilterSelectOptionEvent) {
      selectedOption = event.selectedElement;
      yield SearchFilterSelectedOptionState(
          selectedElement: event.selectedElement);
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
