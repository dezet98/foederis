import 'dart:io';

import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_date_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_option_list_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_photo_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_text_field_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/validators/validators.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/models/collections/query_field.dart';
import 'package:engineering_thesis/models/collections/user_collection.dart';
import 'package:engineering_thesis/shared/utils/enums.dart';
import 'package:flutter/cupertino.dart';

class UpdateUserDataFormBloc extends FormDataBloc {
  final AppUser appUser;

  UpdateUserDataFormBloc({@required this.appUser})
      : super([
          FormPhotoFieldBloc(
            initialResult: null,
            initialPhotoUrl: appUser.photoUrl,
            queryFieldFromResult: (File result) => [
              QueryField(
                fieldName: UserCollection.photoUrl.fieldName,
                fieldValue: result,
              )
            ],
            validators: (File result) => [],
            getLabel: (BuildContext context) =>
                S.of(context).update_user_form_photo_label,
          ),
          FormTextFieldBloc(
            initialResult: appUser.firstName ?? '',
            queryFieldFromResult: (String result) => [
              QueryField(
                fieldName: UserCollection.firstName.fieldName,
                fieldValue: result,
              )
            ],
            validators: (String result) => [],
            getLabel: (BuildContext context) =>
                S.of(context).update_user_form_first_name_label,
          ),
          FormTextFieldBloc(
            initialResult: appUser.secondName ?? '',
            queryFieldFromResult: (String result) => [
              QueryField(
                fieldName: UserCollection.secondName.fieldName,
                fieldValue: result,
              )
            ],
            validators: (String result) => [],
            getLabel: (BuildContext context) =>
                S.of(context).update_user_form_second_name_label,
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
                [LenghtValidator(result, min: 5, max: 130, zeroIsValid: true)],
            getLabel: (BuildContext context) =>
                S.of(context).update_user_form_about_label,
          ),
          FormTextFieldBloc(
            initialResult: appUser.phone ?? '',
            queryFieldFromResult: (String result) => [
              QueryField(
                fieldName: UserCollection.phone.fieldName,
                fieldValue: result,
              )
            ],
            validators: (String result) =>
                [PhoneValidator(result, zeroIsValid: true)],
            getLabel: (BuildContext context) =>
                S.of(context).update_user_form_phone_label,
          ),
          FormDateFieldBloc(
            initialResult: appUser.birthday ?? DateTime(2000),
            withHour: false,
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
            getLabel: (BuildContext context) =>
                S.of(context).update_user_form_birthday_label,
          ),
          FormOptionListFieldBloc<Gender>(
            listOptionFetchingBloc: null,
            listOption: Gender.values,
            initialResult: appUser.gender,
            getLabelFromOption: (context, dynamic gender) =>
                AppUser.genderAsString(context, gender),
            queryFieldFromResult: (Gender result) => [
              QueryField(
                fieldName: UserCollection.gender.fieldName,
                fieldValue: enumToString(result),
              )
            ],
            getLabel: (BuildContext context) =>
                S.of(context).update_user_form_gender_label,
            validators: (value) => [NotNullValidator(value)],
          ),
        ]);
}
