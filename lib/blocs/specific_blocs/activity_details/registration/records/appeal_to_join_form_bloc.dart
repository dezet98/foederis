import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_text_field_bloc.dart';
import 'package:engineering_thesis/models/collections/appeal_to_join_collection.dart';
import 'package:engineering_thesis/models/collections/query_field.dart';

class AppealToJoinFormBloc extends FormDataBloc {
  AppealToJoinFormBloc()
      : super([
          FormTextFieldBloc(
            validators: (String value) => [],
            getLabel: (context) => 'Comment',
            initialResult: 'Write your comment',
            queryFieldFromResult: (String value) => [
              QueryField(
                fieldName: AppealToJoinCollection.comment.fieldName,
                fieldValue: value,
              )
            ],
          )
        ]);
}
