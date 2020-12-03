import 'package:meta/meta.dart';
import 'filter/filter_bloc.dart';
import 'filter_option/filter_option_bloc.dart';

enum SortWay { desc, asc }

class SortChoiceFilterBloc<FilterDataType, FilterFieldType>
    extends FilterBloc<FilterDataType> {
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

  int get optionsLenght => options.length;

  bool isSelected(int optionIndex) => options[optionIndex].isSelected;

  FilterOptionBloc selectedOption() {
    for (FilterOptionBloc option in options) {
      if (option.isSelected) return option;
    }
  }

  int selectedOptionIndex() {
    for (int i = 0; i < options.length; i++) {
      if (options[i].isSelected) return i;
    }
  }

  List<FilterDataType> filterData(List<FilterDataType> data) {
    FilterOptionBloc option = selectedOption();

    if (option.filterFieldValue == SortWay.asc) {
      data.sort((a, b) => getField(a).compareTo(getField(b)));
      return data;
    } else if (option.filterFieldValue == SortWay.desc) {
      data.sort((a, b) => getField(b).compareTo(getField(a)));
      return data;
    }
    return data;
  }

  @override
  void filterDataChanged(int selectedIndex) {
    if (!isSelected(selectedIndex)) {
      options[selectedOptionIndex()].add(FilterOptionUncheckEvent());
      options[selectedIndex].add(FilterOptionSelectEvent());
    }
  }
}
