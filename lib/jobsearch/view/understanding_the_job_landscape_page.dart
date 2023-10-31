import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/favourites/favorites.dart';
import 'package:flutter/material.dart';

class UnderstandingTheJobLandscapePage extends StatefulWidget {
  const UnderstandingTheJobLandscapePage({super.key});

  static const String routeName = 'jobsearch.understandingthejoblandscape';

  @override
  State<UnderstandingTheJobLandscapePage> createState() => _UnderstandingTheJobLandscapePageState();
}

class _UnderstandingTheJobLandscapePageState extends State<UnderstandingTheJobLandscapePage> with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: UnderstandingTheJobLandscapePage.routeName,
    title: 'Understanding the Job Landscape',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Understanding the Job Landscape',
        svgIconPath: Assets.assets_images_ico_job_landscape_svg,
        iconColor: CivColors.green,
        appBarActions: [favouriteAction],
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              Image.asset(
                Assets.assets_images_gr_search_9_jpg,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium("You've found your CV and updated it, but now you need to spend some time preparing and assessing a few things. Think about this - would you dive into a pond without knowing how deep the water was? If you're stepping out into the job market, it's best to know what's out there! What's happening? What is the market looking for? You are a “product” about to launch into that market - you need to research what the market needs and expects."),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium("It's not just about your CV. In job search, you need to understand the overall environment in which you'll be conducting your search. You need to be up-to-date on what's happening in your target profession or industry. Keeping in touch with the market needs to be an integrated, ongoing process for you, both in your job search and in your career."),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium("So what should you do? Well, let's start with what NOT to do. Don't start 'panic applying', scattering your CV in a very random and unstructured way."),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium('Here are some initial things to think about:'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'Take a moment to think about sharpening your tools and your focus.',
                  'Set up some job alerts and saved searches on vacancies to see what kind of jobs in your prefered role are being advertised, what kind of skills are required, what they are paying, and what recruiters may have the right kind of roles for you.',
                  'How is your LinkedIn profile looking? What about Twitter and Facebook?',
                  'What other kinds of research can you do on issues, trends and developments in your chosen profession?',
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
