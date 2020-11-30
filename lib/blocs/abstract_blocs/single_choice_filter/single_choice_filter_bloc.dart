import 'package:engineering_thesis/blocs/abstract_blocs/filter/filter_bloc.dart';

abstract class SingleChoiceFilterBloc<T> extends FilterBloc {
  List<T> options();
  String display(T option);

  int get optionsLenght => options().length;

  bool isSelected(int optionIndex) => selectedOption == options()[optionIndex];

  T selectedOption;

  void filterDataChanged(int selectedIndex) {
    selectedOption = options()[selectedIndex];
  }
}
