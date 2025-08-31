import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rider/src/core/services/storage/storage.contract.dart';

class AppSecureStorage implements AppStoreContract {
  final _storage = const FlutterSecureStorage();

  @override
  Future<void> destroy({required String key}) async {
    await _storage.delete(key: key);
  }

  @override
  Future<void> destroyAll() async => await _storage.deleteAll();

  @override
  Future<bool> exists({required String key}) async {
    return await _storage.containsKey(key: key);
  }

  @override
  Future<String?> get({required String key}) async {
    return await _storage.read(key: key);
  }

  @override
  Future<Map<String, String>?> getAll() async => await _storage.readAll();

  @override
  Future<AppStoreContract> set({
    required String key,
    required String value,
  }) async {
    await _storage.write(key: key, value: value);
    return this;
  }
}
