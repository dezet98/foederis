import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/models/collections/attendee_collection.dart';
import 'package:engineering_thesis/models/collections/collection.dart';
import 'package:engineering_thesis/models/fetch_filter.dart';
import 'package:engineering_thesis/shared/constants/enums.dart';

import '../shared/remote_repository.dart';

class AttendeeRepository {
  final RemoteRepository _remoteRepository;
  final String collectionPath = AttendeeCollection.collectionName;

  AttendeeRepository(this._remoteRepository);

  List<Attendee> _fromQuerySnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((DocumentSnapshot e) => Attendee.fromDocument(e))
        .toList();
  }

  // Attendee _fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
  //   return Attendee.fromDocument(documentSnapshot);
  // }

  Future<List<Attendee>> fetchAllAttendees(
      DocumentReference activityRef) async {
    List<FetchFilter> filters = [];
    filters.add(
      FetchFilter(
        fieldName: AttendeeCollection.activityRef.fieldName,
        fieldValue: activityRef,
        filterType: FetchFilterType.isEqualTo,
      ),
    );

    return await _remoteRepository.getCollection<List<Attendee>>(
        filters, collectionPath, _fromQuerySnapshot);
  }

  Stream<List<Attendee>> getAttendeesStreamByActivity(
      DocumentReference activityRef) {
    List<FetchFilter> filters = [];
    filters.add(
      FetchFilter(
        fieldName: AttendeeCollection.activityRef.fieldName,
        fieldValue: activityRef,
        filterType: FetchFilterType.isEqualTo,
      ),
    );

    return _remoteRepository.getCollectionStream<List<Attendee>>(
        collectionPath, filters, _fromQuerySnapshot);
  }

  Stream<List<Attendee>> getAttendeesStreamByUser(DocumentReference userRef) {
    List<FetchFilter> filters = [];
    filters.add(
      FetchFilter(
        fieldName: AttendeeCollection.userRef.fieldName,
        fieldValue: userRef,
        filterType: FetchFilterType.isEqualTo,
      ),
    );

    return _remoteRepository.getCollectionStream<List<Attendee>>(
        collectionPath, filters, _fromQuerySnapshot);
  }

  Future<DocumentReference> createAttendee(Attendee attendee) async {
    Map<String, dynamic> data = Collection.fillRemainsData(
        attendee.toMap(), AttendeeCollection.allFields);

    return await _remoteRepository.insertToCollection(
      data,
      collectionPath,
    );
  }
}
