import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/models/collections/collection.dart';
import 'package:engineering_thesis/shared/constants/enums.dart';
import 'package:meta/meta.dart';

import '../models/activity.dart';
import '../models/collections/activity_collection.dart';
import '../models/fetch_filter.dart';
import '../shared/remote_repository.dart';

class ActivityRepository {
  final RemoteRepository _database;

  ActivityRepository(this._database);

  List<Activity> _fromQuerySnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((DocumentSnapshot e) => Activity.fromDocument(e))
        .toList();
  }

  Future<List<Activity>> fetchAllActivities(
      {@required String lowerGeohash, @required String upperGeohash}) async {
    List<FetchFilter> filters = [];
    filters.addAll([
      FetchFilter(
        fieldName: ActivityCollection.geohash.fieldName,
        fieldValue: lowerGeohash,
        filterType: FetchFilterType.isGreaterThanOrEqualTo,
      ),
      FetchFilter(
        fieldName: ActivityCollection.geohash.fieldName,
        fieldValue: upperGeohash,
        filterType: FetchFilterType.isLessThanOrEqualTo,
      ),
    ]);

    return await _database.getCollection<List<Activity>>(
        filters, ActivityCollection.collectionName, _fromQuerySnapshot);
  }

  // Stream<List<Activity>> fetchAllActivitiesStream() {
  //   try {
  //     return _firestore
  //         .collection(Collections.activity)
  //         .snapshots()
  //         .asyncMap(fromQuerySnapshot);
  //   } catch (e) {
  //     if (e is FetchingException) {
  //       throw e;
  //     }
  //     throw FetchingException(
  //         fetchingError: FetchingError.undefined, message: e.toString());
  //   }
  // }

  Future<DocumentReference> createActivity(
      Activity activity, UserDataBloc userDataBloc) async {
    activity.userRef = userDataBloc.user.ref;
    Map<String, dynamic> activityMap = Collection.fillRemainsData(
        activity.toMap(), ActivityCollection.allFields);

    return await _database.insertToCollection(
        activityMap, ActivityCollection.collectionName);
  }
}
