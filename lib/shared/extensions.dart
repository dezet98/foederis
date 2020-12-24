import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/fetch_filter.dart';
import 'constants/enums.dart';
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
        throw (FetchingException(
          fetchingError: FetchingError.field_not_exist,
          message: "${e.message} / for $field field",
        ));
      }
      throw FetchingException(fetchingError: FetchingError.undefined);
    }
  }
}

extension filter on CollectionReference {
  Query whereWithFilters(List<FetchFilter> filters) {
    if (filters == null || filters.length == 0) return this;

    Query query;
    for (FetchFilter filter in filters) {
      if (filter != null) {
        if (query == null) {
          query = _whereWithFilter(this, filter);
        } else {
          query = _whereWithFilter(query, filter);
        }
      }
    }

    return query != null ? query : this;
  }

  Query _whereWithFilter(Query query, FetchFilter filter) {
    switch (filter.filterType) {
      case FetchFilterType.isEqualTo:
        return query.where(filter.fieldName, isEqualTo: filter.fieldValue);
        break;
      case FetchFilterType.isNotEqualTo:
        return query.where(filter.fieldName, isNotEqualTo: filter.fieldValue);
        break;
      case FetchFilterType.isLessThan:
        return query.where(filter.fieldName, isLessThan: filter.fieldValue);
        break;
      case FetchFilterType.isLessThanOrEqualTo:
        return query.where(filter.fieldName,
            isLessThanOrEqualTo: filter.fieldValue);
        break;
      case FetchFilterType.isGreaterThan:
        return query.where(filter.fieldName, isGreaterThan: filter.fieldValue);
        break;
      case FetchFilterType.isGreaterThanOrEqualTo:
        return query.where(filter.fieldName,
            isGreaterThanOrEqualTo: filter.fieldValue);
        break;
      case FetchFilterType.arrayContains:
        return query.where(filter.fieldName, arrayContains: filter.fieldValue);
        break;
      case FetchFilterType.arrayContainsAny:
        return query.where(filter.fieldName,
            arrayContainsAny: filter.fieldValue);
        break;
      case FetchFilterType.whereIn:
        return query.where(filter.fieldName, whereIn: filter.fieldValue);
        break;
      case FetchFilterType.whereNotIn:
        return query.where(filter.fieldName, whereNotIn: filter.fieldValue);
        break;
      case FetchFilterType.isNull:
        return query.where(filter.fieldName, isNull: filter.fieldValue);
        break;
    }
    return query;
  }
}
