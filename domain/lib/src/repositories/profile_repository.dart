part of './base_repository.dart';

abstract class ProfileRepository {
  Future<AppObjectResultModel<ProfileModel>> getProfile();
}
