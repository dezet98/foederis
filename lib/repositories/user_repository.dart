import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/models/collections/user_collection.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../shared/remote_repository.dart';

class UserRepository {
  final RemoteRepository _remoteRepository;
  final String collectionPath = UserCollection.collectionName;

  UserRepository(this._remoteRepository);

  // List<AppUser> _fromQuerySnapshot(QuerySnapshot querySnapshot) {
  //   return querySnapshot.docs
  //       .map((DocumentSnapshot e) => AppUser.fromDocument(e))
  //       .toList();
  // }

  AppUser _fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return AppUser.fromDocument(documentSnapshot);
  }

  // Future<List<Category>> fetchAllCategories(List<FetchFilter> filters) async {
  //   return await database.fetchCollection<List<Category>>(
  //       filters, collectionName, _fromQuerySnapshot);
  // }

  Future<AppUser> fetchUser(String userId) async {
    return await _remoteRepository.getCollectionItem<AppUser>(
      '$collectionPath/$userId',
      _fromDocumentSnapshot,
    );
  }

  Future<void> createUser(User firebaseUser) async {
    return await _remoteRepository.insertWithNameToCollection(
      AppUser.fromMap({
        UserCollection.email.fieldName: firebaseUser.email,
      }).toMap(),
      collectionPath,
      firebaseUser.uid,
    );
  }
}
