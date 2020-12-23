import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_number_field_bloc.dart';
import 'package:engineering_thesis/blocs/shared_preferences/shared_preferences_bloc.dart';
import 'package:engineering_thesis/models/collections/query_field.dart';
import 'package:engineering_thesis/shared/shared_preferences.dart';
import 'package:engineering_thesis/shared/utils/validators.dart';
import 'package:flutter/cupertino.dart';

class SearchActivityDistanceChoiceBloc extends FormDataBloc {
  final SharedPreferencesBloc sharedPreferencesBloc;
  int _distance = int.parse(SharedPreferences().distanceKm);

  SearchActivityDistanceChoiceBloc({@required this.sharedPreferencesBloc})
      : super([
          FormNumberFieldBloc(
            initialResult: int.parse(SharedPreferences().distanceKm),
            queryFieldFromResult: (int result) => [
              QueryField(
                fieldName: 'distance',
                fieldValue: result,
              )
            ],
            validators: (int result) => [
              NumberRangeValidator(result, min: 5),
            ],
            getLabel: (BuildContext context) => "Choose radius",
          )
        ]);

  @override
  Future<void> query(Map<String, dynamic> queryFields) {
    _distance = queryFields['distance'];
    sharedPreferencesBloc.add(SharedPreferencesUpdateEvent(
      SharedPreferencesName.distanceKm,
      queryFields['distance'].toString(),
    ));
    return Future.wait([]);
  }

  int get distance => _distance;
}
