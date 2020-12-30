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

    return await _remoteRepository.getCollection<List<Activity>>(
        filters, ActivityCollection.collectionName, _fromQuerySnapshot);
  }

  // Stream<List<Activity>> getMyActivitiesStream(DocumentReference userRef) {
  //   List<FetchFilter> filters = [];
  //   filters.addAll([
  //     FetchFilter(
  //       fieldName: ActivityCollection.us.fieldName,
  //       fieldValue: lowerGeohash,
  //       filterType: FetchFilterType.isGreaterThanOrEqualTo,
  //     ),
  //   ]);

  //   return _remoteRepository.getCollectionStream(
  //       ActivityCollection.collectionName, _fromQuerySnapshot);
  // }

  Stream<Activity> getCollectionItemStream(DocumentReference activityRef) {
    return _remoteRepository.getCollectionItemStream(
        activityRef.path, _fromDocumentSnapshot);
  }

  Future<DocumentReference> createActivity(
      Activity activity, UserDataBloc userDataBloc) async {
    activity.userRef = userDataBloc.user.ref;
    Map<String, dynamic> activityMap = Collection.fillRemainsData(
        activity.toMap(), ActivityCollection.allFields);

    return await _remoteRepository.insertToCollection(
        activityMap, ActivityCollection.collectionName);
  }
}
