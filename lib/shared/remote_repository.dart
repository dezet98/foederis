import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/constants/enums.dart';
import 'package:engineering_thesis/models/fetch_filter.dart';
import 'package:engineering_thesis/shared/extensions.dart';

import 'exceptions.dart';

class RemoteRepository {
  final FirebaseFirestore _firestore;

  RemoteRepository({FirebaseFirestore firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<ResultType> fetchCollection<ResultType>(
    List<FetchFilter> filters,
    String collectionName,
    ResultType fromQuerySnapshot(QuerySnapshot querySnapshot),
  ) async {
    try {
      return await _firestore
          .collection(collectionName)
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

  Future<DocumentReference> addDocumentToCollection(
    Map<String, dynamic> data,
    String collectionName,
  ) async {
    try {
      return await _firestore.collection(collectionName).add(data);
    } catch (e) {
      if (e is UploadDataException) {
        throw e;
      }
      throw UploadDataException(
          sendingDataError: UploadDataError.undefined, message: e.toString());
    }
  }
}
