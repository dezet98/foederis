import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_check_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_date_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_number_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option_list_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_text_field_bloc.dart';
import 'package:engineering_thesis/blocs/create_activity/category_fetching_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/category.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:engineering_thesis/repositories/category_repository.dart';
import 'package:engineering_thesis/shared/utils/validators.dart';
import 'package:flutter/cupertino.dart';

class CreateActvityFormDataBloc extends FormDataBloc {
  final ActivityRepository activityRepository;
  final CategoryRepository categoryRepository;
  final CategoryFetchingBloc categoryFetchingBloc;

  CreateActvityFormDataBloc({
    @required this.activityRepository,
    @required this.categoryRepository,
    @required this.categoryFetchingBloc,
  }) : super([
          FormTextFieldBloc(
            initialResult: 'daniel',
            queryFieldName: ActivityAttributes.title,
            validators: (_) => [LenghtValidator(min: 3, max: 130)],
            getLabel: (BuildContext context) => "Activity title",
          ),
          FormCheckFieldBloc(
            initialResult: false,
            queryFieldName: ActivityAttributes.regular,
            getLabel: (BuildContext context) => "Regular acitvity",
            validators: (_) => [],
          ),
          FormCheckFieldBloc(
            initialResult: true,
            queryFieldName: ActivityAttributes.freeJoin,
            getLabel: (BuildContext context) => "Free join",
            validators: (_) => [],
          ),
          FormDateFieldBloc(
            initialResult: DateTime.now(),
            queryFieldName: ActivityAttributes.startDate,
            validators: (_) => [
              DateTimeRangeValidator(
                minDate: DateTime.now(),
                maxDate: DateTime.now().add(Duration(days: 28)),
              )
            ],
            getLabel: (BuildContext context) => "Start date",
          ),
          FormNumberFieldBloc(
            initialResult: 5,
            queryFieldName: ActivityAttributes.minEntry,
            getLabel: (BuildContext context) => "Min entry",
            validators: (_) => [NumberRangeValidator(min: 2)],
          ),
          FormNumberFieldBloc(
            initialResult: 5,
            queryFieldName: ActivityAttributes.maxEntry,
            getLabel: (BuildContext context) => "Max entry",
            validators: (_) => [NumberRangeValidator(min: 2)],
          ),
          FormOptionListFieldBloc<Category, DocumentReference>(
            getLabelFromOption: (dynamic category) => category.title,
            getResultFromOption: (dynamic category) => category.ref,
            listOptionFetchingBloc: categoryFetchingBloc,
            getLabel: (BuildContext context) => "Category",
            validators: (value) => [NotNullValidator(value: value)],
            queryFieldName: ActivityAttributes.categoryRef,
          )
        ]);

  @override
  Future<void> query(Map<String, dynamic> queryFields) async {
    DocumentReference activityRef =
        await activityRepository.createActivity(Activity.fromMap(queryFields));
    print(activityRef);
  }
}
