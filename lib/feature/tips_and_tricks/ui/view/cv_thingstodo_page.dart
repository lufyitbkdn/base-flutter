import 'package:flutter/material.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/assets.dart';
import 'package:my_wo/feature/favourites/favorites.dart';

class CVThingsToDoPage extends StatefulWidget {
  const CVThingsToDoPage({super.key});

  static const String routeName = 'tipsandtricks.cv.thingstodo';

  @override
  State<CVThingsToDoPage> createState() => _CVThingsToDoPageState();
}

class _CVThingsToDoPageState extends State<CVThingsToDoPage>
    with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: CVThingsToDoPage.routeName,
    title: 'CV - Things to Do',
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
                  "Review your CV through the reader's eyes, and ask: “Would I want to interview this person?”.",
                  'Customise your CV every time you send it out - there is no "standard" CV that will capture every reader\'s attention – tailoring the document makes it meaningful to the reader.',
                  'Proofread the final version - get others to proofread it too (check spelling, punctuation, grammar, and typographical errors).',
                  'Use reverse chronological order when listing employers.',
                  'Describe specific responsibilities - not ALL of them - focus on achievements using positive language to describe results.',
                  'Summarise early employment - focussing on the most recent 10 years - draw attention to what the market is looking for and devote more space to recent jobs/roles than earlier ones.',
                  'Use present tense for your current role (if you are in one) and past tense for all previous roles.',
                  'Start your bullet points with verbs - use a direct and active writing style keeping sentences short.',
                  'Use keywords and phrases appropriate to your next employer - not your last role.',
                  'Try to keep this to two pages (definitely no more than three).',
                  'Include your name, contact number and a page number on each page.',
                  'Make your CV easy to read and scan (is it easy to read on a mobile device?).',
                  "Format your CV so that a job description or sentences don't run over onto the next page.",
                  "Utilise space on the page, but don't overcrowd it, leave 'white space'.",
                  'Ensure abbreviations are initially written in full to explain the full meaning.',
                  'Ensure you are 100% certain your industry jargon will be understood.',
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
