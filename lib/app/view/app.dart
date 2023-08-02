import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/firebase/firebase.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final firebaseAnalyticsScreenViewSender =
      getIt<FirebaseAnalyticsScreenViewSender>();

  /// Precaches the images and SVGs. This can be an expensive operation and should ideally be done
  /// at each screen, before it loads. We are doing it here since it makes the app development easier
  /// and we don't have many images.
  Future<void> precacheImages() async {
    final assetManifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final imageCachingFutures = assetManifest //
        .listAssets()
        .where(
          (assetPath) =>
              assetPath.endsWith('.jpg') || assetPath.endsWith('.png'),
        )
        .map((assetPath) async {
      final imageProvider = AssetImage(assetPath);
      await precacheImage(imageProvider, context);
      imageProvider
          // ignore: use_build_context_synchronously
          .resolve(createLocalImageConfiguration(context))
          .addListener(
        ImageStreamListener((imageInfo, synchronousCall) {
          // An empty listener to keep this image alive.
        }),
      );
    });

    final svgCachingFutures = assetManifest //
        .listAssets()
        .where((assetPath) => assetPath.endsWith('.svg'))
        .map((svgAsset) async {
      final loader = SvgAssetLoader(svgAsset);
      await svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    });

    await Future.wait([...imageCachingFutures, ...svgCachingFutures]);
  }

  void sendScreenView() {
    firebaseAnalyticsScreenViewSender
        .sendScreenView(router.routeInformationProvider.value.uri.path);
  }

  @override
  void initState() {
    super.initState();
    router.routerDelegate.addListener(sendScreenView);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImages();
  }

  @override
  void dispose() {
    router.routerDelegate.removeListener(sendScreenView);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          primary: Color(0xFFF17E63),
          onPrimary: Colors.white,
          secondary: Color(0xFF404040),
          onSecondary: Color(0xFFEFECE9),
          surface: Colors.white,
          onSurface: Color(0xFF181818),
          background: Color(0xFFEFECE9),
          onBackground: Color(0xFF181818),
          brightness: Brightness.light,
          error: Colors.red,
          onError: Colors.white,
          outline: Color(0xFFF17E63),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFEFECE9),
        ),
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          indicatorColor: Color(0xFFF17E63),
        ),
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Color(0xFF1F1F1F),
            fontSize: 30,
            fontWeight: FontWeight.w700,
            height: 1.13,
            letterSpacing: -0.6,
          ),
          titleMedium: TextStyle(
            color: Color(0xFF1F1F1F),
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1.44,
          ),
          bodyMedium: TextStyle(
            color: Color(0xFF1F1F1F),
            fontSize: 15,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.30,
          ),
          labelMedium: TextStyle(
            color: Color(0xFF5A5A5A),
            fontSize: 12,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.25,
            height: 1.67,
          ),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            // This is needed to prevent InkWell animations to freeze and return animating
            // when we navigate back. See https://github.com/flutter/flutter/issues/119897
            TargetPlatform.android:
                ZoomPageTransitionsBuilder(allowSnapshotting: false),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      routerConfig: router,
    );
  }
}
