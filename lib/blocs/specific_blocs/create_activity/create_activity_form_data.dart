import 'package:engineering_thesis/blocs/specific_blocs/validators/validators.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/category.dart';
import '../../../models/collections/activity_collection.dart';
import '../../../models/collections/query_field.dart';
import '../../../models/geolocation.dart';
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
            initialResult: 'daniel',
            queryFieldFromResult: (String result) => [
              QueryField(
                fieldName: ActivityCollection.title.fieldName,
                fieldValue: result,
              )
            ],
            validators: (String result) =>
                [LenghtValidator(result, min: 3, max: 130)],
            getLabel: (BuildContext context) => "Activity title",
          ),
          FormCheckFieldBloc(
            initialResult: false,
            queryFieldFromResult: (bool result) => [
              QueryField(
                fieldName: ActivityCollection.regular.fieldName,
                fieldValue: result,
              )
            ],
            getLabel: (BuildContext context) => "Regular acitvity",
            validators: (_) => [],
          ),
          FormCheckFieldBloc(
            initialResult: true,
            queryFieldFromResult: (bool result) => [
              QueryField(
                fieldName: ActivityCollection.freeJoin.fieldName,
                fieldValue: result,
              )
            ],
            getLabel: (BuildContext context) => "Free join",
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
                maxDate: DateTime.now().add(Duration(
                    days:
                        28)), //todo take from firebase, should not be static and unchangeable
              )
            ],
            getLabel: (BuildContext context) => "Start date",
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
            getLabel: (BuildContext context) => "Min and max entry",
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
            getLabelFromOption: (dynamic category) => category.title,
            queryFieldFromResult: (Category result) => [
              QueryField(
                fieldName: ActivityCollection.categoryRef.fieldName,
                fieldValue: result.ref,
              )
            ],
            listOptionFetchingBloc: categoryFetchingBloc,
            getLabel: (BuildContext context) => "Category",
            validators: (value) => [NotNullValidator(value)],
          ),
          FormAddressFieldBloc(
            initialResult: null,
            validators: (value) => [NotNullValidator(value)],
            getLabel: (BuildContext context) => "Address",
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
