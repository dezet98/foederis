import 'package:engineering_thesis/blocs/abstract_blocs/filter/filter_bloc.dart';
import 'package:flutter/cupertino.dart';

class MultiChoiceFilterBloc<OptionType, FilterDataType>
    extends FilterBloc<FilterDataType> {
  final List<OptionType> options;
  final List<FilterDataType> Function(List<FilterDataType>, List<OptionType>)
      filter;
  final String Function(OptionType) display;
  MultiChoiceFilterBloc(
      {@required this.options, @required this.filter, @required this.display});

  int get optionsLenght => options.length;

  bool isSelected(int optionIndex) =>
      selectedOptions.contains(options[optionIndex]);

  List<FilterDataType> filterData(List<FilterDataType> data) {
    return filter(data, selectedOptions);
  }

  List<OptionType> selectedOptions = [];

  void filterDataChanged(int selectedIndex) {
    if (isSelected(selectedIndex)) {
      selectedOptions.remove(options[selectedIndex]);
    } else {
      selectedOptions.add(options[selectedIndex]);
    }
  }
}
