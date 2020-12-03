import 'package:flutter/cupertino.dart';
import 'filter/filter_bloc.dart';
import 'filter_option/filter_option_bloc.dart';

class MultiChoiceFilterBloc<FilterDataType, FilterFieldType>
    extends FilterBloc<FilterDataType, FilterFieldType> {
  final List<FilterOptionBloc> options;
  final FilterFieldType Function(FilterDataType) getField;
  final String filterTitle;
  final List<int> initialSelected;

  MultiChoiceFilterBloc({
    @required this.options,
    @required this.getField,
    @required this.initialSelected,
    this.filterTitle = '',
  }) {
    for (int i in initialSelected) options[i].add(FilterOptionSelectEvent());
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
  void filterDataChanged(int selectedIndex) {
    options[selectedIndex].add(FilterOptionClickEvent());
  }
}
