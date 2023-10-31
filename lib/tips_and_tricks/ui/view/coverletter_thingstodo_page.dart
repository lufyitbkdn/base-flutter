import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/favourites/favorites.dart';
import 'package:flutter/material.dart';

class CoverLetterThingsToDoPage extends StatefulWidget {
  const CoverLetterThingsToDoPage({super.key});

  static const String routeName = 'tipsandtricks.coverletter.thingstodo';

  @override
  State<CoverLetterThingsToDoPage> createState() => _CoverLetterThingsToDoPageState();
}

class _CoverLetterThingsToDoPageState extends State<CoverLetterThingsToDoPage> with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: CoverLetterThingsToDoPage.routeName,
    title: 'Cover Letter - Things to Do',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Things to Do',
        svgIconPath: Assets.assets_images_ico_do_svg,
        iconColor: CivColors.orange,
        appBarActions: [favouriteAction],
        children: const [
          PaddedContent(
            children: [
              SizedBox(height: Spacing.s_16),
              BulletList(
                bullets: [
                  'Write what you can do for the company and what value you can add.',
                  'Discuss your skills, how you got these skills, and how they apply to the role.',
                  "Include personality, It's wise to keep a professional tone but personality is a major indication of difference from others when job searching.",
                  'Be succinct, keep it as short and refined as you can and never go over one page.',
                  'Ask someone to review your cover letter. The more eyes looking over it the better.',
                  'Include new content in your cover letter different from the CV, use your cover letter as a means to share more about yourself, your skills and your accomplishments.',
                  "Sell yourself, it's essential to highlight your key achievements that are relevant to the role.",
                ],
              ),
              SizedBox(height: Spacing.l_32),
            ],
          )
        ],
      ),
    );
  }
}
