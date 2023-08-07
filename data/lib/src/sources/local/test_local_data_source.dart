import 'package:data/src/local/app_shared_pref.dart';
import 'package:data/src/raws/base_raw.dart';
import 'package:data/src/sources/keys/app_keys.dart';

abstract class TestLocalDataSource {
  Future<AppObjectResultRaw<EmptyRaw>> saveTest({required String message});

  Future<AppObjectResultRaw<TestRaw>> getTest();
}

class TestLocalDataSourceImpl extends TestLocalDataSource {
  final AppSharedPref _pref;

  TestLocalDataSourceImpl(this._pref);

  @override
  Future<AppObjectResultRaw<TestRaw>> getTest() {
    final message =
        _pref.getString(AppPrefKey.testMessage, 'INITIAL LOCAL MESSAGE');
    return Future.value(AppObjectResultRaw(
      netData: TestRaw(message: message),
    ));
  }

  @override
  Future<AppObjectResultRaw<EmptyRaw>> saveTest(
      {required String message}) async {
    await _pref.setString(AppPrefKey.testMessage, message);
    return Future.value(
      AppObjectResultRaw(
        netData: EmptyRaw(),
      ),
    );
  }
}
