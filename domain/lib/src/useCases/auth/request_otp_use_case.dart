part of '../base_use_case.dart';

abstract class RequestOtpUseCase
    extends BaseUseCase<RequestOtpParam, EmptyModel> {}

class RequestOtpUseCaseImpl extends RequestOtpUseCase {
  final AuthRepository _authRepository;

  RequestOtpUseCaseImpl(this._authRepository);

  @override
  Future<AppObjectResultModel<EmptyModel>> executeObject({
    RequestOtpParam? param,
  }) =>
      _authRepository.requestOTP(
        params: param!.toJson(),
      );
}
