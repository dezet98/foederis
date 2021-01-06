import 'package:cloud_firestore/cloud_firestore.dart';

import '../../shared/constants/errors.dart';
import '../../shared/exceptions/exceptions.dart';
import '../../shared/extensions/extensions.dart';
import '../models/utils/fetch_filter.dart';

class RemoteDatabaseService {
  final FirebaseFirestore _firestore;

  RemoteDatabaseService({FirebaseFirestore firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  // get data:
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

  Stream<ResultType> getCollectionItemStream<ResultType>(
    String collectionItemPath,
    ResultType fromQuerySnapshot(DocumentSnapshot querySnapshot),
  ) {
    try {
      return _firestore
          .doc(collectionItemPath)
          .snapshots()
          .asyncMap(fromQuerySnapshot);
    } catch (e) {
      if (e is StreamException) {
        throw e;
      }
      throw StreamException(
          streamError: StreamError.undefined, message: e.toString());
    }
  }

  Stream<ResultType> getCollectionStream<ResultType>(
    String collectionPath,
    List<FetchFilter> filters,
    ResultType fromQuerySnapshot(QuerySnapshot querySnapshot),
  ) {
    try {
      return _firestore
          .collection(collectionPath)
          .whereWithFilters(filters)
          .snapshots()
          .asyncMap(fromQuerySnapshot);
    } catch (e) {
      if (e is StreamException) {
        throw e;
      }
      throw StreamException(
          streamError: StreamError.undefined, message: e.toString());
    }
  }

  /// insert new data
  Future<DocumentReference> insertToCollection(
      Map<String, dynamic> data, String collectionPath) async {
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

  /// insert new data or update existing
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

  Future<dynamic> deleteWithNameFromCollection(
    String collectionPath,
    String docName,
  ) async {
    try {
      return await _firestore.collection(collectionPath).doc(docName).delete();
    } catch (e) {
      if (e is SendingDataException) {
        throw e;
      }
      throw SendingDataException(
          sendingDataError: UploadDataError.undefined, message: e.toString());
    }
  }

  /// get reference to not existing item in in the given collection
  Future<DocumentReference> referenceToItem(String collectionPath) async {
    try {
      return _firestore.collection(collectionPath).doc();
    } catch (e) {
      if (e is SendingDataException) {
        throw e;
      }
      throw SendingDataException(
          sendingDataError: UploadDataError.undefined, message: e.toString());
    }
  }

  /// get reference to not existing item in the given collection
  Future<DocumentReference> referenceToExistingItem(
    String collectionPath,
    String docName,
  ) async {
    try {
      return _firestore.collection(collectionPath).doc(docName);
    } catch (e) {
      throw Exception();
    }
  }

  /// batches
  Future<WriteBatch> getBatch() async {
    try {
      return _firestore.batch();
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> commitBatch(WriteBatch batch) async {
    try {
      return batch.commit();
    } catch (e) {
      if (e is SendingDataException) {
        throw e;
      }
      throw SendingDataException(
          sendingDataError: UploadDataError.undefined, message: e.toString());
    }
  }

  /// transactions
  Future<T> runTranslaction<T>(
      Future<T> Function(Transaction) transactionHandler) async {
    try {
      return _firestore.runTransaction(transactionHandler);
    } catch (e) {
      if (e is SendingDataException) {
        throw e;
      }
      throw SendingDataException(
          sendingDataError: UploadDataError.undefined, message: e.toString());
    }
  }
}
