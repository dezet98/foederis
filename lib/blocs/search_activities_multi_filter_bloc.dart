import 'abstract_blocs/multi_choice_filter/multi_choice_filter_bloc.dart';

class SearchActivitiesMultiFilterBloc extends MultiChoiceFilterBloc<String> {
  @override
  List<String> options() {
    return ['regular', 'disposable'];
  }

  @override
  String display(String option) {
    return option;
  }
}
