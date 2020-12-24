import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'search_filter_event.dart';
part 'search_filter_state.dart';

abstract class SearchFilterBloc<FilterDataType>
    extends Bloc<SearchFilterEvent, SearchFilterState> {
  final Future Function(FilterDataType selectedOption)
      dealWithNewSelectedOption;

  SearchFilterBloc({this.dealWithNewSelectedOption})
      : super(SearchFilterInitialState()) {
    add(SearchFilterLoadDataEvent());
  }

  Future<List<FilterDataType>> fetchResults(String query);
  Future<List<FilterDataType>> fetchSuggestion();
  Future<List<FilterDataType>> fetchRecentSearches();
  String display(FilterDataType element);

  List<FilterDataType> _suggestion = <FilterDataType>[];
  List<FilterDataType> _recentSearches = <FilterDataType>[];

  Future<List<FilterDataType>> results(String query) => fetchResults(query);

  List<FilterDataType> get suggestion => _suggestion;
  List<FilterDataType> get recentSearches => _recentSearches;

  FilterDataType selectedOption;

  @override
  Stream<SearchFilterState> mapEventToState(
    SearchFilterEvent event,
  ) async* {
    if (event is SearchFilterLoadDataEvent) {
      yield* mapSearchFilterLoadDataEvent();
    } else if (event is SearchFilterSelectOptionEvent) {
      yield* mapSearchFilterSelectOptionEvent(
          selectedOption: event.selectedElement);
    }
  }

  Stream<SearchFilterState> mapSearchFilterLoadDataEvent() async* {
    try {
      yield SearchFilterLoadDataInProgressState();
      _suggestion = await fetchSuggestion();
      _recentSearches = await fetchRecentSearches();
      yield SearchFilterLoadDataSuccessState();
    } catch (e) {
      yield SearchFilterLoadDataFailureState(message: e.toString());
    }
  }

  Stream<SearchFilterState> mapSearchFilterSelectOptionEvent(
      {@required selectedOption}) async* {
    try {
      yield SearchFilterSelectOptionInProgressState();
      this.selectedOption = selectedOption;
      if (dealWithNewSelectedOption != null) {
        await dealWithNewSelectedOption(selectedOption);
      }
      yield SearchFilterSelectedOptionState(selectedOption: selectedOption);
    } catch (e) {
      yield SearchFilterSelectOptionFailureState(message: e.toString());
    }
  }
}
