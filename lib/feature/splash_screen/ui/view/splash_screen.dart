import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:my_wo/app/app.dart' hide AppBar;
import 'package:my_wo/assets.dart';
import 'package:my_wo/feature/home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WoColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Lottie.asset(
          Assets.assets_animations_splash_screen_json,
          controller: controller,
          onLoaded: (composition) {
            controller
              ..duration = composition.duration
              ..forward().whenComplete(() {
                context.goNamed(HomePage.routeName);
              });
          },
        ),
      ),
    );
  }
}
