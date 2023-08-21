part of '../base_use_case.dart';

abstract class VerifyRegistrationUseCase
    extends BaseUseCase<VerifyRegistrationParam, EmptyModel> {}

class VerifyRegistrationUseCaseImpl extends VerifyRegistrationUseCase {
  final AuthRepository _authRepository;

  VerifyRegistrationUseCaseImpl(this._authRepository);

  @override
  Future<AppObjectResultModel<EmptyModel>> executeObject({
    VerifyRegistrationParam? param,
  }) =>
      _authRepository.verifyRegistration(
        body: param!.toJson(),
      );
}
