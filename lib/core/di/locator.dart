import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:get_it/get_it.dart';
import 'package:{{PROJECT_NAME}}/core/log/logger.dart';
import 'package:{{PROJECT_NAME}}/repository/user/user_repository.dart';
import 'package:{{PROJECT_NAME}}/services/navigator_service/navigation_service.dart';
import 'package:{{PROJECT_NAME}}/services/services.dart';
// import 'package:realm/realm.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator
    ..registerLazySingleton(Logger.new)
    ..registerLazySingleton(StreamService.new);

  final _cache = await _initializeCacheService();
  // final _realm = await _initialRealm();

  locator
    ..registerLazySingleton(() => _cache)
    // ..registerLazySingleton(() => _realm)
    ..registerLazySingleton(Dio.new)
    ..registerLazySingleton(UserRepository.new)
    ..registerLazySingleton(HttpService.new)
    ..registerLazySingleton(AuthenticationService.new)
    ..registerLazySingleton(EventBus.new)
    ..registerLazySingleton(NavigationService.new);
}

Future<CacheService> _initializeCacheService() async {
  final storage = CacheService();
  await storage.init();
  return storage;
}

// Realm _initialRealm() {
//   final config = Configuration.local([
//     Horoscope.schema,
//     HoroscopeContent.schema,
//   ]);
//   return Realm(config);
// }
