import 'package:data/src/sources/local/base_local_data_source.dart';
import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:domain/domain.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  @override
  Future<AppObjectResultModel<TokensModel>> login({
    required Map<String, dynamic> body,
  }) async {
    try {
      final remoteData = await _remoteDataSource.login(
        body: body,
      );

      if (remoteData.netData != null) {
        _localDataSource.saveTokens(
          accessToken: remoteData.netData!.accessToken,
          refreshToken: remoteData.netData!.refreshToken,
        );
      }

      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
