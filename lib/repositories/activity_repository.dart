import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/constants/enums.dart';
import 'package:engineering_thesis/models/filter.dart';
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

  Future<List<Activity>> getAllActivities(List<Filter> filters) async {
    try {
      return await _firestore
          .collection(Collections.activity)
          //.where(field)
          //.where('city', isEqualTo: 'dasas')
          //.where('city', isEqualTo: geoFiltr.city)
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

// extension filter on CollectionReference {
//   @override
//   Query whereFilter(List<Filter> filters) {
//     return this.where(filters[0].name, : );
//   }

//   dynamic getMethod() {
//     return <dynamic> isEqualTo;
//   }
// }
