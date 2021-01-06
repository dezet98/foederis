import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/data/models/utils/collection.dart';
import 'package:engineering_thesis/shared/constants/errors.dart';
import 'package:meta/meta.dart';

import '../models/activity.dart';
import '../models/collections/activity_collection.dart';
import '../models/utils/fetch_filter.dart';
import '../services/remote_database_service.dart';

class ActivityRepository {
  final RemoteDatabaseService _remoteRepository;
  final String collectionName = ActivityCollection.collectionName;

  ActivityRepository(this._remoteRepository);

  List<Activity> _fromQuerySnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((DocumentSnapshot e) => Activity.fromDocument(e))
        .toList();
  }

  Activity _fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return Activity.fromDocument(documentSnapshot);
  }

  Future<List<Activity>> fetchAllNotMyFutureActivities({
    @required String lowerGeohash,
    @required String upperGeohash,
    DocumentReference userRef,
  }) async {
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

    List<Activity> activities =
        await _remoteRepository.getCollection<List<Activity>>(
            filters, collectionName, _fromQuerySnapshot);

    return activities
        .where((element) => element.startDate.isAfter(DateTime.now()))
        .toList()
        .where((element) => element.userRef.id != userRef?.id)
        .toList();
  }

  Future<void> cancelActivity(Activity activity) async {
    Map<String, dynamic> activityMap = Collection.fillRemainsData(
        activity.toMap(), ActivityCollection.allFields);

    activityMap[ActivityCollection.isCancel.fieldName] = true;

    return await _remoteRepository.insertWithNameToCollection(
        activityMap, collectionName, activity.ref.id);
  }

  Stream<Activity> getCollectionItemStream(DocumentReference activityRef) {
    return _remoteRepository.getCollectionItemStream(
        activityRef.path, _fromDocumentSnapshot);
  }

  Future<DocumentReference> createActivity(
      Activity activity, UserDataBloc userDataBloc) async {
    activity.userRef = userDataBloc.user.ref;
    Map<String, dynamic> activityMap = Collection.fillRemainsData(
        activity.toMap(), ActivityCollection.allFields);

    activityMap[ActivityCollection.isCancel.fieldName] = false;

    return await _remoteRepository.insertToCollection(
        activityMap, collectionName);
  }
}
