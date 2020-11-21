import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/constants/enums.dart';
import 'exceptions.dart';

extension catchQueryExceptions on QueryDocumentSnapshot {
  /// use `get(String field)` method with handle exceptions
  T getField<T>(String field) {
    if (T == double) {
      return _query(field)?.toDouble();
    } else if (T == DateTime) {
      return _query(field)?.toDate();
    }

    return _query(field);
  }

  dynamic _query(String field) {
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
}
