import 'package:meta/meta.dart';
import 'filter/filter_bloc.dart';
import 'filter_option/filter_option_bloc.dart';

enum SortWay { desc, asc }

class SortChoiceFilterBloc<FilterDataType, FilterFieldType>
    extends FilterBloc<FilterDataType, FilterFieldType> {
  final List<FilterOptionBloc<SortWay>> options;
  final String Function(FilterDataType) getField;
  final String filterTitle;
  final int initialSelected;

  SortChoiceFilterBloc({
    @required this.options,
    @required this.getField,
    @required this.initialSelected,
    this.filterTitle,
  }) {
    this.options[initialSelected].add(FilterOptionSelectEvent());
  }

  @override
  List<FilterDataType> filterData(List<FilterDataType> data) {
    SortWay filterFieldValue =
        options.firstWhere((element) => element.isSelected).filterFieldValue;

    if (filterFieldValue == SortWay.asc) {
      data.sort((a, b) => getField(a).compareTo(getField(b)));
      return data;
    } else if (filterFieldValue == SortWay.desc) {
      data.sort((a, b) => getField(b).compareTo(getField(a)));
      return data;
    }
    return data;
  }

  @override
  void filterDataChanged(int selectedIndex) {
    if (!isSelected(selectedIndex)) {
      options[firstIndexOfSelectedOption].add(FilterOptionUncheckEvent());
      options[selectedIndex].add(FilterOptionSelectEvent());
    }
  }
}
