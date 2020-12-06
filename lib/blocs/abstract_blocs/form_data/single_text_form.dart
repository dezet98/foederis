import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option/form_option_bloc.dart';
import 'package:flutter/cupertino.dart';

class SingleTextFormBloc extends FormOptionBloc<String> {
  final String initialResults;
  final Function(String) sth;

  SingleTextFormBloc({@required this.initialResults, @required this.sth})
      : super(initialResult: '');

  @override
  bool checkValid(String result) {
    return sth(result);
  }
}
