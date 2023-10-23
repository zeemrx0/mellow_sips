part of 'base_repository.dart';

abstract class AuthRepository {
  Future<AppObjectResultModel<TokensModel>> login({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultModel<EmptyModel>> register({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultModel<EmptyModel>> verifyRegistration({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultModel<EmptyModel>> requestOTP({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultModel<EmptyModel>> logOut();

  Future<AppObjectResultModel<TokensModel>> getTokens();
}
