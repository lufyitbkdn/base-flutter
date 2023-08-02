import 'package:flutter/material.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/assets.dart';
import 'package:my_wo/feature/favourites/favorites.dart';

class NetworkingThingsToAvoidPage extends StatefulWidget {
  const NetworkingThingsToAvoidPage({super.key});

  static const String routeName = 'tipsandtricks.networking.thingstoavoid';

  @override
  State<NetworkingThingsToAvoidPage> createState() =>
      _NetworkingThingsToAvoidPageState();
}

class _NetworkingThingsToAvoidPageState
    extends State<NetworkingThingsToAvoidPage> with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: NetworkingThingsToAvoidPage.routeName,
    title: 'Networking - Things to Avoid',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Things to Avoid',
        svgIconPath: Assets.assets_images_ico_avoid_svg,
        iconColor: WoColors.orange,
        appBarActions: [favouriteAction],
        children: const [
          PaddedContent(
            children: [
              SizedBox(height: Spacing.s_16),
              BulletList(
                bullets: [
                  "Don't use LinkedIn like it's Facebook, TikTok or Instagram. Keep things professional.",
                  "Don't put too much personal information in your profile.",
                  "Don't include an employment history indicating: “Currently Unemployed” or “To be Determined”",
                  "Don't make your summary too long, viewers want information quickly so keep it short.",
                  "Don't include every responsibility and achievement in your profile. A short accountability statement or summary is easier to digest.",
                  "Don't ask all your connections “Do you know of a job for me” (it's wearing…).",
                  "Don't ask people for recommendations if they don't know the quality of your work.",
                  "Don't publish “conversations” on your home page/tab.",
                  "Don't attach your CV to your profile, instead wait until people ask for it.",
                  "Don't be negative when discussing issues within Groups.",
                  "Don't “over post” or “spam” articles or information, be selective with what you post.",
                  "Don't send group messages unless it's highly specific, make sure you avoid spamming people.",
                  "Don't ask new connections you haven't met to endorse you. They don't know the quality of your work.",
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
