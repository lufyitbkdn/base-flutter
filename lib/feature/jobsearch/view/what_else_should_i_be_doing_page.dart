import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/feature/favourites/favorites.dart';
import 'package:flutter/material.dart';

class WhatElseShouldIBeDoingPage extends StatefulWidget {
  const WhatElseShouldIBeDoingPage({super.key});

  static const String routeName = 'jobsearch.whatelseshouldibedoing';

  @override
  State<WhatElseShouldIBeDoingPage> createState() =>
      _WhatElseShouldIBeDoingPageState();
}

class _WhatElseShouldIBeDoingPageState extends State<WhatElseShouldIBeDoingPage>
    with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: WhatElseShouldIBeDoingPage.routeName,
    title: 'What Else Should I be Doing?',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'What Else Should I be Doing?',
        svgIconPath: Assets.assets_images_ico_checklist_boxed_svg,
        iconColor: CivColors.green,
        appBarActions: [favouriteAction],
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              Image.asset(
                Assets.assets_images_gr_job_5_jpg,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  'Consider all search methods to work out which methods suit you and your search best. There are several ways to go about your job search including:'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  "Talking to people to generate introductions to hiring managers remains the single most effective job search method. It's simple and works for virtually anyone who makes the effort to use it in any of its many variations. This job search method is recommended over all others, and it's where the majority of successful job seekers tell us that they've allocated the most time.",
                  'The more traditional methods of finding job leads such as advertisements, job postings and recruiters - these methods are also effective.',
                ],
              ),
              const SizedBox(height: Spacing.m_25),
              Image.asset(
                Assets.assets_images_gr_search_8_jpg,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: Spacing.m_25),
              CivText.titleMedium('Recruiters and Job Boards'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  'Here are some tips for using recruiters and job boards.'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'Avoid sending CVs to every recruiter you can find - be selective.',
                  'Consider carefully before you “upload” your template CV to a job board.',
                  'Reach out to recruiters who are specialists in your field of expertise, profession or industry.',
                  'Track and record every application you make so you can follow up on every application.',
                  'Follow up with the hiring manager or recruiter with a telephone call within a few business days of submitting your application.',
                  'Ask friends or colleagues which recruiters or specialist job boards they use for hiring or job seeking - ask for a referral.',
                  'Ask professional contacts which recruiters you should target, and which recruiters they use for their own recruiting needs.',
                  'Research profiles of hiring managers or recruiters who have viewed your profile on LinkedIn - make contact with them to start some dialogue.'
                ],
              ),
              const SizedBox(height: Spacing.xl_48),
            ],
          ),
        ],
      ),
    );
  }
}
