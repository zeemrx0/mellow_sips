part of '../base_use_case.dart';

abstract class GetTokensUseCase extends BaseUseCase<BaseParam, TokensModel> {}

class GetTokensUseCaseImpl extends GetTokensUseCase {
  final AuthRepository _authRepository;

  GetTokensUseCaseImpl(this._authRepository);

  @override
  Future<AppObjectResultModel<TokensModel>> executeObject({
    BaseParam? param,
  }) =>
      _authRepository.getTokens();
}
