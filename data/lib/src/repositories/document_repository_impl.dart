import 'package:data/src/sources/keys/app_keys.dart';
import 'package:data/src/sources/local/base_local_data_source.dart';
import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:domain/domain.dart';

class DocumentRepositoryImpl extends DocumentRepository {
  final DocumentRemoteDataSource _documentRemoteDataSource;
  final DocumentLocalDataSource _documentLocalDataSource;

  DocumentRepositoryImpl(
      this._documentRemoteDataSource, this._documentLocalDataSource);

  @override
  Future<AppObjectResultModel<DocumentModel>> getDocument({
    required Map<String, dynamic> params,
  }) async {
    try {
      final localData = await _documentLocalDataSource.getDocument(
        params[DocumentKey.documentId],
      );

      if (localData.netData != null) {
        return localData.toAppObjectResultModel();
      }

      final remoteData =
          await _documentRemoteDataSource.getDocument(params: params);

      _documentLocalDataSource.saveDocument(
        key: params[DocumentKey.documentId],
        value: remoteData.netData!.toJson(),
      );

      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
