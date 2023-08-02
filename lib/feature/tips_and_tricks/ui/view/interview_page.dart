import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/assets.dart';
import 'package:my_wo/feature/tips_and_tricks/tips_and_tricks.dart';

class InterviewPage extends StatelessWidget {
  const InterviewPage({super.key});

  static const String routeName = 'tipsandtricks.interview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Interviews',
        svgIconPath: Assets.assets_images_ico_tips_svg,
        iconColor: WoColors.orange,
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_before_svg,
                color: WoColors.orange,
                title: 'Before',
                onPressed: () => context.goNamed(InterviewBeforePage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_during_svg,
                color: WoColors.orange,
                title: 'During',
                onPressed: () => context.goNamed(InterviewDuringPage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_after_svg,
                color: WoColors.orange,
                title: 'After',
                onPressed: () => context.goNamed(InterviewAfterPage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_chat_svg,
                color: WoColors.orange,
                title: 'Practice Questions',
                onPressed: () =>
                    context.goNamed(InterviewPracticeQuestionsPage.routeName),
              ),
              const SizedBox(height: Spacing.xl_48),
            ],
          ),
        ],
      ),
    );
  }
}
