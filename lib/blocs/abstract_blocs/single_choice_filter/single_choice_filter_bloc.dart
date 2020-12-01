import 'package:engineering_thesis/blocs/abstract_blocs/filter/filter_bloc.dart';
import 'package:meta/meta.dart';

class SingleChoiceFilterBloc<OptionType, FilterDataType>
    extends FilterBloc<FilterDataType> {
  final List<OptionType> options;
  final List<FilterDataType> Function(List<FilterDataType>, OptionType) filter;
  final String Function(OptionType) display;
  SingleChoiceFilterBloc(
      {@required this.options, @required this.filter, @required this.display});

  int get optionsLenght => options.length;

  bool isSelected(int optionIndex) => selectedOption == options[optionIndex];

  List<FilterDataType> filterData(List<FilterDataType> data) {
    return filter(data, selectedOption);
  }

  OptionType selectedOption;

  void filterDataChanged(int selectedIndex) {
    selectedOption = options[selectedIndex];
  }
}
