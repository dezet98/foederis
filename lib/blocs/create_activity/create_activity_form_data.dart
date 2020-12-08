import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option/form_field_bloc.dart';
import 'package:meta/meta.dart';

class CreateActvityFormDataBloc extends FormDataBloc {
  final List<FormFieldBloc> formsData;

  CreateActvityFormDataBloc({@required this.formsData}) : super(formsData);
}
