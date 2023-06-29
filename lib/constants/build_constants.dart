import 'package:mywo/core/enum/app_flavours.dart';

class BuildConstants {
  static AppFlavours _environment = AppFlavours.development;

  // ignore: use_setters_to_change_properties
  static void updateEnvironment({required AppFlavours currentEnvironment}) =>
      _environment = currentEnvironment;

  static AppFlavours get getCurrentEnvironment => _environment;

  static String get getCurrentEnvironmentString =>
      _environment.toString().split('.').last;

  static bool isProductionBuild =
      BuildConstants.getCurrentEnvironment == AppFlavours.production;

  static String get getBaseURl =>
      getCurrentEnvironment == AppFlavours.production
          ? ''
          : '';

  static String sentryDSN = '';
  static double sentryTracesRate =
      getCurrentEnvironment == AppFlavours.development ? 0.1 : 1.0;

  static Duration get getConnectTimeout => Duration(
        milliseconds:
            getCurrentEnvironment == AppFlavours.development ? 5000 : 50000,
      );

  static Duration get getResponseTimeOut => Duration(
        milliseconds:
            getCurrentEnvironment == AppFlavours.development ? 30000 : 300000,
      );

  static String get authAPI => 'api/auth';

  static String get profileAPI => 'api/profile';
}
