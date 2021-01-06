import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/data/models/appeal_to_join.dart';
import 'package:engineering_thesis/data/models/collections/appeal_to_join_collection.dart';
import 'package:engineering_thesis/data/repositories/appeal_to_join_repository.dart';
import 'package:meta/meta.dart';

class AppealToJoinCreateSendBloc extends SendBloc {
  final AppealToJoinRepository _appealToJoinRepository;
  final DocumentReference activityRef;
  final DocumentReference userRef;

  AppealToJoinCreateSendBloc(
    this._appealToJoinRepository, {
    @required this.activityRef,
    @required this.userRef,
  });

  @override
  Future<void> query(Map<String, dynamic> map) async {
    return _appealToJoinRepository.createAppealToJoin(AppealToJoin.fromMap({
      AppealToJoinCollection.activityRef.fieldName: activityRef,
      AppealToJoinCollection.userRef.fieldName: userRef,
      AppealToJoinCollection.submissionDate.fieldName: DateTime.now(),
      AppealToJoinCollection.comment.fieldName:
          map[AppealToJoinCollection.comment.fieldName],
    }));
  }
}
