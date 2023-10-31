import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/favourites/favorites.dart';
import 'package:flutter/material.dart';

class CoverLetterGeneralTipsPage extends StatefulWidget {
  const CoverLetterGeneralTipsPage({super.key});

  static const String routeName = 'tipsandtricks.coverletter.generaltips';

  @override
  State<CoverLetterGeneralTipsPage> createState() => _CoverLetterGeneralTipsPageState();
}

class _CoverLetterGeneralTipsPageState extends State<CoverLetterGeneralTipsPage> with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: CoverLetterGeneralTipsPage.routeName,
    title: 'Cover Letter - General Tips',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'General Tips',
        svgIconPath: Assets.assets_images_ico_lightbulb_svg,
        iconColor: CivColors.orange,
        appBarActions: [favouriteAction],
        children: const [
          PaddedContent(
            children: [
              SizedBox(height: Spacing.s_16),
              BulletList(
                bullets: [
                  "A cover letter (or email, generally still referred to as a “cover letter”) acts as a personal introduction in a professional setting. Most commonly, it's a separate document that you should attach to a job application along with your CV.",
                  'Use a cover letter to demonstrate your personality and summarise why you are the right person for the job.',
                  'A cover letter should be engaging enough for an employer to read and feel compelled to find out more about your skills and experience in your resume, before calling you in for an interview.',
                  'Make sure your cover letter answers the specific requirements of the job ad - this will help separate you from other applicants.',
                  'Try to keep the cover letter to around five paragraphs long (max!), hiring managers will be sifting through many other cover letters, so keep it tight.',
                  'Go through the job advertisement and underline the keywords used to describe the skills, training and experience sought. This will help you identify what to put in your cover letter.',
                  "Read the organisation's website and social media profiles, its executives' social media profiles and any online employee reviews. This will give you an indication of the appropriate tone to use in your cover letter and the points you should include.",
                  'Try to avoid repeating the CV content in your cover letter, make it different. Respond to the first 3 or 4 bulleted criteria they have outlined in the advertisement, and outline how you have demonstrated these skills in the past.',
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
