import 'package:engineering_thesis/shared/constants/enums.dart';

import '../../shared/exceptions.dart';
import 'query_field.dart';

abstract class Collection {
  static Map<String, dynamic> fillRemainsData(
      Map<String, dynamic> data, List<CollectionField> allFields) {
    Map<String, dynamic> emptyData = Map();

    for (CollectionField queryField in allFields) {
      if (queryField.isRequired && !data.containsKey(queryField.fieldName)) {
        throw SendingDataException(
          sendingDataError: UploadDataError.required_field_not_provider,
          message: '{ requiredField: ${queryField.fieldName} })',
        );
      } else if (queryField.isRequired &&
          data.containsKey(queryField.fieldName) &&
          data[queryField.fieldName] == null) {
        throw SendingDataException(
          sendingDataError: UploadDataError.required_field_not_provider,
          message: '{ requiredField is null: ${queryField.fieldName} })',
        );
      } else if (!data.containsKey(queryField.fieldName)) {
        emptyData[queryField.fieldName] =
            queryField.defaultValue != null ? queryField.defaultValue : null;
      }
    }

    data.addAll(emptyData);
    return data;
  }
}
