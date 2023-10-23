part of '../base_use_case.dart';

abstract class RegisterUseCase extends BaseUseCase<RegisterParam, EmptyModel> {}

class RegisterUseCaseImpl extends RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCaseImpl(this._authRepository);

  @override
  Future<AppObjectResultModel<EmptyModel>> executeObject({
    RegisterParam? param,
  }) =>
      _authRepository.register(
        params: param!.toJson(),
      );
}
