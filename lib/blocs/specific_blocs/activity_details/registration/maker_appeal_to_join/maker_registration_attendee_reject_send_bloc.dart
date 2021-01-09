import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/data/repositories/appeal_to_join_repository.dart';
import 'package:meta/meta.dart';

class MakerRegistrationAttendeeRejectSendBloc extends SendBloc {
  final AppealToJoinRepository _appealToJoinRepository;
  final DocumentReference appealToJoinRef;

  MakerRegistrationAttendeeRejectSendBloc(this._appealToJoinRepository,
      {@required this.appealToJoinRef});

  @override
  Future<void> query(_) async {
    await _appealToJoinRepository.deleteAppealToJoin(appealToJoinRef);
  }
}
