import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/tips_and_tricks/tips_and_tricks.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CVPage extends StatelessWidget {
  const CVPage({super.key});

  static const String routeName = 'tipsandtricks.cv';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'CV',
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
                onPressed: () => context.goNamed(CVGeneralTipsPage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_do_svg,
                color: CivColors.orange,
                title: 'Things to Do',
                onPressed: () => context.goNamed(CVThingsToDoPage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_avoid_svg,
                color: CivColors.orange,
                title: 'Things to Avoid',
                onPressed: () => context.goNamed(CVThingsToAvoidPage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_beatthesystem_svg,
                color: CivColors.orange,
                title: 'Beating the System',
                onPressed: () => context.goNamed(BeatingTheSystemPage.routeName),
              ),
              const SizedBox(height: Spacing.xl_48),
            ],
          ),
        ],
      ),
    );
  }
}
