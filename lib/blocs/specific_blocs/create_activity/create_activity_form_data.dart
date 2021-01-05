import 'package:engineering_thesis/blocs/specific_blocs/validators/validators.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/category.dart';
import '../../../models/collections/activity_collection.dart';
import '../../../models/utils/geolocation.dart';
import '../../../models/utils/query_field.dart';
import '../../../repositories/activity_repository.dart';
import '../../../repositories/category_repository.dart';
import '../../abstract_blocs/forms/form_address_field_bloc.dart';
import '../../abstract_blocs/forms/form_check_field_bloc.dart';
import '../../abstract_blocs/forms/form_data/form_data_bloc.dart';
import '../../abstract_blocs/forms/form_date_field_bloc.dart';
import '../../abstract_blocs/forms/form_number_range_field_bloc.dart';
import '../../abstract_blocs/forms/form_option_list_field_bloc.dart';
import '../../abstract_blocs/forms/form_text_field_bloc.dart';
import '../common/categories_fetching_bloc.dart';

class CreateActvityFormDataBloc extends FormDataBloc {
  final ActivityRepository activityRepository;
  final CategoryRepository categoryRepository;
  final CategoriesFetchingBloc categoryFetchingBloc;

  CreateActvityFormDataBloc({
    @required this.activityRepository,
    @required this.categoryRepository,
    @required this.categoryFetchingBloc,
  }) : super([
          FormTextFieldBloc(
            placeholder: (context) =>
                S.of(context).create_activity_screen_title_placeholder,
            queryFieldFromResult: (String result) => [
              QueryField(
                fieldName: ActivityCollection.title.fieldName,
                fieldValue: result,
              )
            ],
            validators: (String result) =>
                [LenghtValidator(result, min: 3, max: 130)],
            getLabel: (BuildContext context) =>
                S.of(context).create_activity_screen_title_label,
          ),
          FormTextFieldBloc(
            placeholder: (context) =>
                S.of(context).create_activity_screen_description_placeholder,
            queryFieldFromResult: (String result) => [
              QueryField(
                fieldName: ActivityCollection.description.fieldName,
                fieldValue: result,
              )
            ],
            getLabel: (BuildContext context) =>
                S.of(context).create_activity_screen_description_label,
            validators: (result) => [LenghtValidator(result, min: 5, max: 200)],
          ),
          FormCheckFieldBloc(
            initialResult: true,
            queryFieldFromResult: (bool result) => [
              QueryField(
                fieldName: ActivityCollection.freeJoin.fieldName,
                fieldValue: result,
              )
            ],
            getLabel: (BuildContext context) =>
                S.of(context).create_activity_screen_free_join_label,
            getDescription: (BuildContext context) =>
                S.of(context).create_activity_screen_free_join_description,
            validators: (_) => [],
          ),
          FormDateFieldBloc(
            initialResult: DateTime.now(),
            queryFieldFromResult: (DateTime result) => [
              QueryField(
                fieldName: ActivityCollection.startDate.fieldName,
                fieldValue: result,
              )
            ],
            validators: (DateTime result) => [
              DateTimeRangeValidator(
                result,
                minDate: DateTime.now(),
                maxDate: DateTime.now().add(
                  Duration(days: 28),
                ),
              )
            ],
            getLabel: (BuildContext context) =>
                S.of(context).create_activity_screen_start_date_label,
          ),
          FormNumberRangeFieldBloc(
            initialResult: [5, 5],
            validators: (List<int> result) => [
              NumberRangeValidator(result[0], min: 2),
              NumbersValidator(
                result[0],
                result[1],
                NumberCompareType.isLessThanOrEqualTo,
              )
            ],
            getLabel: (BuildContext context) =>
                S.of(context).create_activity_screen_min_max_entry_label,
            getDescription: (BuildContext context) =>
                S.of(context).create_activity_screen_min_max_entry_description,
            queryFieldFromResult: (List<int> result) => [
              QueryField(
                fieldName: ActivityCollection.minEntry.fieldName,
                fieldValue: result[0],
              ),
              QueryField(
                fieldName: ActivityCollection.maxEntry.fieldName,
                fieldValue: result[1],
              )
            ],
          ),
          FormOptionListFieldBloc<Category>(
            getLabelFromOption: (BuildContext context, dynamic category) =>
                category.titleAsString(context),
            queryFieldFromResult: (Category result) => [
              QueryField(
                fieldName: ActivityCollection.categoryRef.fieldName,
                fieldValue: result.ref,
              )
            ],
            listOptionFetchingBloc: categoryFetchingBloc,
            listOption: null,
            getLabel: (BuildContext context) =>
                S.of(context).create_activity_screen_category_label,
            validators: (value) => [NotNullValidator(value)],
          ),
          FormAddressFieldBloc(
            initialResult: null,
            validators: (value) => [NotNullValidator(value)],
            getLabel: (BuildContext context) =>
                S.of(context).create_activity_screen_address_label,
            getDescription: (BuildContext context) =>
                S.of(context).create_activity_screen_address_description,
            queryFieldFromResult: (Geolocation result) => [
              QueryField(
                fieldName: ActivityCollection.geohash.fieldName,
                fieldValue: result.geohash,
              ),
              QueryField(
                fieldName: ActivityCollection.address.fieldName,
                fieldValue: result.address,
              )
            ],
          )
        ]);
}
