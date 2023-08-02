import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/assets.dart';
import 'package:my_wo/feature/jobsearch/jobsearch.dart';

class PreparingForTheSearchPage extends StatelessWidget {
  const PreparingForTheSearchPage({super.key});

  static const String routeName = 'jobsearch.preparingforthesearch';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Preparing for the Search',
        svgIconPath: Assets.assets_images_ico_jobsearch_svg,
        iconColor: WoColors.green,
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_job_landscape_svg,
                color: WoColors.green,
                title: 'Understanding the Job Landscape',
                onPressed: () =>
                    context.goNamed(UnderstandingTheJobLandscapePage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_checklist_svg,
                color: WoColors.green,
                title: 'Your Professional Objectives',
                onPressed: () =>
                    context.goNamed(YourProfessionalObjectivesPage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_person_svg,
                color: WoColors.green,
                title: 'Your CV and Profile',
                onPressed: () =>
                    context.goNamed(YourCVAndProfilePage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_first_svg,
                color: WoColors.green,
                title: 'Getting in First',
                onPressed: () => context.goNamed(GettingInFirstPage.routeName),
              ),
              const SizedBox(height: Spacing.xl_48),
            ],
          ),
        ],
      ),
    );
  }
}
