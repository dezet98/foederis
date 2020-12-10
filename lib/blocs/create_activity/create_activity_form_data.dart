import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option/form_field_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:engineering_thesis/shared/utils/validators.dart';
import 'package:flutter/cupertino.dart';

class CreateActvityFormDataBloc extends FormDataBloc {
  final ActivityRepository activityRepository;

  CreateActvityFormDataBloc({@required this.activityRepository});

  final List<FormFieldBloc> formsData = [
    FormFieldBloc<String>(
      initialResult: 'daniel',
      queryFieldName: ActivityAttributes.title,
      validators: [LenghtValidator(min: 3, max: 130)],
      getLabel: (BuildContext context) => "Activity title",
    ),
    FormFieldBloc<bool>(
      initialResult: false,
      queryFieldName: ActivityAttributes.regular,
      getLabel: (BuildContext context) => "Regular acitvity",
    ),
    FormFieldBloc<bool>(
      initialResult: true,
      queryFieldName: ActivityAttributes.freeJoin,
      getLabel: (BuildContext context) => "Free join",
    ),
    FormFieldBloc<DateTime>(
      initialResult: DateTime.now(),
      queryFieldName: ActivityAttributes.startDate,
      validators: [
        DateTimeRangeValidator(
          minDate: DateTime.now(),
          maxDate: DateTime.now().add(Duration(days: 28)),
        )
      ],
      getLabel: (BuildContext context) => "Start date",
    ),
    FormFieldBloc<int>(
      initialResult: 5,
      queryFieldName: ActivityAttributes.minEntry,
      getLabel: (BuildContext context) => "Min entry",
      validators: [NumberRangeValidator(min: 2)],
    ),
    FormFieldBloc<int>(
      initialResult: 5,
      queryFieldName: ActivityAttributes.maxEntry,
      getLabel: (BuildContext context) => "Max entry",
      validators: [NumberRangeValidator(min: 2)],
    ),
  ];

  @override
  Future<void> query(Map<String, dynamic> queryFields) async {
    DocumentReference activityRef =
        await activityRepository.createActivity(Activity.fromMap(queryFields));
    print(activityRef);
  }
}
