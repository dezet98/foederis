import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../filter_option/filter_option_bloc.dart';

part 'filter_event.dart';
part 'filter_state.dart';

abstract class FilterBloc<FilterFieldType, FilterDataType>
    extends Bloc<FilterEvent, FilterState> {
  List<FilterOptionBloc> options;
  String Function(BuildContext) getTitle;

  FilterBloc() : super(FilterInitialState());

  bool isSelected(int optionIndex) => options[optionIndex].isSelected;

  int get optionsLenght => options.length;

  int get firstIndexOfSelectedOption =>
      options.indexWhere((element) => element.isSelected);

  void filterDataChanged(FilterOptionBloc filterOptionBloc);
  List<FilterFieldType> filterData(List<FilterFieldType> data);

  @override
  Stream<FilterState> mapEventToState(
    FilterEvent event,
  ) async* {
    if (event is FilterChangeEvent) {
      filterDataChanged(event.filterOptionBloc);
      yield FilterChangedState();
    }
  }
}
