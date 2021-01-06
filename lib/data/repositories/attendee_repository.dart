import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/data/models/attendee.dart';
import 'package:engineering_thesis/data/models/collections/attendee_collection.dart';
import 'package:engineering_thesis/data/models/utils/collection.dart';
import 'package:engineering_thesis/data/models/utils/fetch_filter.dart';
import 'package:engineering_thesis/shared/constants/errors.dart';
import 'package:engineering_thesis/shared/utils/enums.dart';

import '../services/remote_database_service.dart';

class AttendeeRepository {
  final RemoteDatabaseService _remoteRepository;
  final String collectionPath = AttendeeCollection.collectionName;

  AttendeeRepository(this._remoteRepository);

  List<Attendee> _fromQuerySnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((DocumentSnapshot e) => Attendee.fromDocument(e))
        .toList();
  }

  Future<List<Attendee>> fetchAllAttendees(DocumentReference activityRef,
      {bool withoutCancel = true}) async {
    List<FetchFilter> filters = [
      FetchFilter(
        fieldName: AttendeeCollection.activityRef.fieldName,
        fieldValue: activityRef,
        filterType: FetchFilterType.isEqualTo,
      ),
      if (withoutCancel)
        FetchFilter(
          fieldName: AttendeeCollection.isCancel.fieldName,
          fieldValue: false,
          filterType: FetchFilterType.isEqualTo,
        ),
    ];

    return await _remoteRepository.getCollection<List<Attendee>>(
        filters, collectionPath, _fromQuerySnapshot);
  }

  Future<Attendee> fetchAttendee(
      DocumentReference activityRef, DocumentReference userRef,
      {bool withoutCancel = true}) async {
    List<FetchFilter> filters = [
      FetchFilter(
        fieldName: AttendeeCollection.activityRef.fieldName,
        fieldValue: activityRef,
        filterType: FetchFilterType.isEqualTo,
      ),
      FetchFilter(
        fieldName: AttendeeCollection.userRef.fieldName,
        fieldValue: userRef,
        filterType: FetchFilterType.isEqualTo,
      ),
      if (withoutCancel)
        FetchFilter(
          fieldName: AttendeeCollection.isCancel.fieldName,
          fieldValue: false,
          filterType: FetchFilterType.isEqualTo,
        )
    ];

    List<Attendee> attendees =
        await _remoteRepository.getCollection<List<Attendee>>(
            filters, collectionPath, _fromQuerySnapshot);
    return attendees.length == 1 ? attendees[0] : null;
  }

  Future<List<Attendee>> getAttendeesByUser(DocumentReference userRef,
      {bool withoutCancel = true}) {
    List<FetchFilter> filters = [
      FetchFilter(
        fieldName: AttendeeCollection.userRef.fieldName,
        fieldValue: userRef,
        filterType: FetchFilterType.isEqualTo,
      ),
      if (withoutCancel)
        FetchFilter(
          fieldName: AttendeeCollection.isCancel.fieldName,
          fieldValue: false,
          filterType: FetchFilterType.isEqualTo,
        )
    ];

    return _remoteRepository.getCollection<List<Attendee>>(
        filters, collectionPath, _fromQuerySnapshot);
  }

  Stream<List<Attendee>> getAttendeesStreamByActivity(
      DocumentReference activityRef,
      {bool withoutCancel = true}) {
    List<FetchFilter> filters = [
      FetchFilter(
        fieldName: AttendeeCollection.activityRef.fieldName,
        fieldValue: activityRef,
        filterType: FetchFilterType.isEqualTo,
      ),
      if (withoutCancel)
        FetchFilter(
          fieldName: AttendeeCollection.isCancel.fieldName,
          fieldValue: false,
          filterType: FetchFilterType.isEqualTo,
        )
    ];

    return _remoteRepository.getCollectionStream<List<Attendee>>(
        collectionPath, filters, _fromQuerySnapshot);
  }

  Stream<List<Attendee>> getAttendeesStreamByUser(DocumentReference userRef,
      {bool withoutCancel = true}) {
    List<FetchFilter> filters = [
      FetchFilter(
        fieldName: AttendeeCollection.userRef.fieldName,
        fieldValue: userRef,
        filterType: FetchFilterType.isEqualTo,
      ),
      if (withoutCancel)
        FetchFilter(
          fieldName: AttendeeCollection.isCancel.fieldName,
          fieldValue: false,
          filterType: FetchFilterType.isEqualTo,
        ),
    ];

    return _remoteRepository.getCollectionStream<List<Attendee>>(
        collectionPath, filters, _fromQuerySnapshot);
  }

  Future<void> cancelAttendee(Attendee attendee) async {
    Map<String, dynamic> activityMap = Collection.fillRemainsData(
        attendee.toMap(), AttendeeCollection.allFields);

    activityMap[AttendeeCollection.isCancel.fieldName] = true;

    return await _remoteRepository.insertWithNameToCollection(
        activityMap, AttendeeCollection.collectionName, attendee.ref.id);
  }

  Future<DocumentReference> createAttendee(Attendee attendee) async {
    Map<String, dynamic> data = Collection.fillRemainsData(
        attendee.toMap(), AttendeeCollection.allFields);

    data[AttendeeCollection.isCancel.fieldName] = false;

    return await _remoteRepository.insertToCollection(
      data,
      collectionPath,
    );
  }

  Future<void> grantCoorganizatorRights(Attendee attendee) async {
    Map<String, dynamic> data = Collection.fillRemainsData(
        attendee.toMap(), AttendeeCollection.allFields);

    data[AttendeeCollection.role.fieldName] =
        enumToString(AttendeeRole.coorganizer);

    return await _remoteRepository.insertWithNameToCollection(
      data,
      collectionPath,
      attendee.ref.id,
    );
  }

  Future<void> giveUpCoorganizatorRights(Attendee attendee) async {
    Map<String, dynamic> data = Collection.fillRemainsData(
        attendee.toMap(), AttendeeCollection.allFields);

    data[AttendeeCollection.role.fieldName] =
        enumToString(AttendeeRole.attendee);

    return await _remoteRepository.insertWithNameToCollection(
      data,
      collectionPath,
      attendee.ref.id,
    );
  }
}
