part of './base_use_case.dart';

abstract class SaveLocalTestUseCase
    extends BaseUseCase<TestParam, EmptyModel> {}

class SaveLocalTestUseCaseImpl extends SaveLocalTestUseCase {
  final TestRepository _testRepository;

  SaveLocalTestUseCaseImpl(this._testRepository);

  @override
  Future<AppObjectResultModel<EmptyModel>> executeObject({TestParam? param}) =>
      _testRepository.saveLocalTest(message: param!.message ?? '');
}
