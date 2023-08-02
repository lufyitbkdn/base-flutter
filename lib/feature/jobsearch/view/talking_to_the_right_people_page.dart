import 'package:flutter/material.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/assets.dart';
import 'package:my_wo/feature/favourites/favorites.dart';

class TalkingToTheRightPeoplePage extends StatefulWidget {
  const TalkingToTheRightPeoplePage({super.key});

  static const String routeName = 'jobsearch.talkingtotherightpeople';

  @override
  State<TalkingToTheRightPeoplePage> createState() =>
      _TalkingToTheRightPeoplePageState();
}

class _TalkingToTheRightPeoplePageState
    extends State<TalkingToTheRightPeoplePage> with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: TalkingToTheRightPeoplePage.routeName,
    title: 'Talking to the Right People',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Talking to the Right People',
        svgIconPath: Assets.assets_images_ico_phone_svg,
        iconColor: WoColors.green,
        appBarActions: [favouriteAction],
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              Image.asset(
                Assets.assets_images_gr_search_2_jpg,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium(
                  "Being in the right place at the right time isn't an accident - it's the result of good planning. It takes only one person to decide to hire you, but it takes many conversations with hiring managers to uncover the right opportunity. Talking with people who make hiring decisions is the single most important activity in a job search. And talking with hiring managers in your chosen target organisations, before there is an opening, raises your odds immensely and shortens your search time.",),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium(
                  "You need to know who the hiring managers are and work your network to get introductions or connections to these individuals. If your target list research is thorough, you know who they are. Your networking will help you reach insiders within your target organisations - peers and referrals - and with some further networking, you can ultimately be introduced to the hiring managers. Sometimes it takes time - but it's worth it.",),
              const SizedBox(height: Spacing.s_16),
              WoText.titleMedium('Networking - Hiring Managers'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'Ask yourself: Do I know any hiring managers at my target companies?',
                  'Consider how you can meet peers in your target organisations.',
                  'Locate peers, colleagues, ex-colleagues and connections in your network who are connected to people in your target companies and ask them to share your profile or introduce you to the people within your target companies.',
                  'Who might give you information about a hiring manager or who might introduce you to one?',
                  'Keep leveraging LinkedIn - get to know more information about people and the companies on your target list.',
                  'Gather marketplace information about your target companies to have a meaningful conversation with a hiring manager.',
                  'Be thoroughly prepared, and ensure that you can demonstrate how you can address their needs.',
                  'Determine and review what you will say when you talk with the hiring manager in each of your target organisations.',
                  'Make sure you have a list of questions to ask in interviews that will enable you to gather the information you need.',
                ],
              ),
              const SizedBox(height: Spacing.m_25),
              WoText.bodyMedium(
                  'Even without a specific opening, these meetings need to be treated like an interview - sooner or later they will have a need and you want to be the prime candidate considered. Or, you want them to feel so confident of the value you can bring, that they create a role for you.',),
              const SizedBox(height: Spacing.xl_48),
            ],
          ),
        ],
      ),
    );
  }
}
