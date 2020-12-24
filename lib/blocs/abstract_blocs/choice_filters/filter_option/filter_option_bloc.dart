import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'filter_option_event.dart';
part 'filter_option_state.dart';

class FilterOptionBloc<FilterFieldType>
    extends Bloc<FilterOptionEvent, FilterOptionState> {
  FilterFieldType filterFieldValue;
  bool isSelected;
  String Function(BuildContext) getLabel;

  FilterOptionBloc({
    @required this.filterFieldValue,
    this.getLabel,
    @required this.isSelected,
  }) : super(FilterOptionInitial());

  @override
  Stream<FilterOptionState> mapEventToState(
    FilterOptionEvent event,
  ) async* {
    if (event is FilterOptionUncheckEvent) {
      isSelected = false;
      yield FilterOptionUncheckState();
    } else if (event is FilterOptionSelectEvent) {
      isSelected = true;
      yield FilterOptionSelectedState();
    }
  }
}
