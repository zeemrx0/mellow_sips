part of '../base_use_case.dart';

abstract class GetProfileUseCase extends BaseUseCase<BaseParam, ProfileModel> {}

class GetProfileUseCaseImpl extends GetProfileUseCase {
  final ProfileRepository _documentRepository;

  GetProfileUseCaseImpl(this._documentRepository);

  @override
  Future<AppObjectResultModel<ProfileModel>> executeObject(
          {BaseParam? param}) =>
      _documentRepository.getProfile();
}
