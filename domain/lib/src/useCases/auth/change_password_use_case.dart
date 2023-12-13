part of '../base_use_case.dart';

abstract class ChangePasswordUseCase
    extends BaseUseCase<ChangePasswordParam, EmptyModel> {}

class ChangePasswordUseCaseImpl extends ChangePasswordUseCase {
  final AuthRepository _authRepository;

  ChangePasswordUseCaseImpl(this._authRepository);

  @override
  Future<AppObjectResultModel<EmptyModel>> executeObject({
    ChangePasswordParam? param,
  }) =>
      _authRepository.changePassword(
        params: param!.toJson(),
      );
}
