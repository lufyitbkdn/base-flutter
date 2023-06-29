import 'package:{{PROJECT_NAME}}/constants/constants.dart';
import 'package:{{PROJECT_NAME}}/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ICache {
  Future<void> init();

  late SharedPreferences store;
}

class CacheService implements ICache {
  factory CacheService() {
    return _instance;
  }

  CacheService._internal();

  static final CacheService _instance = CacheService._internal();

  @override
  late SharedPreferences store;
  late Future<SharedPreferences> storeFuture;

  @override
  Future<void> init() async {
    store = await (storeFuture = SharedPreferences.getInstance());
    store.getKeys();
  }

  Future<void> clearUserData() async {
    await store.remove(StorageConstants.accessToken);
    await store.remove(StorageConstants.refreshToken);
  }
}

/// Store or retrieve a stored value.
///
/// Usage:
/// ```
/// store('someKey', 'stored value');
/// final String storedValue = store('someKey'); // storedValue == 'stored value'
/// ```
Future<dynamic> store<T>(String key, {dynamic value}) async {
  final store = await locator<CacheService>().storeFuture;
  if (value == null) return store.get(key);
  switch (value.runtimeType) {
    case String:
      return store.setString(key, value as String);
    case int:
      return store.setInt(key, value as int);
    case bool:
      return store.setBool(key, value as bool);
    default:
      throw ArgumentError('value must be of type String, int, or bool');
  }
}
