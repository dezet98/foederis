import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'filter_event.dart';
part 'filter_state.dart';

abstract class FilterBloc<FilterDataType>
    extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitialState());

  void filterDataChanged(int selectedIndex);

  List<FilterDataType> filterData(List<FilterDataType> data);

  @override
  Stream<FilterState> mapEventToState(
    FilterEvent event,
  ) async* {
    if (event is FilterChangeEvent) {
      filterDataChanged(event.selectedIndex);
      yield FilterChangedState();
    }
  }
}
