import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/constants/enums.dart';
import 'package:engineering_thesis/models/fetch_filter.dart';
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
          query = whereWithFilter(filter);
        } else {
          query = query.where(filter.fieldName, isEqualTo: filter.fieldValue);
        }
      }
    }

    return query != null ? query : this;
  }

  Query whereWithFilter(FetchFilter filter) {
    switch (filter.filterType) {
      case FetchFilterType.isEqualTo:
        return this.where(filter.fieldName, isEqualTo: filter.fieldValue);
        break;
      case FetchFilterType.isNotEqualTo:
        return this.where(filter.fieldName, isNotEqualTo: filter.fieldValue);
        break;
      case FetchFilterType.isLessThan:
        return this.where(filter.fieldName, isLessThan: filter.fieldValue);
        break;
      case FetchFilterType.isLessThanOrEqualTo:
        return this
            .where(filter.fieldName, isLessThanOrEqualTo: filter.fieldValue);
        break;
      case FetchFilterType.isGreaterThan:
        return this.where(filter.fieldName, isGreaterThan: filter.fieldValue);
        break;
      case FetchFilterType.isGreaterThanOrEqualTo:
        return this
            .where(filter.fieldName, isGreaterThanOrEqualTo: filter.fieldValue);
        break;
      case FetchFilterType.arrayContains:
        return this.where(filter.fieldName, arrayContains: filter.fieldValue);
        break;
      case FetchFilterType.arrayContainsAny:
        return this
            .where(filter.fieldName, arrayContainsAny: filter.fieldValue);
        break;
      case FetchFilterType.whereIn:
        this.where(filter.fieldName, whereIn: filter.fieldValue);
        break;
      case FetchFilterType.whereNotIn:
        return this.where(filter.fieldName, whereNotIn: filter.fieldValue);
        break;
      case FetchFilterType.isNull:
        return this.where(filter.fieldName, isNull: filter.fieldValue);
        break;
    }
    return this;
  }
}
