import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/constants/enums.dart';

import 'exceptions.dart';

extension catchQueryExceptions on QueryDocumentSnapshot {
  /// use `get(dynamic field)` method with handle exceptions
  dynamic getField(String field) {
    try {
      return this.get(field);
    } catch (e) {
      if (e is StateError) {
        throw (QueryException(
          queryError: QueryError.field_not_exist,
          message: "${e.message} / for $field field",
        ));
      }
      throw QueryException(queryError: QueryError.undefined);
    }
  }

  /// use `get(dynamic field)` method with handle exceptions
  DateTime getDataTimeField(String field) {
    try {
      return this.get(field)?.toDate();
    } catch (e) {
      if (e is StateError) {
        throw (QueryException(
          queryError: QueryError.field_not_exist,
          message: "for $field field",
        ));
      }
      throw QueryException(queryError: QueryError.undefined);
    }
  }
}
