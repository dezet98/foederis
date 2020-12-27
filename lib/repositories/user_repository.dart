import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/models/collections/user_collection.dart';

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
    return await _remoteRepository.fetchCollectionItem<AppUser>(
      '$collectionPath/$userId',
      _fromDocumentSnapshot,
    );
  }

  Future<DocumentReference> createUser(
      DocumentReference userRef, AppUser user) async {
    return await _remoteRepository.addDocumentToCollection(
      user.toMap(),
      collectionPath,
    );
  }
}
