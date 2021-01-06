import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_args.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_bloc.dart';
import 'package:engineering_thesis/data/models/appeal_to_join.dart';
import 'package:engineering_thesis/data/repositories/appeal_to_join_repository.dart';
import 'package:engineering_thesis/data/repositories/user_repository.dart';
import 'package:meta/meta.dart';

class AppealsToJoinFetchBloc extends FetchBloc {
  final AppealToJoinRepository _appealToJoinRepository;
  final UserRepository _userRepository;
  final DocumentReference activityRef;

  AppealsToJoinFetchBloc(
    this._appealToJoinRepository,
    this._userRepository, {
    @required this.activityRef,
  });

  @override
  Future<List<AppealToJoin>> fetch(FetchArgs fetchArgs) async {
    List<AppealToJoin> appealsToJoin =
        await _appealToJoinRepository.fetchAllAppealToJoins(activityRef);

    for (AppealToJoin appealToJoin in appealsToJoin)
      appealToJoin.user =
          await _userRepository.fetchUser(appealToJoin.userRef.id);

    return appealsToJoin;
  }
}
