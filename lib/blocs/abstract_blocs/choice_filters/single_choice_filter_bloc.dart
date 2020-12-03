import 'package:meta/meta.dart';
import 'filter/filter_bloc.dart';
import 'filter_option/filter_option_bloc.dart';

class SingleChoiceFilterBloc<FilterDataType, FilterFieldType>
    extends FilterBloc<FilterDataType, FilterFieldType> {
  final List<FilterOptionBloc> options;
  final FilterFieldType Function(FilterDataType) getField;
  final String filterTitle;
  final int initialSelected;

  SingleChoiceFilterBloc({
    @required this.options,
    @required this.getField,
    @required this.initialSelected,
    this.filterTitle,
  }) {
    this.options[initialSelected].add(FilterOptionSelectEvent());
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
    if (!isSelected(selectedIndex)) {
      options[firstIndexOfSelectedOption].add(FilterOptionUncheckEvent());
      options[selectedIndex].add(FilterOptionSelectEvent());
    }
  }
}
