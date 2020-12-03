import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/filter/filter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc<FilterDataType> extends Bloc<FiltersEvent, FiltersState> {
  List<FilterBloc> filtersBlocs;

  FiltersBloc({@required this.filtersBlocs}) : super(FiltersInitialState());

  List<FilterDataType> filter(List<FilterDataType> data) {
    List<FilterDataType> filteredData = data;

    for (FilterBloc bloc in filtersBlocs) {
      filteredData = bloc.filterData(filteredData);
    }

    return filteredData;
  }

  @override
  Stream<FiltersState> mapEventToState(
    FiltersEvent event,
  ) async* {
    if (event is FiltersChangedEvent) {
      yield FiltersApplyingState();
      yield FiltersAppliedSuccessState();
    }
  }
}
