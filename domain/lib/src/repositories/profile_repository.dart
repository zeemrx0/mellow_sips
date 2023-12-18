part of './base_repository.dart';

abstract class ProfileRepository {
  Future<AppObjectResultModel<ProfileModel>> getProfile();

  Future<AppObjectResultModel<EmptyModel>> updateProfile({
    required Map<String, dynamic> params,
  });
}
