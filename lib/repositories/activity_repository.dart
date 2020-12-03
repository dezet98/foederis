import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/constants/enums.dart';
import 'package:engineering_thesis/constants/collections.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/fetch_filter.dart';
import 'package:engineering_thesis/shared/exceptions.dart';

class ActivityRepository {
  final FirebaseFirestore _firestore;

  ActivityRepository({FirebaseFirestore firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  List<Activity> fromQuerySnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((QueryDocumentSnapshot e) => Activity.fromDocument(e))
        .toList();
  }

  Future<List<Activity>> getAllActivities(List<FetchFilter> filters) async {
    try {
      return await _firestore
          .collection(Collections.activity)
          .whereWithFilters(filters)
          .get()
          .then(fromQuerySnapshot);
    } catch (e) {
      if (e is FetchingException) {
        throw e;
      }
      throw FetchingException(
          fetchingError: FetchingError.undefined, message: e.toString());
    }
  }

  Stream<List<Activity>> getAllActivitiesStream() {
    try {
      return _firestore
          .collection(Collections.activity)
          .snapshots()
          .asyncMap(fromQuerySnapshot);
    } catch (e) {
      if (e is FetchingException) {
        throw e;
      }
      throw FetchingException(
          fetchingError: FetchingError.undefined, message: e.toString());
    }
  }
}

extension filter on CollectionReference {
  Query whereWithFilters(List<FetchFilter> filters) {
    if (filters.length == 0) return this;

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
