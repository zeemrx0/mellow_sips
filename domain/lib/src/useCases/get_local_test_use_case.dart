part of './base_use_case.dart';

abstract class GetLocalTestUseCase extends BaseUseCase<BaseParam, TestModel> {}

class GetLocalTestUseCaseImpl extends GetLocalTestUseCase {
  final TestRepository _testRepository;

  GetLocalTestUseCaseImpl(this._testRepository);

  @override
  Future<AppObjectResultModel<TestModel>> executeObject({BaseParam? param}) =>
      _testRepository.getLocalTest();
}
