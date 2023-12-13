import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageManager {
  // factory StorageManager() {
  //   return _instance;
  // }
  // StorageManager._internal();

  // static final StorageManager _instance = StorageManager._internal();

  final AndroidOptions _aOptions = const AndroidOptions(
    encryptedSharedPreferences: true,
  );
  final IOSOptions _iOptions = const IOSOptions();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> write(String key, String value) {
    return _storage.write(
      key: key,
      value: value,
      iOptions: _iOptions,
      aOptions: _aOptions,
    );
  }

  Future<String?> read(String key) {
    return _storage.read(
      key: key,
      iOptions: _iOptions,
      aOptions: _aOptions,
    );
  }

  Future<void> delete(String key) async {
    await _storage.delete(
      key: key,
      aOptions: _aOptions,
      iOptions: _iOptions,
    );
  }
}
