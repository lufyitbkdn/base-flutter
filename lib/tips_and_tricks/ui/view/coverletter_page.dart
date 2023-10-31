import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/tips_and_tricks/tips_and_tricks.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoverLetterPage extends StatelessWidget {
  const CoverLetterPage({super.key});

  static const String routeName = 'tipsandtricks.coverletter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Cover Letter',
        svgIconPath: Assets.assets_images_ico_tips_svg,
        iconColor: CivColors.orange,
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_lightbulb_svg,
                color: CivColors.orange,
                title: 'General Tips',
                onPressed: () => context.goNamed(CoverLetterGeneralTipsPage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_do_svg,
                color: CivColors.orange,
                title: 'Things to Do',
                onPressed: () => context.goNamed(CoverLetterThingsToDoPage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_avoid_svg,
                color: CivColors.orange,
                title: 'Things to Avoid',
                onPressed: () => context.goNamed(CoverLetterThingsToAvoidPage.routeName),
              ),
              const SizedBox(height: Spacing.xl_48),
            ],
          ),
        ],
      ),
    );
  }
}
