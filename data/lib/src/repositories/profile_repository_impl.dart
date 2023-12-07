import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:domain/domain.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepositoryImpl(
    this._profileRemoteDataSource,
  );

  @override
  Future<AppObjectResultModel<ProfileModel>> getProfile() async {
    try {
      final remoteData = await _profileRemoteDataSource.getProfile();

      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
