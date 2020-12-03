import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/filter_option/filter_option_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'filter_event.dart';
part 'filter_state.dart';

abstract class FilterBloc<FilterFieldType, FilterDataType>
    extends Bloc<FilterEvent, FilterState> {
  List<FilterOptionBloc> options;
  String get filterTitle;
  FilterBloc() : super(FilterInitialState());

  bool isSelected(int optionIndex) => options[optionIndex].isSelected;

  int get optionsLenght => options.length;

  int get firstIndexOfSelectedOption =>
      options.indexWhere((element) => element.isSelected);

  void filterDataChanged(int selectedIndex);
  List<FilterFieldType> filterData(List<FilterFieldType> data);

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
