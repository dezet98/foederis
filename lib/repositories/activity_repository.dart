import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/constants/collections.dart';
import 'package:engineering_thesis/models/activity.dart';
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

  Future<List<Activity>> getAllActivities() async {
    try {
      return await _firestore
          .collection(Collections.activity)
          .get()
          .then(fromQuerySnapshot);
    } catch (e) {
      if (e is QueryException) {
        return Future.wait([]);
      }
    }
  }

  Stream<List<Activity>> getAllActivitiesStream() {
    try {
      return _firestore
          .collection(Collections.activity)
          .snapshots()
          .asyncMap(fromQuerySnapshot);
    } catch (e) {
      if (e is QueryException) {
        return [] as Stream<List<Activity>>;
      }
    }
  }
}
