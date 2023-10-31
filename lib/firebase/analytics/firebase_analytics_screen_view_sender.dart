import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

typedef PlatformErrorCallback = void Function(PlatformException error);

class FirebaseAnalyticsScreenViewSender {
  FirebaseAnalyticsScreenViewSender({
    required this.firebaseAnalytics,
    this.onError,
  });

  static final log = Logger('FirebaseAnalyticsScreenViewSender');

  final FirebaseAnalytics firebaseAnalytics;
  final PlatformErrorCallback? onError;

  void sendScreenView(String? pageName) {
    if (pageName != null) {
      firebaseAnalytics.setCurrentScreen(screenName: pageName).catchError(
        (Object error) {
          final onError = this.onError;
          if (onError == null) {
            log.severe(error);
          } else {
            onError(error as PlatformException);
          }
        },
        test: (Object error) => error is PlatformException,
      );
    }
  }
}

class NoOpFirebaseAnalyticsScreenViewSender extends FirebaseAnalyticsScreenViewSender {
  NoOpFirebaseAnalyticsScreenViewSender({required super.firebaseAnalytics});

  @override
  void sendScreenView(String? pageName) {
    // no-op
  }
}
