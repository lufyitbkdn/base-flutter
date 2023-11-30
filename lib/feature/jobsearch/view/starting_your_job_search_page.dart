import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/feature/jobsearch/jobsearch.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartingYourJobSearchPage extends StatelessWidget {
  const StartingYourJobSearchPage({super.key});

  static const String routeName = 'jobsearch.startingyourjobsearch';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Starting Your Job Search',
        svgIconPath: Assets.assets_images_ico_jobsearch_svg,
        iconColor: CivColors.green,
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_brain_svg,
                color: CivColors.green,
                title: 'Knowledge is Power',
                onPressed: () =>
                    context.goNamed(KnowledgeIsPowerPage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_people_svg,
                color: CivColors.green,
                title: "Are You the World's Best-Kept Secret?",
                onPressed: () =>
                    context.goNamed(AreYouTheWorldsSecretPage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_phone_svg,
                color: CivColors.green,
                title: 'Talking to the Right People',
                onPressed: () =>
                    context.goNamed(TalkingToTheRightPeoplePage.routeName),
              ),
              const SizedBox(height: Spacing.s_16),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_checklist_boxed_svg,
                color: CivColors.green,
                title: 'What Else Should I be Doing?',
                onPressed: () =>
                    context.goNamed(WhatElseShouldIBeDoingPage.routeName),
              ),
              const SizedBox(height: Spacing.xl_48),
            ],
          ),
        ],
      ),
    );
  }
}
