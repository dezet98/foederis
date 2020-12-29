import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_args.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_bloc.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/repositories/user_repository.dart';
import 'package:meta/meta.dart';

class UserFetchBloc extends FetchBloc {
  final UserRepository _userRepository;
  final DocumentReference userRef;

  UserFetchBloc(this._userRepository, {@required this.userRef});

  @override
  Future<AppUser> fetch(FetchArgs fetchArgs) async {
    return await _userRepository.fetchUser(userRef.id);
  }
}
