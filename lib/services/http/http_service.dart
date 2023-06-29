import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:{{PROJECT_NAME}}/constants/constants.dart';
import 'package:{{PROJECT_NAME}}/core/core.dart';
import 'package:{{PROJECT_NAME}}/services/services.dart';

class HttpService extends HttpInterface {
  HttpService({
    Dio? dio,
    CacheService? cacheService,
    RefreshTokenService? refreshTokenService,
  }) {
    _initCacheService(cacheService);
    _initHttpClient(dio);
    _initRefreshTokenService(refreshTokenService);
  }

  void _initHttpClient(Dio? dio) {
    _httpClient = dio ?? locator<Dio>();
    _httpClient.options = _baseOptions();
    _httpClient.interceptors.add(
      _interceptorWrapper(),
    );
    if (!BuildConstants.isProductionBuild) {
      _httpClient.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
        ),
      );
    }
  }

  void _initRefreshTokenService(
    RefreshTokenService? refreshTokenService,
  ) =>
      _refreshTokenService =
          refreshTokenService ?? RefreshTokenService(httpClient: _httpClient);

  CacheService _initCacheService(CacheService? cacheService) =>
      _cacheService = cacheService ?? locator<CacheService>();

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
            _cacheService.store.getString(StorageConstants.accessToken);
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
            final data = await _refreshToken(error.requestOptions);
            return errorHandler.resolve(data);
          } on DioError catch (exception) {
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

  late final Dio _httpClient;
  late final CacheService _cacheService;
  late final RefreshTokenService _refreshTokenService;

  @override
  Future<R?> get<T extends IBaseModel<T>, R>(
    String url, {
    String? jsonKey,
    required T parseModel,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool removeCache = false,
  }) async {
    printDebug('[GET] Request : $url');
    try {
      final response = await _httpClient.get<dynamic>(
        url,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return handleResponse<R, T>(response, parseModel, jsonKey);
    } on DioError catch (e) {
      handleError(e);
    }
    return null;
  }

  @override
  Future<R?> httpPatch<R, T extends IBaseModel<T>>(
    String url, {
    String? jsonKey,
    dynamic data,
    required T parseModel,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _httpClient.delete<dynamic>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return handleResponse<R, T>(response, parseModel, jsonKey);
    } on DioError catch (e) {
      handleError(e);
    }
    return null;
  }

  @override
  Future<R?> delete<R, T extends IBaseModel<T>>(
    String url, {
    String? jsonKey,
    dynamic data,
    required T parseModel,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _httpClient.delete<dynamic>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return handleResponse<R, T>(response, parseModel, jsonKey);
    } on DioError catch (e) {
      handleError(e);
    }
    return null;
  }

  @override
  Future<R?> post<R, T extends IBaseModel<T>>(
    String postUrl, {
    String? jsonKey,
    dynamic data,
    required T parseModel,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _httpClient.post<dynamic>(
        postUrl,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return handleResponse<R, T>(response, parseModel, jsonKey);
    } on DioError catch (e) {
      handleError(e);
    }
    return null;
  }

  @override
  Future<R?> put<R, T extends IBaseModel<T>>(
    String postUrl, {
    String? jsonKey,
    dynamic data,
    required T parseModel,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _httpClient.put<dynamic>(
        postUrl,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return handleResponse<R, T>(response, parseModel, jsonKey);
    } on DioError catch (e) {
      handleError(e);
    }
    return null;
  }

  @override
  Future<File> downloadFile(String url, String path) async {
    try {
      final response = await _httpClient.get<List<int>>(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return (status ?? 0) < 500;
          },
        ),
      );
      final file = File(path);
      final raf = file.openSync(mode: FileMode.write)
        ..writeFromSync(response.data!);
      await raf.close();
    } on DioError catch (e) {
      printError('Error download $url');
      handleError(e);
    }
    return File(path);
  }

  @override
  Future<File?> downloadFileBase64(
    String url,
    String path, {
    bool isPOST = false,
  }) async {
    try {
      final response = isPOST
          ? await _httpClient.post<List<int>>(
              url,
              options: Options(
                responseType: ResponseType.bytes,
                followRedirects: false,
                validateStatus: (status) {
                  return (status ?? 0) < 500;
                },
              ),
            )
          : await _httpClient.get<List<int>>(
              url,
              options: Options(
                responseType: ResponseType.bytes,
                followRedirects: false,
                validateStatus: (status) {
                  return (status ?? 0) < 500;
                },
              ),
            );
      if (response.data!.isEmpty) {
        return null;
      }
      final bytes = base64Decode(utf8.decode(response.data!));
      final file = File(path);
      await file.create(exclusive: true);
      final raf = await file.open(mode: FileMode.write);
      await raf.writeFrom(bytes);
      await raf.close();
    } on DioError catch (e) {
      printError('Error download $url');
      handleError(e);
    }
    return File(path);
  }

  R? handleResponse<R, T extends IBaseModel<T>>(
    Response<dynamic> response,
    T model,
    String? jsonKey,
  ) {
    dynamic responseBody = response.data;
    if (jsonKey != null && responseBody is Map) {
      responseBody = responseBody[jsonKey];
    }
    return _parseBody<R, T>(responseBody, model);
  }

  R? _parseBody<R, T extends IBaseModel<T>>(dynamic responseBody, T model) {
    try {
      if (responseBody is List) {
        return responseBody
            .map((dynamic data) {
              return model.fromJson(data as Map<String, dynamic>);
            })
            .cast<T>()
            .toList() as R;
      } else if (responseBody is Map<String, dynamic>) {
        return model.fromJson(responseBody) as R;
      }
    } catch (e) {
      printError('$model: $e');
    }
    return null;
  }

  Future<Response<dynamic>> _refreshToken(
    RequestOptions requestOptions,
  ) =>
      _refreshTokenService.refreshToken(requestOptions);
}

BaseException handleError(DioError e) {
  if (e.error is SocketException) {
    throw ConnectivityException();
  }
  if (e.type == DioErrorType.connectionTimeout ||
      e.type == DioErrorType.receiveTimeout ||
      e.type == DioErrorType.sendTimeout ||
      e.type == DioErrorType.badCertificate) {
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
