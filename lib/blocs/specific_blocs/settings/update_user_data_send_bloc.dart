import 'dart:io';

import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/models/collections/user_collection.dart';
import 'package:engineering_thesis/repositories/user_repository.dart';
import 'package:engineering_thesis/shared/remote_storage.dart';

class UpdateUserDataSendBloc extends SendBloc {
  final UserRepository _userRepository;
  final UserDataBloc _userDataBloc;
  final RemoteStorage _remoteStorage;

  UpdateUserDataSendBloc(
      this._userRepository, this._userDataBloc, this._remoteStorage);

  @override
  Future<void> query(Map<String, dynamic> valuesMap) async {
    File file = valuesMap[UserCollection.photoUrl.fieldName];

    // when user choose new photo
    if (file != null) {
      await _remoteStorage.uploadFile(
        file: file,
        path: StoragePatches.userProfilePhoto(_userDataBloc.user.ref.id),
      );

      valuesMap[UserCollection.photoUrl.fieldName] = await _remoteStorage
          .loadFile(StoragePatches.userProfilePhoto(_userDataBloc.user.ref.id));
    }
    // when photo didn't change
    else {
      valuesMap[UserCollection.photoUrl.fieldName] =
          _userDataBloc.user.photoUrl;
    }

    await _userRepository.updateUserBasicData(valuesMap, _userDataBloc.user);
  }
}
