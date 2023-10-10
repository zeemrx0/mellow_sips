import 'package:data/src/sources/local/base_local_data_source.dart';
import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:domain/domain.dart';

class TestRepositoryImpl extends TestRepository {
  final TestRemoteDataSource _testRemoteDataSource;
  final TestLocalDataSource _testLocalDataSource;

  TestRepositoryImpl(this._testRemoteDataSource, this._testLocalDataSource);

  @override
  Future<AppObjectResultModel<TestModel>> getTest() async {
    try {
      final remoteData = await _testRemoteDataSource.getTest();
      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<TestModel>> getLocalTest() async {
    try {
      final localData = await _testLocalDataSource.getTest();
      return localData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<EmptyModel>> saveLocalTest({
    required String message,
  }) async {
    try {
      final localData = await _testLocalDataSource.saveTest(message: message);
      return localData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
