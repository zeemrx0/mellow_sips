import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:domain/domain.dart';

class TestRepositoryImpl extends TestRepository {
  final TestRemoteDataSource _testRemoteDataSource;

  TestRepositoryImpl(this._testRemoteDataSource);

  @override
  Future<AppObjectResultModel<TestModel>> getTest() async {
    try {
      final remoteData = await _testRemoteDataSource.getTest();
      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
