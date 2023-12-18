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
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _remoteDataSource.login(
        params: params,
      );

      if (remoteData.netData != null) {
        _localDataSource.saveTokens(
          accessToken: remoteData.netData!.accessToken.split(' ').last,
          refreshToken: remoteData.netData!.refreshToken,
        );
      }

      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<EmptyModel>> register({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _remoteDataSource.register(
        params: params,
      );

      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<EmptyModel>> verifyRegistration({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _remoteDataSource.verifyRegistration(
        params: params,
      );

      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<EmptyModel>> requestOTP(
      {required Map<String, dynamic> params}) async {
    try {
      final remoteData = await _remoteDataSource.requestOTP(
        params: params,
      );

      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<EmptyModel>> logOut() async {
    try {
      await _localDataSource.clearTokens();

      return AppObjectResultModel<EmptyModel>(
        netData: EmptyModel(),
      );
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<TokensModel>> getTokens() async {
    try {
      final localData = await _localDataSource.getTokens();

      return localData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<EmptyModel>> changePassword({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _remoteDataSource.changePassword(
        params: params,
      );

      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
