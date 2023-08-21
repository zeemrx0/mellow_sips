part of 'base_repository.dart';

abstract class TestRepository {
  Future<AppObjectResultModel<TestModel>> getTest();

  Future<AppObjectResultModel<TestModel>> getLocalTest();

  Future<AppObjectResultModel<EmptyModel>> saveLocalTest({
    required String message,
  });
}
