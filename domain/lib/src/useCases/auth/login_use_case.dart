part of '../base_use_case.dart';

abstract class LoginUseCase extends BaseUseCase<LoginParam, TokensModel> {}

class LoginUseCaseImpl extends LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCaseImpl(this._authRepository);

  @override
  Future<AppObjectResultModel<TokensModel>> executeObject({
    LoginParam? param,
  }) =>
      _authRepository.login(
        body: param!.toJson(),
      );
}
