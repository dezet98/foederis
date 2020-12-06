import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option/form_option_bloc.dart';
import 'package:meta/meta.dart';

class CreateActvityFormDataBloc extends FormDataBloc {
  final List<FormOptionBloc> formOption;

  CreateActvityFormDataBloc({@required this.formOption});

  @override
  List<FormOptionBloc> get formsData => formOption;
}
