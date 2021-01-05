import 'dart:io';

import 'package:engineering_thesis/shared/constants/errors.dart';
import 'package:engineering_thesis/shared/exceptions/exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';

class RemoteStorageService {
  final FirebaseStorage _firebaseStorage;

  RemoteStorageService({FirebaseStorage firebaseStorage})
      : _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance;

  Future<String> loadFile(String path) async {
    try {
      return await _firebaseStorage.ref().child(path).getDownloadURL();
    } catch (e) {
      throw StorageException(
        storageError: StorageError.undefined,
        message: e.toString(),
      );
    }
  }

  Future<void> uploadFile({
    @required File file,
    @required String path,
  }) async {
    try {
      await _firebaseStorage.ref().child(path).putFile(file);
    } catch (e) {
      throw StorageException(
        storageError: StorageError.undefined,
        message: e.toString(),
      );
    }
  }

  Future<void> deleteFile({@required String path}) async {
    try {
      await _firebaseStorage.ref().child(path).delete();
    } catch (e) {
      throw StorageException(
        storageError: StorageError.undefined,
        message: e.toString(),
      );
    }
  }
}

class StoragePatches {
  static final String _user = "user";

  static String userProfilePhoto(String userId) {
    return '$_user/$userId/profilePhoto';
  }
}
