import 'package:flutter/cupertino.dart';

import 'filter/filter_bloc.dart';
import 'filter_option/filter_option_bloc.dart';

class MultiChoiceFilterBloc<FilterDataType, FilterFieldType>
    extends FilterBloc<FilterDataType, FilterFieldType> {
  final List<FilterOptionBloc> options;
  final FilterFieldType Function(FilterDataType) getField;
  final String Function(BuildContext) getTitle;

  MultiChoiceFilterBloc(
      {@required this.options,
      @required this.getField,
      @required this.getTitle}) {
    //for (int i in initialSelected) options[i].add(FilterOptionSelectEvent());
  }

  @override
  List<FilterDataType> filterData(List<FilterDataType> data) {
    List<FilterDataType> filteredData = [];

    for (FilterOptionBloc option in options) {
      if (option.isSelected) {
        filteredData += data
            .where((element) => getField(element) == option.filterFieldValue)
            .toList();
      }
    }

    return filteredData.toSet().toList();
  }

  @override
  void filterDataChanged(FilterOptionBloc filterOptionBloc) {
    filterOptionBloc.add(
      filterOptionBloc.isSelected
          ? FilterOptionUncheckEvent()
          : FilterOptionSelectEvent(),
    );
  }
}
