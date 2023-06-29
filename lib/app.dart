import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:mywo/core/core.dart';
import 'package:mywo/screens/login/login_screen.dart';
import 'package:mywo/services/navigator_service/navigation_service.dart';
import 'package:mywo/services/services.dart';
import 'package:mywo/theme/text/text.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return FlutterSizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
          textTheme: TextTheme(
            bodyLarge: bodyTextStyle(),
            bodySmall: bodySmallTextStyle(),
          ),
        ),
        debugShowCheckedModeBanner: _displayDebugBanner(context),
        home: const LoginScreenRoute(),
      ),
    );
  }

  @override
  void dispose() {
    locator<StreamService>().disposeStream();
    locator<AuthenticationService>().disposeStream();
    super.dispose();
  }
}

bool _displayDebugBanner(BuildContext context) =>
    FlavoursConfiguration.of(context)?.appflavour == AppFlavours.development;

class FlavoursConfiguration extends InheritedWidget {
  const FlavoursConfiguration({
    super.key,
    required super.child,
    required this.appflavour,
  });

  final AppFlavours appflavour;

  static FlavoursConfiguration? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<FlavoursConfiguration>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}