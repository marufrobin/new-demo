abstract class AppStoreContract {
  Future<Map<String, String>?> getAll();

  Future<String?> get({required String key});

  Future<AppStoreContract> set({required String key, required String value});

  Future<void> destroy({required String key});

  Future<void> destroyAll();

  Future<bool> exists({required String key});
}
