import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'filter_option_event.dart';
part 'filter_option_state.dart';

class FilterOptionBloc<FilterFieldType>
    extends Bloc<FilterOptionEvent, FilterOptionState> {
  FilterFieldType filterFieldValue;
  String label;

  FilterOptionBloc({
    @required this.filterFieldValue,
    @required this.label,
  }) : super(FilterOptionInitial()) {
    isSelected = false;
  }

  bool isSelected;

  @override
  Stream<FilterOptionState> mapEventToState(
    FilterOptionEvent event,
  ) async* {
    if (event is FilterOptionClickEvent) {
      isSelected = !isSelected;
    } else if (event is FilterOptionUncheckEvent) {
      isSelected = false;
    } else if (event is FilterOptionSelectEvent) {
      isSelected = true;
    }
  }
}
