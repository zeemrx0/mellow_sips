part of '../base_use_case.dart';

abstract class UpdateProfileUseCase
    extends BaseUseCase<UpdateProfileParam, EmptyModel> {}

class UpdateProfileUseCaseImpl extends UpdateProfileUseCase {
  final ProfileRepository _profileRepository;

  UpdateProfileUseCaseImpl(this._profileRepository);

  @override
  Future<AppObjectResultModel<EmptyModel>> executeObject({
    UpdateProfileParam? param,
  }) =>
      _profileRepository.updateProfile(
        params: param!.toJson(),
      );
}
