import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mywo/core/core.dart';

abstract class HttpInterface {
  Future<R?> get<T extends IBaseModel<T>, R>(
    String url, {
    String? jsonKey,
    required T parseModel,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool removeCache = false,
  });

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
  });

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
  });

  Future<R?> delete<R, T extends IBaseModel<T>>(
    String url, {
    String? jsonKey,
    dynamic data,
    required T parseModel,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });

  Future<R?> httpPatch<R, T extends IBaseModel<T>>(
    String url, {
    String? jsonKey,
    dynamic data,
    required T parseModel,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });

  Future<File> downloadFile(String url, String path);

  Future<File?> downloadFileBase64(
    String url,
    String path, {
    bool isPOST = false,
  });
}
