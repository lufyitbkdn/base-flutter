import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/tips_and_tricks/tips_and_tricks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

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
            iconBackgroundColor: CivColors.orange,
            svgPath: Assets.assets_images_ico_tips_svg,
            backgroundImageAssetPath: Assets.assets_images_tips_and_tricks_header_png,
            expandedSystemOverlayStyle: SystemUiOverlayStyle.light,
            collapsedOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.m_25),
            sliver: SliverList.list(
              children: [
                const SizedBox(height: 5), // compensating for the app bar cut radius of 20
                CivCard(
                  title: 'CV',
                  primaryButtonTitle: 'Read More',
                  onPrimaryButtonPressed: () => context.goNamed(CVPage.routeName),
                  child: CivText.bodyMedium("CV tips, as well as things to DO and DON'T when creating your CV."),
                ),
                const SizedBox(height: Spacing.s_16),
                CivCard(
                  title: 'Cover Letter',
                  primaryButtonTitle: 'Read More',
                  onPrimaryButtonPressed: () => context.goNamed(CoverLetterPage.routeName),
                  child: CivText.bodyMedium("Cover Letter tips, as well as things to DO and DON'T when creating your cover letter."),
                ),
                const SizedBox(height: Spacing.s_16),
                CivCard(
                  title: 'Networking',
                  primaryButtonTitle: 'Read More',
                  onPrimaryButtonPressed: () => context.goNamed(NetworkingPage.routeName),
                  child: CivText.bodyMedium("Tips to use when networking, as well as things to DO and DON'T while building your profesional network."),
                ),
                const SizedBox(height: Spacing.s_16),
                CivCard(
                  title: 'Interviews',
                  primaryButtonTitle: 'Read More',
                  onPrimaryButtonPressed: () => context.goNamed(InterviewPage.routeName),
                  child: CivText.bodyMedium('Helpful interview tips and checklists, as well as things some questions to practice before your interviews.'),
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
