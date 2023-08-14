part of 'base_repository.dart';

abstract class AuthRepository {
  Future<AppObjectResultModel<TokensModel>> login({required Map<String, dynamic> body});

  Future<AppObjectResultModel<TokensModel>> register({required Map<String, dynamic> body});
}
