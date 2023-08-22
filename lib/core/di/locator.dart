import 'dart:io';

import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:get_it/get_it.dart';
import 'package:mywo/constants/constants.dart';
import 'package:mywo/core/core.dart';
import 'package:mywo/repository/user/user_repository.dart';
import 'package:mywo/services/api/rest_client.dart';
import 'package:mywo/services/navigator_service/navigation_service.dart';
import 'package:mywo/services/services.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:realm/realm.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator
    ..registerLazySingleton(Logger.new)
    ..registerLazySingleton(StreamService.new);

  final cache = await _initializeCacheService();
  final dio = Dio();
  configureDio(dio);
  final client = RestClient(dio, baseUrl: BuildConstants.getBaseURl);
  // final _realm = await _initialRealm();

  locator
    ..registerLazySingleton(() => cache)
    // ..registerLazySingleton(() => _realm)
    ..registerLazySingleton(() => dio)
    ..registerLazySingleton(() => client)
    ..registerLazySingleton(UserRepository.new)
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

void configureDio(Dio dio) {
  dio.options = _baseOptions();
  dio.interceptors.add(
    _interceptorWrapper(),
  );
  if (!BuildConstants.isProductionBuild) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
      ),
    );
  }
}

BaseOptions _baseOptions() {
  return BaseOptions(
    connectTimeout: BuildConstants.getConnectTimeout,
    receiveTimeout: BuildConstants.getResponseTimeOut,
  );
}

InterceptorsWrapper _interceptorWrapper() {
  return InterceptorsWrapper(
    onRequest: (RequestOptions options, handler) async {
      final token =
          locator<CacheService>().store.getString(StorageConstants.accessToken);
      if (token != null &&
          token.isNotEmpty &&
          !options.headers.containsKey('Authorization')) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      options.headers['accept'] = '*/*';
      options.headers['Content-Type'] = 'application/json';
      return handler.next(options);
    },
    onError: (error, errorHandler) async {
      if (error.response?.statusCode == 403 ||
          error.response?.statusCode == 401) {
        try {
          final data = await locator<RefreshTokenService>()
              .refreshToken(error.requestOptions);
          return errorHandler.resolve(data);
        } on DioException catch (exception) {
          errorHandler.next(exception);
        } catch (e) {
          errorHandler.next(error);
        }
      } else {
        errorHandler.next(error);
      }
    },
  );
}

BaseException handleError(DioException e) {
  if (e.error is SocketException) {
    throw ConnectivityException();
  }
  if (e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.sendTimeout ||
      e.type == DioExceptionType.badCertificate) {
    throw BaseException(message: e.error.toString());
  }
  if (e.response?.data is Map) {
    final errorData = e.response?.data as Map<String, dynamic>;
    if (e.response?.statusCode == null || e.response?.statusCode == 0) {
      throw ConnectivityException();
    } else if (e.response?.statusCode == 401) {
      throw AuthException(
        statusCode: e.response?.statusCode,
        message: errorData['message'] != null
            ? errorData['message'].toString()
            : e.error.toString(),
      );
    } else {
      throw BaseException(
        statusCode: e.response?.statusCode,
        message: errorData['message'] != null
            ? errorData['message'].toString()
            : e.error.toString(),
      );
    }
  }
  throw BaseException(message: 'Something went wrong');
}
