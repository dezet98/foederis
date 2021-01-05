import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/models/collections/appeal_to_join_collection.dart';
import 'package:engineering_thesis/models/collections/attendee_collection.dart';
import 'package:engineering_thesis/models/utils/collection.dart';
import 'package:engineering_thesis/repositories/remote_database_service.dart';
import 'package:meta/meta.dart';

class TransactionAndBatchRepository {
  final RemoteDatabaseService _remoteRepository;

  TransactionAndBatchRepository(this._remoteRepository);

  Future<void> addAttendeeAndDeleteAppealToJoin(
      {@required Attendee attendee,
      @required DocumentReference appealToJoinRef}) async {
    WriteBatch batch = await _remoteRepository.getBatch();

    DocumentReference newAttendeeRef =
        await referenceFromCollection(AttendeeCollection.collectionName);

    DocumentReference deletingAppealToJoin = await referenceFromDocument(
        AppealToJoinCollection.collectionName, appealToJoinRef);

    // create attendee
    Map<String, dynamic> data = Collection.fillRemainsData(
        attendee.toMap(), AttendeeCollection.allFields);

    batch.set(newAttendeeRef, data);

    // delete appealToJoin
    batch.delete(deletingAppealToJoin);

    await _remoteRepository.commitBatch(batch);
  }

  // references (for translaction and bathes)
  Future<DocumentReference> referenceFromCollection(
      String collectionPath) async {
    return await _remoteRepository.referenceToItem(
      collectionPath,
    );
  }

  Future<DocumentReference> referenceFromDocument(
    String collectionPath,
    DocumentReference ref,
  ) async {
    return await _remoteRepository.referenceToExistingItem(
      collectionPath,
      ref.id,
    );
  }
}
