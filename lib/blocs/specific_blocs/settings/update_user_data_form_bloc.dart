import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_date_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_option_list_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_text_field_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/validators/validators.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/models/collections/query_field.dart';
import 'package:engineering_thesis/models/collections/user_collection.dart';
import 'package:engineering_thesis/shared/utils/enums.dart';
import 'package:flutter/cupertino.dart';

class UpdateUserDataFormBloc extends FormDataBloc {
  final AppUser appUser;

  UpdateUserDataFormBloc({@required this.appUser})
      : super([
          FormTextFieldBloc(
            initialResult: appUser.firstName ?? '',
            queryFieldFromResult: (String result) => [
              QueryField(
                fieldName: UserCollection.firstName.fieldName,
                fieldValue: result,
              )
            ],
            validators: (String result) =>
                [LenghtValidator(result, min: 3, max: 130)],
            getLabel: (BuildContext context) => "First name",
          ),
          FormTextFieldBloc(
            initialResult: appUser.secondName ?? '',
            queryFieldFromResult: (String result) => [
              QueryField(
                fieldName: UserCollection.secondName.fieldName,
                fieldValue: result,
              )
            ],
            validators: (String result) =>
                [LenghtValidator(result, min: 3, max: 130)],
            getLabel: (BuildContext context) => "Second name",
          ),
          FormTextFieldBloc(
            initialResult: appUser.about ?? '',
            queryFieldFromResult: (String result) => [
              QueryField(
                fieldName: UserCollection.about.fieldName,
                fieldValue: result,
              )
            ],
            validators: (String result) =>
                [LenghtValidator(result, min: 3, max: 130)],
            getLabel: (BuildContext context) => "About",
          ),
          FormDateFieldBloc(
            initialResult: appUser.birthday ?? DateTime(2000),
            queryFieldFromResult: (DateTime result) => [
              QueryField(
                fieldName: UserCollection.birthday.fieldName,
                fieldValue: result,
              )
            ],
            validators: (DateTime result) => [
              DateTimeRangeValidator(
                result,
                minDate: DateTime(1900),
                maxDate: DateTime.now(),
              )
            ],
            getLabel: (BuildContext context) => "Birtday",
          ),
          FormOptionListFieldBloc<Gender>(
            listOptionFetchingBloc: null,
            listOption: Gender.values,
            getLabelFromOption: (dynamic gender) => enumToString(gender),
            queryFieldFromResult: (Gender result) => [
              QueryField(
                fieldName: UserCollection.gender.fieldName,
                fieldValue: enumToString(result),
              )
            ],
            //listOptionFetchingBloc: categoryFetchingBloc,
            getLabel: (BuildContext context) => "Gender",
            validators: (value) => [NotNullValidator(value)],
          ),
        ]);
}
