part of './base_local_data_source.dart';

abstract class DocumentLocalDataSource {
  Future<AppObjectResultRaw<EmptyRaw>> saveDocument({
    required String key,
    required Map<String, dynamic> value,
  });

  Future<AppObjectResultRaw<DocumentRaw>> getDocument(String key);
}

class DocumentLocalDataSourceImpl extends DocumentLocalDataSource {
  final AppSharedPref _pref;

  DocumentLocalDataSourceImpl(this._pref);

  @override
  Future<AppObjectResultRaw<DocumentRaw>> getDocument(String key) async {
    final cacheData =  _pref.getString(key, '');


    if (cacheData == '') {
      return AppObjectResultRaw(
        netData: null,
      );
    }

    final cacheJsonData = json.decode(cacheData);

    return AppObjectResultRaw(
      netData: DocumentRaw.fromJson(cacheJsonData),
    );
  }

  @override
  Future<AppObjectResultRaw<EmptyRaw>> saveDocument({
    required String key,
    required Map<String, dynamic> value,
  }) async {
    await _pref.setString(
      key,
      json.encode(value),
    );

    return AppObjectResultRaw(
      netData: EmptyRaw(),
    );
  }
}
