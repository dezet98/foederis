import 'package:engineering_thesis/blocs/abstract_blocs/filter/filter_bloc.dart';

abstract class MultiChoiceFilterBloc<T> extends FilterBloc {
  List<T> options();
  String display(T option);

  int get optionsLenght => options().length;

  bool isSelected(int optionIndex) =>
      selectedOptions.contains(options()[optionIndex]);

  List<T> selectedOptions = [];

  void filterDataChanged(int selectedIndex) {
    if (isSelected(selectedIndex)) {
      selectedOptions.remove(options()[selectedIndex]);
    } else {
      selectedOptions.add(options()[selectedIndex]);
    }
  }
}
