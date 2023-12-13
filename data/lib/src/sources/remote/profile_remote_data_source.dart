part of './base_remote_data_source.dart';

abstract class ProfileRemoteDataSource {
  Future<AppObjectResultRaw<ProfileRaw>> getProfile();

  Future<AppObjectResultRaw<EmptyRaw>> updateProfile({
    required Map<String, dynamic> params,
  });
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final NetworkService _networkService;

  ProfileRemoteDataSourceImpl(this._networkService);

  @override
  Future<AppObjectResultRaw<ProfileRaw>> getProfile() async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: ApiProvider.profile,
          method: HttpMethod.get,
        ),
      );

      return remoteData.toObjectRaw((data) => ProfileRaw.fromJson(data));
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultRaw<EmptyRaw>> updateProfile({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: ApiProvider.profile,
          method: HttpMethod.put,
          body: params,
        ),
      );

      return remoteData.toObjectRaw((data) => EmptyRaw());
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
