part of 'base_use_case.dart';

abstract class GetTestUseCase extends BaseUseCase<BaseParam, TestModel> {}

class GetTestUseCaseImpl extends GetTestUseCase {
  final TestRepository _testRepository;

  GetTestUseCaseImpl(this._testRepository);

  @override
  Future<AppObjectResultModel<TestModel>> executeObject({BaseParam? param}) =>
      _testRepository.getTest();
}
