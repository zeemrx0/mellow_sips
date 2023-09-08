part of './base_remote_data_source.dart';

abstract class TestRemoteDataSource {
  Future<AppObjectResultRaw<TestRaw>> getTest();
}

class TestRemoteDataSourceImpl extends TestRemoteDataSource {
  final NetworkService _networkService;

  TestRemoteDataSourceImpl(this._networkService);

  @override
  Future<AppObjectResultRaw<TestRaw>> getTest() async {
    try {
      final response = await _networkService.request(
          clientRequest: ClientRequest(
        url: ApiProvider.test,
        method: HttpMethod.get,
      ));

      return response.toObjectRaw((data) => TestRaw.fromJson(data));
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
