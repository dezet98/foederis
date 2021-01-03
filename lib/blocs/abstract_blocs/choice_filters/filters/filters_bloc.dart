import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../filter/filter_bloc.dart';

part 'filters_event.dart';
part 'filters_state.dart';

abstract class FiltersBloc<FilterDataType>
    extends Bloc<FiltersEvent, FiltersState> {
  final List<FilterBloc> filtersBlocs;

  FiltersBloc(this.filtersBlocs) : super(FiltersInitialState());

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
