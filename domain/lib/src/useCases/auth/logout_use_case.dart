part of '../base_use_case.dart';

abstract class LogoutUseCase extends BaseUseCase<BaseParam, EmptyModel> {}

class LogoutUseCaseImpl extends LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCaseImpl(this._authRepository);

  @override
  Future<AppObjectResultModel<EmptyModel>> executeObject({
    BaseParam? param,
  }) =>
      _authRepository.logOut();
}
