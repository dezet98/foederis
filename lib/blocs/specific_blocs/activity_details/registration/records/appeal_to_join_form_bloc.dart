import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_text_field_bloc.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/models/collections/appeal_to_join_collection.dart';
import 'package:engineering_thesis/models/utils/query_field.dart';

class AppealToJoinFormBloc extends FormDataBloc {
  AppealToJoinFormBloc()
      : super([
          FormTextFieldBloc(
            validators: (String value) => [],
            getLabel: (context) => S.of(context).appeal_join_form_comment_label,
            placeholder: (context) =>
                S.of(context).appeal_join_form_comment_placeholder,
            queryFieldFromResult: (String value) => [
              QueryField(
                fieldName: AppealToJoinCollection.comment.fieldName,
                fieldValue: value,
              )
            ],
          )
        ]);
}
