import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:domain/domain.dart';

class DocumentRepositoryImpl extends DocumentRepository {
  final DocumentRemoteDataSource _documentRemoteDataSource;

  DocumentRepositoryImpl(this._documentRemoteDataSource);

  @override
  Future<AppObjectResultModel<DocumentModel>> getDocument({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData =
          await _documentRemoteDataSource.getDocument(params: params);
      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
