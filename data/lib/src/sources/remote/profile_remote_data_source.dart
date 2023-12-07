part of './base_remote_data_source.dart';

abstract class ProfileRemoteDataSource {
  Future<AppObjectResultRaw<ProfileRaw>> getProfile();
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
}
