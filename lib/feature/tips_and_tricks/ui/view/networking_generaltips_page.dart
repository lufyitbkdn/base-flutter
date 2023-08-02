import 'package:flutter/material.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/assets.dart';
import 'package:my_wo/feature/favourites/favorites.dart';

class NetworkingGeneralTipsPage extends StatefulWidget {
  const NetworkingGeneralTipsPage({super.key});

  static const String routeName = 'tipsandtricks.networking.generaltips';

  @override
  State<NetworkingGeneralTipsPage> createState() =>
      _NetworkingGeneralTipsPageState();
}

class _NetworkingGeneralTipsPageState extends State<NetworkingGeneralTipsPage>
    with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: NetworkingGeneralTipsPage.routeName,
    title: 'Networking - General Tips',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'General Tips',
        svgIconPath: Assets.assets_images_ico_lightbulb_svg,
        iconColor: WoColors.orange,
        appBarActions: [favouriteAction],
        children: const [
          PaddedContent(
            children: [
              SizedBox(height: Spacing.s_16),
              BulletList(
                bullets: [
                  'Complete your profile with professional relevant information targeted to the roles you are seeking.',
                  'Headline: indicate your brand and your talents and specialities - your professional identity.',
                  'Summary: Use aspects of your profile from your CV and your branding statement.',
                  'Specialties/Keywords: Optimise your profile with keywords, phrases, skills, and areas of specialisation.',
                  'Experience: List most recent, relevant roles (short descriptions, accountabilities).',
                  'Use a photo: A professional-looking headshot. And smile, please.',
                  'Connect to your referees (valuable advocates!) and make sure they are briefed and prepared.',
                  'Check your Privacy and Account Settings - know who you are sharing your LinkedIn profile and updates with!',
                  'Add to your connections (recruiters, hiring managers, peers, (ex-)colleagues) regularly and keep in touch with existing connections.',
                  'Keep personal information to a minimum on your profile (stay professional).',
                  "Check your “Home” page: comment, congratulate, 'like', be active and visible.",
                  "Ask for selected recommendations (but don't over-crowd your profile) – two recommendations are adequate when you are starting out your job search.",
                  'Selectively endorse your connections for what you think they do well.',
                  'Join Groups, subscribe to Newsletters and follow Companies that you are interested in.',
                  'Personalise each LinkedIn invitation; tell the person why you want to connect.',
                  'Connect with individuals right after a meeting to ensure people remember you.',
                  'Go to each company page on your target list and click the "I’m interested" button.',
                  'Comment on company page posts – engage with the brand, they are more likely to reach out to you for a job opening.',
                ],
              ),
              SizedBox(height: Spacing.l_32),
            ],
          ),
        ],
      ),
    );
  }
}
