part of './base_repository.dart';

abstract class DocumentRepository {
  Future<AppObjectResultModel<DocumentModel>> getDocument({
    required Map<String, dynamic> params,
  });
}
