import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomePageDialog extends StatelessWidget {
  const HomePageDialog({super.key});

  static const String routeName = 'homepage.welcomedialog';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Spacing.xs_8)),
      child: Container(
        padding: const EdgeInsets.all(Spacing.s_16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: Spacing.s_16),
              SvgPicture.asset(
                Assets.assets_images_ico_logo_svg,
                height: 60,
              ),
              const SizedBox(height: Spacing.s_16),
              CivText.titleMedium('Welcome to CivStart'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  'Your partner in navigating the transition from Defence to the civilian workforce.'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  "Discover your skills through our quiz, access job-hunting tips, and tap into a range of resources for support.  We're with you, step by step, as you navigate this new chapter.  Your next career begins here."),
              const SizedBox(height: Spacing.s_16),
              CivButton.primaryOutlined(
                title: 'OK',
                onPressed: () => context.pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
