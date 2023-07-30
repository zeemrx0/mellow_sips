part of 'base_repository.dart';

abstract class TestRepository {
  Future<AppObjectResultModel<TestModel>> getTest();
}
