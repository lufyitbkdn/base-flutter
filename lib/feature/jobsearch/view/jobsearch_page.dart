import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/assets.dart';
import 'package:my_wo/feature/jobsearch/jobsearch.dart';

class JobSearchPage extends StatelessWidget {
  const JobSearchPage({super.key});

  static const String routeName = 'jobsearch';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SectionSliverAppBar.svg(
            title: 'Job Search',
            iconBackgroundColor: WoColors.green,
            svgPath: Assets.assets_images_ico_jobsearch_svg,
            backgroundImageAssetPath:
                Assets.assets_images_job_search_header_png,
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
                  title: 'Before You Begin',
                  primaryButtonTitle: 'Read More',
                  onPrimaryButtonPressed: () =>
                      context.goNamed(BeforeYouBeginPage.routeName),
                  child: WoText.bodyMedium(
                      'Have a quick read of our things to remember and focus on before you begin your job search.',),
                ),
                const SizedBox(height: Spacing.s_16),
                WoCard(
                  title: 'Preparing for the Search',
                  primaryButtonTitle: 'Read More',
                  onPrimaryButtonPressed: () =>
                      context.goNamed(PreparingForTheSearchPage.routeName),
                  child: WoText.bodyMedium(
                      'Start progressing through the steps you should follow when preparing for your job search.',),
                ),
                const SizedBox(height: Spacing.s_16),
                WoCard(
                  title: 'Starting Your Job Search',
                  primaryButtonTitle: 'Read More',
                  onPrimaryButtonPressed: () =>
                      context.goNamed(StartingYourJobSearchPage.routeName),
                  child: WoText.bodyMedium(
                      "Now that you're prepared, start reading and following our key steps for starting your job search.",),
                ),
                const SizedBox(height: Spacing.s_16),
                WoCard(
                  title: 'Finishing Your Job Search',
                  primaryButtonTitle: 'Read More',
                  onPrimaryButtonPressed: () =>
                      context.goNamed(FinishingYourJobSearchPage.routeName),
                  child: WoText.bodyMedium(
                      "You've been searching for jobs and have landed some interviews. Have a read of our steps to secure this role.",),
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
