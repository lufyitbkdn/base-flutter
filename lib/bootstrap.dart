import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  static final log = Logger('AppBlocObserver');

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log.info('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log.severe('onError(${bloc.runtimeType})', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}

void setupLogging() {
  Logger.root.onRecord.listen((record) {
    if (record.loggerName == 'GoRouter') {
      return;
    }

    final String message;
    final messageHeader =
        '${record.level.name}: ${record.loggerName} : ${record.time}: ${record.message}';
    if (record.level < Level.SEVERE) {
      message = messageHeader;
    } else {
      message = '$messageHeader : ${record.error} : ${record.stackTrace}';
    }

    if (kDebugMode) {
      print(message);
    }
  });
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await runZonedGuarded(
    () async {
      // await SentryFlutter.init(
      //   (options) {
      //     options
      //       ..dsn =
      //       ..tracesSampleRate = 1.0
      //       ..beforeSend = ((SentryEvent event, {Hint? hint}) => kDebugMode ? null : event)
      //       ..addIntegration(LoggingIntegration());
      //   },
      // );

      setupLogging();

      WidgetsFlutterBinding.ensureInitialized();

      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );

      Bloc.observer = const AppBlocObserver();

      await Firebase.initializeApp();
      // Add cross-flavor configuration here
      LicenseRegistry.addLicense(() async* {
        final license =
            await rootBundle.loadString('assets/fonts/Poppins/OFL.txt');
        yield LicenseEntryWithLineBreaks(['Poppins'], license);
      });

      runApp(await builder());
    },
    (error, stackTrace) async {
      AppBlocObserver.log.severe('Error', error, stackTrace);
      // await Sentry.captureException(error, stackTrace: stackTrace);
    },
    zoneSpecification: ZoneSpecification(
      print: (self, parent, zone, line) {
        // Suppressing prints in release builds
        if (kDebugMode) {
          parent.print(zone, line);
        }
      },
    ),
  );
}
