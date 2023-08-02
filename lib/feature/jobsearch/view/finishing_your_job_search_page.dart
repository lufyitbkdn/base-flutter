import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/assets.dart';
import 'package:my_wo/feature/jobsearch/jobsearch.dart';

class FinishingYourJobSearchPage extends StatelessWidget {
  const FinishingYourJobSearchPage({super.key});

  static const String routeName = 'jobsearch.finishingyoursearch';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Finishing Your Job Search',
        svgIconPath: Assets.assets_images_ico_jobsearch_svg,
        iconColor: WoColors.green,
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_interview_svg,
                color: WoColors.green,
                title: 'Interviews',
                onPressed: () => context.goNamed(InterviewsPage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_work_svg,
                color: WoColors.green,
                title: "You've Landed a Role",
                onPressed: () =>
                    context.goNamed(YouHaveLandedARolePage.routeName),
              ),
              const SizedBox(height: Spacing.xl_48),
            ],
          ),
        ],
      ),
    );
  }
}
