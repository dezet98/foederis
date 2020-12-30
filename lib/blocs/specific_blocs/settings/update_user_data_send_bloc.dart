import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/repositories/user_repository.dart';

class UpdateUserDataSendBloc extends SendBloc {
  final UserRepository _userRepository;
  final UserDataBloc _userDataBloc;

  UpdateUserDataSendBloc(this._userRepository, this._userDataBloc);

  @override
  Future<void> query(Map<String, dynamic> valuesMap) async {
    await _userRepository.updateUserBasicData(valuesMap, _userDataBloc.user);
  }
}
