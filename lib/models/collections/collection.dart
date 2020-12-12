import 'package:engineering_thesis/constants/enums.dart';
import 'package:engineering_thesis/models/collections/query_field.dart';
import 'package:engineering_thesis/shared/exceptions.dart';

abstract class Collection {
  static Map<String, dynamic> fillRemainsData(
      Map<String, dynamic> data, List<QueryField> allFields) {
    Map<String, dynamic> emptyData = Map();

    for (QueryField queryField in allFields) {
      if (queryField.isRequired && !data.containsKey(queryField.fieldName)) {
        throw UploadDataException(
          sendingDataError: UploadDataError.required_field_not_provider,
          message: '{ requiredField: ${queryField.fieldName} })',
        );
      } else if (!data.containsKey(queryField.fieldName)) {
        emptyData[queryField.fieldName] = null;
      }
    }

    data.addAll(emptyData);
    return data;
  }
}
