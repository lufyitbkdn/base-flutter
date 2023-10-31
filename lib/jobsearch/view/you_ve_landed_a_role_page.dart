import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/favourites/favorites.dart';
import 'package:flutter/material.dart';

class YouHaveLandedARolePage extends StatefulWidget {
  const YouHaveLandedARolePage({super.key});

  static const String routeName = 'jobsearch.youhavevelandedarole';

  @override
  State<YouHaveLandedARolePage> createState() => _YouHaveLandedARolePageState();
}

class _YouHaveLandedARolePageState extends State<YouHaveLandedARolePage> with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: YouHaveLandedARolePage.routeName,
    title: "You've Landed a Role",
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: "You've Landed a Role",
        svgIconPath: Assets.assets_images_ico_work_svg,
        iconColor: CivColors.green,
        appBarActions: [favouriteAction],
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              Image.asset(
                Assets.assets_images_gr_interview_2_jpg,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium("Congratulations! You've landed! Your job search has ended. But your career is just beginning a new chapter! Some things to consider..."),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  "You've worked hard at building and maintaining your network so don't lose it. Develop a strategy to maintain your network via LinkedIn or through some other mechanism. You should keep your network close and active and commit to some ongoing disciplines to do this.",
                  'Define responsibilities, expectations and issues, develop a list with your new boss, and identify issues you feel you might face early in your transition.',
                  "Develop an 'entry strategy', and work on how you'll get more of the critical information you need about the organisation and the people.",
                  'Close out your search, and notify recruiters and contacts about your good news.',
                ],
              ),
              const SizedBox(height: Spacing.m_25),
              Image.asset(
                Assets.assets_images_gr_men_1_jpg,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium('Transition Planning:'),
              const SizedBox(height: Spacing.s_16),
              CivCard(
                title: 'Reading the Culture',
                child: CivText.bodyMedium("Understand 'this is the way we do things around here' Identify the cultural norms and styles of the company, your manager, peers and direct reports, and understand the differences in your style and the company's culture."),
              ),
              const SizedBox(height: Spacing.s_16),
              CivCard(
                title: 'Building Alliances and Influencing Others',
                child: CivText.bodyMedium("You're new. Your appointment creates “change”. Be mindful of managing change. Build relationships and understand what is important to individuals or teams in the company."),
              ),
              const SizedBox(height: Spacing.s_16),
              CivCard(
                title: 'Determine and Align Expectations',
                child: CivText.bodyMedium('Understand what business priorities are expected, and establish agreement on what success will look like and how it will be measured.'),
              ),
              const SizedBox(height: Spacing.s_16),
              CivCard(
                title: 'Focus on Early Impact Projects',
                child: CivText.bodyMedium('Identify early-impact projects where you can show your value quickly, but ensure you have a balance between early-impact projects and long-term focuses.'),
              ),
              const SizedBox(height: Spacing.s_16),
              CivCard(
                title: 'Your Professional Environment and Objective',
                child: CivText.bodyMedium('Stay aware of what is happening in the market, refine where you want your career to go and occasionally embark on a healthy self-assessment.'),
              ),
              const SizedBox(height: Spacing.s_16),
              CivCard(
                title: 'Always have a Communications Strategy',
                child: CivText.bodyMedium('Acknowledge the importance of communicating your value, successes, and strengths and maintain your credibility in the market, and keep your CV up to date!'),
              ),
              const SizedBox(height: Spacing.xl_48),
            ],
          ),
        ],
      ),
    );
  }
}
