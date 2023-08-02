import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/assets.dart';
import 'package:my_wo/feature/tips_and_tricks/tips_and_tricks.dart';

class TipsAndTricksPage extends StatelessWidget {
  const TipsAndTricksPage({super.key});

  static const String routeName = 'tipsandtricks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SectionSliverAppBar.svg(
            title: 'Tips and Tricks',
            iconBackgroundColor: WoColors.orange,
            svgPath: Assets.assets_images_ico_tips_svg,
            backgroundImageAssetPath:
                Assets.assets_images_tips_and_tricks_header_png,
            expandedSystemOverlayStyle: SystemUiOverlayStyle.light,
            collapsedOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.m_25),
            sliver: SliverList.list(
              children: [
                const SizedBox(height: 5),
                // compensating for the app bar cut radius of 20
                WoCard(
                  title: 'CV',
                  primaryButtonTitle: 'Read More',
                  onPrimaryButtonPressed: () =>
                      context.goNamed(CVPage.routeName),
                  child: WoText.bodyMedium(
                      "CV tips, as well as things to DO and DON'T when creating your CV.",),
                ),
                const SizedBox(height: Spacing.s_16),
                WoCard(
                  title: 'Cover Letter',
                  primaryButtonTitle: 'Read More',
                  onPrimaryButtonPressed: () =>
                      context.goNamed(CoverLetterPage.routeName),
                  child: WoText.bodyMedium(
                      "Cover Letter tips, as well as things to DO and DON'T when creating your cover letter.",),
                ),
                const SizedBox(height: Spacing.s_16),
                WoCard(
                  title: 'Networking',
                  primaryButtonTitle: 'Read More',
                  onPrimaryButtonPressed: () =>
                      context.goNamed(NetworkingPage.routeName),
                  child: WoText.bodyMedium(
                      "Tips to use when networking, as well as things to DO and DON'T while building your profesional network.",),
                ),
                const SizedBox(height: Spacing.s_16),
                WoCard(
                  title: 'Interviews',
                  primaryButtonTitle: 'Read More',
                  onPrimaryButtonPressed: () =>
                      context.goNamed(InterviewPage.routeName),
                  child: WoText.bodyMedium(
                      'Helpful interview tips and checklists, as well as things some questions to practice before your interviews.',),
                ),
                const SizedBox(height: Spacing.xl_48),
              ].annotateWithSystemUiOverlayStyle(SystemUiOverlayStyle.dark),
            ),
          ),
        ],
      ),
    );
  }
}
