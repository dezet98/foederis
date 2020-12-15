import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/collections/activity_collection.dart';
import 'package:engineering_thesis/models/fetch_filter.dart';
import 'package:engineering_thesis/shared/remote_repository.dart';

class ActivityRepository {
  final RemoteRepository _database;

  ActivityRepository(this._database);

  List<Activity> _fromQuerySnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((QueryDocumentSnapshot e) => Activity.fromDocument(e))
        .toList();
  }

  Future<List<Activity>> fetchAllActivities(List<FetchFilter> filters) async {
    return await _database.fetchCollection<List<Activity>>(
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

  Future<DocumentReference> createActivity(Activity activity) async {
    return await _database.addDocumentToCollection(
        activity.toMap(), ActivityCollection.collectionName);
  }
}
