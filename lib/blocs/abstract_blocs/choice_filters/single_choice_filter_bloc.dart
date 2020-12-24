import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import 'filter/filter_bloc.dart';
import 'filter_option/filter_option_bloc.dart';

class SingleChoiceFilterBloc<FilterDataType, FilterFieldType>
    extends FilterBloc<FilterDataType, FilterFieldType> {
  final List<FilterOptionBloc> options;
  final FilterFieldType Function(FilterDataType) getField;
  final String Function(BuildContext) getTitle;

  SingleChoiceFilterBloc({
    @required this.options,
    @required this.getField,
    @required this.getTitle,
  }) {
    //this.options[initialSelected].add(FilterOptionSelectEvent());
  }

  @override
  List<FilterDataType> filterData(List<FilterDataType> data) {
    List<FilterDataType> filteredData = data;

    for (FilterOptionBloc option in options) {
      if (option.isSelected) {
        filteredData = filteredData
            .where((element) => getField(element) == option.filterFieldValue)
            .toList();
      }
    }

    return filteredData;
  }

  @override
  void filterDataChanged(FilterOptionBloc filterOptionBloc) {
    if (!filterOptionBloc.isSelected) {
      options[firstIndexOfSelectedOption].add(FilterOptionUncheckEvent());
      filterOptionBloc.add(FilterOptionSelectEvent());
    }
  }
}
