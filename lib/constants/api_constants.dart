import 'package:mywo/constants/constants.dart';

class EndPoints {
  static String get loginPath =>
      '${BuildConstants.getBaseURl}/${BuildConstants.authAPI}/login';

  static String get resetPINPath =>
      '${BuildConstants.getBaseURl}/${BuildConstants.authAPI}/reset-pin';

  static String get profilePath =>
      '${BuildConstants.getBaseURl}/${BuildConstants.profileAPI}';

  static String get refreshTokenPath =>
      '${BuildConstants.getBaseURl}/${BuildConstants.authAPI}/token';
}
