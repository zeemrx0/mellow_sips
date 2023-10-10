part of '../base_remote_data_source.dart';

abstract class DocumentRemoteDataSource {
  Future<AppObjectResultRaw<DocumentRaw>> getDocument({
    required Map<String, dynamic> params,
  });
}

class DocumentRemoteDataSourceImpl implements DocumentRemoteDataSource {
  final NetworkService _networkService;

  DocumentRemoteDataSourceImpl(this._networkService);

  @override
  Future<AppObjectResultRaw<DocumentRaw>> getDocument({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: '${ApiProvider.documents}/${params['documentId']}',
          method: HttpMethod.get,
        ),
      );

      return remoteData.toObjectRaw((data) => DocumentRaw.fromJson(data));
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
