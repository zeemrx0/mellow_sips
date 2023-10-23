part of 'base_local_data_source.dart';

abstract class AuthLocalDataSource {
  Future<AppObjectResultRaw<TokensRaw>> getTokens();

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  });

  Future<void> clearTokens();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final AppSharedPref _pref;

  AuthLocalDataSourceImpl(this._pref);

  @override
  Future<void> clearTokens() async {
    await _pref.deleteValue(AppPrefKey.accessToken);
    await _pref.deleteValue(AppPrefKey.refreshToken);
  }

  @override
  Future<AppObjectResultRaw<TokensRaw>> getTokens() {
    final accessToken = _pref.getString(AppPrefKey.accessToken, '');
    final refreshToken = _pref.getString(AppPrefKey.refreshToken, '');

    return Future.value(
      AppObjectResultRaw(
        netData: TokensRaw(
          accessToken: accessToken,
          refreshToken: refreshToken,
        ),
      ),
    );
  }

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _pref.setString(AppPrefKey.accessToken, accessToken);
    await _pref.setString(AppPrefKey.refreshToken, refreshToken);
  }
}
