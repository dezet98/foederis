import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/models/appeal_to_join.dart';
import 'package:engineering_thesis/models/collections/appeal_to_join_collection.dart';
import 'package:engineering_thesis/models/collections/collection.dart';
import 'package:engineering_thesis/models/fetch_filter.dart';
import 'package:engineering_thesis/shared/constants/enums.dart';

import '../shared/remote_repository.dart';

class AppealToJoinRepository {
  final RemoteRepository _remoteRepository;
  final String collectionPath = AppealToJoinCollection.collectionName;

  AppealToJoinRepository(this._remoteRepository);

  List<AppealToJoin> _fromQuerySnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((DocumentSnapshot e) => AppealToJoin.fromDocument(e))
        .toList();
  }

  // AppealToJoin _fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
  //   return AppealToJoin.fromDocument(documentSnapshot);
  // }

  Future<List<AppealToJoin>> fetchAllAppealToJoins(
      DocumentReference activityRef) async {
    List<FetchFilter> filters = [];
    filters.add(
      FetchFilter(
        fieldName: AppealToJoinCollection.activityRef.fieldName,
        fieldValue: activityRef,
        filterType: FetchFilterType.isEqualTo,
      ),
    );

    return await _remoteRepository.getCollection<List<AppealToJoin>>(
        filters, collectionPath, _fromQuerySnapshot);
  }

  Future<AppealToJoin> getAppealToJoin(
      DocumentReference activityRef, DocumentReference userRef) async {
    List<FetchFilter> filters = [];
    filters.addAll([
      FetchFilter(
        fieldName: AppealToJoinCollection.activityRef.fieldName,
        fieldValue: activityRef,
        filterType: FetchFilterType.isEqualTo,
      ),
      FetchFilter(
        fieldName: AppealToJoinCollection.userRef.fieldName,
        fieldValue: userRef,
        filterType: FetchFilterType.isEqualTo,
      ),
    ]);

    return await _remoteRepository
        .getCollection<List<AppealToJoin>>(
            filters, collectionPath, _fromQuerySnapshot)
        .then(
          (List<AppealToJoin> appealToJoin) =>
              appealToJoin.length == 0 ? null : appealToJoin.first,
        );
  }

  Future<DocumentReference> createAppealToJoin(
      AppealToJoin appealToJoin) async {
    Map<String, dynamic> data = Collection.fillRemainsData(
        appealToJoin.toMap(), AppealToJoinCollection.allFields);
    return await _remoteRepository.insertToCollection(
      data,
      collectionPath,
    );
  }

  Future<void> deleteAppealToJoin(
    DocumentReference appealToJoinRef,
  ) async {
    return await _remoteRepository.deleteWithNameFromCollection(
      collectionPath,
      appealToJoinRef.id,
    );
  }
}
