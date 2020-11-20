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

  Future<dynamic> getAllActivities() async {
    try {
      dynamic x = await _firestore
          .collection(Collections.activity)
          .get()
          .then(fromQuerySnapshot);
      return x;
    } catch (e) {
      if (e is QueryException) {
        return Future.wait([]);
      }
    }
  }
}
