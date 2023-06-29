import 'package:flutter/foundation.dart';
import 'package:{{PROJECT_NAME}}/core/di/locator.dart';

final _logger = locator<Logger>();
void printDebug(dynamic content) => _logger.printDebug(content);
void printError(
  dynamic content, {
  Object? exception,
  StackTrace? stack,
  Map<dynamic, dynamic>? data,
}) =>
    _logger.printError(
      content,
      data: data,
      exception: exception,
      stack: stack,
    );
void printInfo(dynamic content) => _logger.printInfo(content);
void printPatch(dynamic content) => _logger.printPatch(content);
void printPut(dynamic content) => _logger.printPut(content);
void printDelete(dynamic content) => _logger.printDelete(content);
void printRequest(dynamic content) => _logger.printRequest(content);
void printResponse(dynamic content) => _logger.printResponse(content);
void printWarning(dynamic content) => _logger.printWarning(content);

class Logger {
  void printDebug(dynamic content) {
    if (kDebugMode) {
      print('🐛 $content');
    }
  }

  void printError(
    dynamic content, {
    Object? exception,
    StackTrace? stack,
    Map<dynamic, dynamic>? data,
  }) {
    if (kDebugMode) {
      print('❌ $content');
    }
  }

  void printInfo(dynamic content) {
    if (kDebugMode) {
      print('ℹ️ $content');
    }
  }

  void printPatch(dynamic content) {
    if (kDebugMode) {
      print('🌼 $content');
    }
  }

  void printPut(dynamic content) {
    if (kDebugMode) {
      print('🌸 $content');
    }
  }

  void printDelete(dynamic content) {
    if (kDebugMode) {
      print('🔥 $content');
    }
  }

  void printRequest(dynamic content) {
    if (kDebugMode) {
      print('🤝 $content');
    }
  }

  void printResponse(dynamic content) {
    if (kDebugMode) {
      print('🙌 $content');
    }
  }

  void printWarning(dynamic content) {
    if (kDebugMode) {
      print('❗ $content');
    }
  }
}
