part of 'base_remote_data_source.dart';

abstract class AuthRemoteDataSource {
  Future<AppObjectResultRaw<TokensRaw>> login({
    required Map<String, dynamic> body,
  });
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final NetworkService _networkService;

  AuthRemoteDataSourceImpl(this._networkService);

  @override
  Future<AppObjectResultRaw<TokensRaw>> login({
    required Map<String, dynamic> body,
  }) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: ApiProvider.login,
          method: HttpMethod.post,
          body: {...body},
        ),
      );
      
      return remoteData.toObjectRaw(
        (data) => TokensRaw.fromJson(data),
      );
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
