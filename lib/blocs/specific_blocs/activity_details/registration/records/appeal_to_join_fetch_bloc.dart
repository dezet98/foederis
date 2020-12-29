import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_args.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_bloc.dart';
import 'package:engineering_thesis/models/appeal_to_join.dart';
import 'package:engineering_thesis/repositories/appeal_to_join_repository.dart';
import 'package:meta/meta.dart';

class AppealToJoinBloc extends FetchBloc {
  final AppealToJoinRepository _appealToJoinRepository;
  final DocumentReference activityRef;
  final DocumentReference userRef;

  AppealToJoinBloc(
    this._appealToJoinRepository, {
    @required this.activityRef,
    @required this.userRef,
  });

  @override
  Future<AppealToJoin> fetch(FetchArgs fetchArgs) {
    return _appealToJoinRepository.getAppealToJoin(activityRef, userRef);
  }
}
