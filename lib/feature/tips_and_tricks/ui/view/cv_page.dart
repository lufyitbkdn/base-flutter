import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/assets.dart';
import 'package:my_wo/feature/tips_and_tricks/tips_and_tricks.dart';

class CVPage extends StatelessWidget {
  const CVPage({super.key});

  static const String routeName = 'tipsandtricks.cv';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'CV',
        svgIconPath: Assets.assets_images_ico_tips_svg,
        iconColor: WoColors.orange,
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_lightbulb_svg,
                color: WoColors.orange,
                title: 'General Tips',
                onPressed: () => context.goNamed(CVGeneralTipsPage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_do_svg,
                color: WoColors.orange,
                title: 'Things to Do',
                onPressed: () => context.goNamed(CVThingsToDoPage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_avoid_svg,
                color: WoColors.orange,
                title: 'Things to Avoid',
                onPressed: () => context.goNamed(CVThingsToAvoidPage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_beatthesystem_svg,
                color: WoColors.orange,
                title: 'Beating the System',
                onPressed: () =>
                    context.goNamed(BeatingTheSystemPage.routeName),
              ),
              const SizedBox(height: Spacing.xl_48),
            ],
          ),
        ],
      ),
    );
  }
}
