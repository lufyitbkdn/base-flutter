import 'package:flutter/material.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/assets.dart';
import 'package:my_wo/feature/favourites/favorites.dart';

class NetworkingThingsToDoPage extends StatefulWidget {
  const NetworkingThingsToDoPage({super.key});

  static const String routeName = 'tipsandtricks.networking.thingstodo';

  @override
  State<NetworkingThingsToDoPage> createState() =>
      _NetworkingThingsToDoPageState();
}

class _NetworkingThingsToDoPageState extends State<NetworkingThingsToDoPage>
    with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: NetworkingThingsToDoPage.routeName,
    title: 'Networking - Things to Do',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Things to Do',
        svgIconPath: Assets.assets_images_ico_do_svg,
        iconColor: WoColors.orange,
        appBarActions: [favouriteAction],
        children: const [
          PaddedContent(
            children: [
              SizedBox(height: Spacing.s_16),
              BulletList(
                bullets: [
                  'Be active and visible in your networking.',
                  "Complete your profile in a considered way and don't rush.",
                  'Check your profile, and proofread it after editing.',
                  'Make sure your Skills on your profile are in line with what you want to do now and in the future (and not just a gathering of previous (historical) skills / expertise)',
                  'Always personalise your connection requests.',
                  'Put a professional picture on your profile (not a selfie!).',
                  'Upload a background banner image to your profile – something that is "you" (but nothing too distracting and "wild"!).',
                  'Selectively endorse your connections for recognised skills and expertise.',
                  'Keep a professional style and tone in networking, and keep personal information to a minimum.',
                  "Stay in touch with people, spend five minutes every day to stay in touch with people you've previously connected with.",
                  'Track and monitor your notifications – congratulate people in their new roles, comment and engage in LinkedIn posts and conversations. Be noticed by your activity.',
                  'Try to add new connections each week.',
                  'Share profiles of connections with others to make introductions.',
                  "Be generous and don't just \"take\" information -  \"give\" information and communication as well.",
                  "Track jobs on LinkedIn and refer jobs to others if you believe it's worthwhile.",
                  'Introduce your connections to other connections.',
                  'Track who has been looking at your profile from your Home page – reach out to them to engage in conversations.',
                  'Respond promptly to messages and reach outs, try not to make people wait.',
                  'Ensure your CV, your profile and your spoken strategies are in sync.',
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
