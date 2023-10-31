import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/favourites/favorites.dart';
import 'package:flutter/material.dart';

class GettingInFirstPage extends StatefulWidget {
  const GettingInFirstPage({super.key});

  static const String routeName = 'jobsearch.gettinginfirst';

  @override
  State<GettingInFirstPage> createState() => _GettingInFirstPageState();
}

class _GettingInFirstPageState extends State<GettingInFirstPage> with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: GettingInFirstPage.routeName,
    title: 'Getting in First',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Getting in First',
        svgIconPath: Assets.assets_images_ico_first_svg,
        iconColor: CivColors.green,
        appBarActions: [favouriteAction],
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              Image.asset(
                Assets.assets_images_gr_search_12_jpg,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium("The job market is like an iceberg: the area above the water line is the advertised market, but the largest section is not visible, under the water line, hidden from view. The hidden - unadvertised - job market is there, waiting for you to tap into it. Not all jobs are advertised. It's a fact. If your job search is focussing on advertised roles only then you are limiting yourself. Significantly."),
              const SizedBox(height: Spacing.s_16),
              const BulletList(bullets: [
                "The advertised job market is a necessary element of your job search, but it's not the only avenue of job search. If looking at listed jobs is the only way you are searching for roles, then it may take you quite a while to land a role. Consider a more proactive approach, remembering the importance of leads, word-of-mouth referrals, introductions, information and overall 'conversations' about your value in the market.",
                'Create a Marketing Plan, with a list of organisations that you will research, focus on and pursue; this will open you up to a very positive and effective way of spreading the message about yourself and your talents.'],
              ),
              const SizedBox(height: Spacing.m_25),
              CivText.bodyMedium("You need to be proactive to approach the hidden job market. Have you started putting together a list of organisations that you'd like to work for? This Target List helps you focus your job search activities, and a Marketing Plan assists in clarifying your value to each organisation on your Target List. They work together well to help keep you on track."),
              const SizedBox(height: Spacing.s_16),
              Image.asset(
                Assets.assets_images_gr_search_5_jpg,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium('Your Target List and Marketing Plan'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(bullets: [
                "Think about your “Target Market” - organisations you want to work for; companies who are the right size, in the right industry sector, the right location - and the right culture. These four elements describe your 'Target Market'. A clear definition of your target market focuses your search on specific organisations which can shorten your search by weeks or even months.",
                'Ask yourself “What organisations are most likely to be interested in someone like me?” and “What organisations am I most interested in joining?” Start to generate a list of organisations within your Target Market - this is your Target List - the organisations you plan to research and pursue. Your Target List becomes the topic of conversation and activity for you, and it quickly becomes an anchor to your conversations and meetings.',
                'Create a personal Marketing Plan outlining your assets. A solid Marketing Plan gives focus and clarity around your value in the market and integrates four key areas:',
                'Your Professional Objective, Your Branding Statement, Your Target Market, and Your Target List (the list of organisations you will pursue!)',
                'Start your research and networking!'],
              ),
              const SizedBox(height: Spacing.xl_48),
            ],
          ),
        ],
      ),
    );
  }
}
