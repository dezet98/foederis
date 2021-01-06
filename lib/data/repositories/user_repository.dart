import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/data/models/app_user.dart';
import 'package:engineering_thesis/data/models/collections/user_collection.dart';
import 'package:engineering_thesis/data/models/utils/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/remote_database_service.dart';

class UserRepository {
  final RemoteDatabaseService _remoteRepository;
  final String collectionPath = UserCollection.collectionName;

  UserRepository(this._remoteRepository);

  AppUser _fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return AppUser.fromDocument(documentSnapshot);
  }

  Future<AppUser> fetchUser(String userId) async {
    return await _remoteRepository.getCollectionItem<AppUser>(
      '$collectionPath/$userId',
      _fromDocumentSnapshot,
    );
  }

  Future<void> createUser(User firebaseUser) async {
    Map<String, dynamic> userMap = Collection.fillRemainsData({
      UserCollection.email.fieldName: firebaseUser.email,
    }, UserCollection.allFields);

    return await _remoteRepository.insertWithNameToCollection(
      userMap,
      collectionPath,
      firebaseUser.uid,
    );
  }

  Future<void> updateUserBasicData(
      Map<String, dynamic> appUserData, AppUser appUser) async {
    appUserData[UserCollection.email.fieldName] = appUser.email;

    Map<String, dynamic> userMap =
        Collection.fillRemainsData(appUserData, UserCollection.allFields);

    return await _remoteRepository.insertWithNameToCollection(
      userMap,
      collectionPath,
      appUser.ref.id,
    );
  }
}
