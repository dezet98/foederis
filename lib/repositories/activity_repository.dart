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
  final RemoteRepository _remoteRepository;

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
            filters, ActivityCollection.collectionName, _fromQuerySnapshot);

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
        activityMap, ActivityCollection.collectionName, activity.ref.id);
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
        activityMap, ActivityCollection.collectionName);
  }
}
