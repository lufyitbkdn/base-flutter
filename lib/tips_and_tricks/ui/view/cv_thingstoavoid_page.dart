import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/favourites/favorites.dart';
import 'package:flutter/material.dart';

class CVThingsToAvoidPage extends StatefulWidget {
  const CVThingsToAvoidPage({super.key});

  static const String routeName = 'tipsandtricks.cv.thingstoavoid';

  @override
  State<CVThingsToAvoidPage> createState() => _CVThingsToAvoidPageState();
}

class _CVThingsToAvoidPageState extends State<CVThingsToAvoidPage> with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: CVThingsToAvoidPage.routeName,
    title: 'CV - Things to Avoid',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Things to Avoid',
        svgIconPath: Assets.assets_images_ico_avoid_svg,
        iconColor: CivColors.orange,
        appBarActions: [favouriteAction],
        children: const [
          PaddedContent(
            children: [
              SizedBox(height: Spacing.s_16),
              BulletList(
                bullets: [
                  'Don\'t include anything that will "distract" the reader - focus on specifics.',
                  "Don't over-state, over-emphasise, exaggerate or misrepresent any information.",
                  "Don't leave gaps in your employment histories.",
                  "Don't use “I” statements or include extraneous or personal information (age, marital status, number of children etc.).",
                  "Don't use non-industry abbreviations expecting the reader to understand them.",
                  "Don't tell stories, use concise bullet points commencing with a verb.",
                  "Don't include too much colour, formatting and “distractions”.",
                  'Never include salary information or “reasons for leaving”.',
                  "Don't include anything on your CV that you are not happy to talk about at the interview.",
                  "Don't refer to company-specific processes, phrases or technology if the reader will not understand them.",
                  "Don't use three words when one word would suffice!",
                  "Don't disclose confidential or sensitive information - use generic terms to describe your achievements.",
                  "Don't include a photograph of yourself or supply referee details on your CV."
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
