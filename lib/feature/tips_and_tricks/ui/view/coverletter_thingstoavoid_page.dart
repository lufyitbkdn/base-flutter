import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/feature/favourites/favorites.dart';
import 'package:flutter/material.dart';

class CoverLetterThingsToAvoidPage extends StatefulWidget {
  const CoverLetterThingsToAvoidPage({super.key});

  static const String routeName = 'tipsandtricks.coverletter.thingstoavoid';

  @override
  State<CoverLetterThingsToAvoidPage> createState() =>
      _CoverLetterThingsToAvoidPageState();
}

class _CoverLetterThingsToAvoidPageState
    extends State<CoverLetterThingsToAvoidPage> with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: CoverLetterThingsToAvoidPage.routeName,
    title: 'Cover Letter - Things to Avoid',
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
                  "Don't start your cover letter with “To Whom It May Concern” - know who you are going to be talking to.",
                  "Don't submit generic cover letters. Many job seekers submit generic cover letters to save time, however, you're missing out on a great opportunity to really connect with employers.",
                  "Don't summarise your resume. A cover letter is supposed to support a resume and add more context.",
                  "Don't write in the third person, a cover letter is a letter written by you and addressed directly to an employer, so use a first-person perspective.",
                  "Don't rely on AI to write the perfect cover letter. AI can be used as a convenient starting point for your cover letter but it is important to personalise the cover letter with your experience and research into the company.",
                  "Don't have any grammatical errors. If one small thing is wrong (such as a grammatical error) it can be thrown straight into the bin along with your resume. Make sure you have others and online tools proofread for you!",
                  "Don't highlight inexperience. Even if you don't have all of the skills needed, employers will see that when they read your resume. If you have impressed them with your achievements and experience they will give you a chance."
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
