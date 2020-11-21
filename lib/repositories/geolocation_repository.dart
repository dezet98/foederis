import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/constants/collections.dart';
import 'package:engineering_thesis/models/geolocation.dart';
import 'package:engineering_thesis/shared/exceptions.dart';

class GeolocationRepository {
  final FirebaseFirestore _firestore;

  GeolocationRepository({FirebaseFirestore firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  List<Geolocation> fromQuerySnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((QueryDocumentSnapshot e) => Geolocation.fromDocument(e))
        .toList();
  }

  List<T> fromQuerySnapshotTo<T>(QuerySnapshot querySnapshot,
      T Function(QueryDocumentSnapshot) mapElement) {
    return querySnapshot.docs.map(mapElement).toList();
  }

  Future<List<Geolocation>> getAllGeolocations() async {
    try {
      return await _firestore
          .collection(Collections.geolocation)
          .get()
          .then(fromQuerySnapshot);
    } catch (e) {
      if (e is QueryException) {
        return Future.wait([]);
      }
    }
  }

  Stream<List<Geolocation>> getAllGeolocationsStream() {
    try {
      return _firestore
          .collection(Collections.geolocation)
          .snapshots()
          .asyncMap(fromQuerySnapshot);
    } catch (e) {
      if (e is QueryException) {
        return [] as Stream<List<Geolocation>>;
      }
    }
  }
}
