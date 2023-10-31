import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageDataSource {
  LocalStorageDataSource({
    required this.secureStorage,
    required this.sharedPreferences,
  });

  @visibleForTesting
  final FlutterSecureStorage secureStorage;

  @visibleForTesting
  final SharedPreferences sharedPreferences;

  /// Must be called before the local storage can be used.
  Future<void> init() async {
    final isFirstRun = sharedPreferences.getBool(StorageKey.isFirstRun.name) ?? true;

    // iOS Keychain keeps data stored by the app even if the user removed the app.
    // This can cause undesired behavior where the user gets old data, even after
    // uninstalling/reinstalling the app.
    if (isFirstRun) {
      await secureStorage.deleteAll();
      await sharedPreferences.setBool(StorageKey.isFirstRun.name, false);
    }

    // the storage version can be used for data migration in the future
    final version = await read(StorageKey.storageVersion);
    if (version == null) {
      await write(key: StorageKey.storageVersion, value: '1');
    }
  }

  Future<String?> read(StorageKey key) async => secureStorage.read(key: key.name);

  Future<Map<StorageKey, String>> readAll() async {
    final data = await secureStorage.readAll();
    return data.map((key, value) => MapEntry(StorageKey.values.byName(key), value));
  }

  Future<void> write({required StorageKey key, required String value}) async => secureStorage.write(key: key.name, value: value);

  Future<void> delete(StorageKey key) async => secureStorage.delete(key: key.name);

  Future<void> deleteAll() async => secureStorage.deleteAll();
}

enum StorageKey {
  isFirstRun,
  storageVersion,
  hasSeenWelcome,
  skillsQuizResults,
  rankedHardSkill,
  checklist,
  favourites,
}
