import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/fetch_filter.dart';
import 'constants/enums.dart';
import 'exceptions.dart';
import 'extensions.dart';

class RemoteRepository {
  final FirebaseFirestore _firestore;

  RemoteRepository({FirebaseFirestore firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<ResultType> getCollection<ResultType>(
    List<FetchFilter> filters,
    String collectionPath,
    ResultType fromQuerySnapshot(QuerySnapshot querySnapshot),
  ) async {
    try {
      return await _firestore
          .collection(collectionPath)
          .whereWithFilters(filters)
          .get()
          .then(fromQuerySnapshot);
    } catch (e) {
      if (e is FetchingException) {
        throw e;
      }
      throw FetchingException(
          fetchingError: FetchingError.undefined, message: e.toString());
    }
  }

  Future<DocumentReference> insertToCollection(
    Map<String, dynamic> data,
    String collectionPath,
  ) async {
    try {
      return await _firestore.collection(collectionPath).add(data);
    } catch (e) {
      if (e is SendingDataException) {
        throw e;
      }
      throw SendingDataException(
          sendingDataError: UploadDataError.undefined, message: e.toString());
    }
  }

  Future<void> insertWithNameToCollection(
    Map<String, dynamic> data,
    String collectionPath,
    String docName,
  ) async {
    try {
      return await _firestore.collection(collectionPath).doc(docName).set(data);
    } catch (e) {
      if (e is SendingDataException) {
        throw e;
      }
      throw SendingDataException(
          sendingDataError: UploadDataError.undefined, message: e.toString());
    }
  }

  Future<ResultType> getCollectionItem<ResultType>(
    String collectionItemPath,
    ResultType fromQuerySnapshot(DocumentSnapshot querySnapshot),
  ) async {
    try {
      return await _firestore
          .doc(collectionItemPath)
          .get()
          .then(fromQuerySnapshot);
    } catch (e) {
      if (e is FetchingException) {
        throw e;
      }
      throw FetchingException(
          fetchingError: FetchingError.undefined, message: e.toString());
    }
  }
}
