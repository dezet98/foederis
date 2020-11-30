import 'abstract_blocs/single_choice_filter/single_choice_filter_bloc.dart';

class SearchActivitiesRegularFilter extends SingleChoiceFilterBloc<String> {
  @override
  List<String> options() {
    return ['regular', 'disposable'];
  }

  @override
  String display(String option) {
    return option;
  }
}
