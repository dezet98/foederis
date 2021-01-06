import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/data/repositories/appeal_to_join_repository.dart';
import 'package:meta/meta.dart';

class AppealToJoinCancelSendBloc extends SendBloc {
  final AppealToJoinRepository _appealToJoinRepository;
  final DocumentReference appealToJoinRef;

  AppealToJoinCancelSendBloc(this._appealToJoinRepository,
      {@required this.appealToJoinRef});

  @override
  Future<void> query(_) async {
    return _appealToJoinRepository.deleteAppealToJoin(appealToJoinRef);
  }
}
