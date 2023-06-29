
import 'package:{{PROJECT_NAME}}/core/di/locator.dart';
import 'package:{{PROJECT_NAME}}/services/services.dart';
import 'package:{{PROJECT_NAME}}/services/stream/stream.dart';

class BaseException implements Exception {
  BaseException({
    this.message,
    this.statusCode,
    this.exceptionStreamService,
  }) {
    _exceptionStreamService =
        exceptionStreamService ?? locator<StreamService>().exceptionStream;
  }

  String? message;
  int? statusCode;
  late final StreamSubject<Exception>? exceptionStreamService;
  late final StreamSubject<Exception> _exceptionStreamService;
}

class ConnectivityException extends BaseException {
  ConnectivityException()
      : super(message: 'Please check your internet connection') {
    _exceptionStreamService.updateSubject(this);
  }
}

class AuthException extends BaseException {
  AuthException({
    String? message,
    int? statusCode,
  }) : super(
    message: message ?? 'Token Expired. Please log in again.',
    statusCode: statusCode ?? 401,
  ) {
    _exceptionStreamService.updateSubject(this);
  }
}

class NotificationException extends BaseException {
  NotificationException({super.message = 'Notification Error'}) {
    _exceptionStreamService.updateSubject(this);
  }
}

