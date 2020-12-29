import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_number_field_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/validators/validators.dart';
import 'package:engineering_thesis/models/collections/query_field.dart';
import 'package:engineering_thesis/shared/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

class SearchActivityDistanceChoiceBloc extends FormDataBloc {
  SearchActivityDistanceChoiceBloc()
      : super(
          [
            FormNumberFieldBloc(
              initialResult: int.parse(SharedPreferences().distanceKm),
              queryFieldFromResult: (int result) => [
                QueryField(
                  fieldName: SharedPreferencesName.distanceKm,
                  fieldValue: result,
                )
              ],
              validators: (int result) => [
                NumberRangeValidator(result, min: 5),
              ],
              getLabel: (BuildContext context) => "Choose radius",
            )
          ],
        );
}