import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/feature/favourites/favorites.dart';
import 'package:flutter/material.dart';

class CVGeneralTipsPage extends StatefulWidget {
  const CVGeneralTipsPage({super.key});

  static const String routeName = 'tipsandtricks.cv.generaltips';

  @override
  State<CVGeneralTipsPage> createState() => _CVGeneralTipsPageState();
}

class _CVGeneralTipsPageState extends State<CVGeneralTipsPage>
    with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: CVGeneralTipsPage.routeName,
    title: 'CV - General Tips',
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
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'Make sure to add your personal details: name, email, mobile, LinkedIn URL (front page).',
                  'Add your professional objective: optional, usually included in the email/cover letter, not the CV.',
                  'A quick summary of yourself: essential, compelling arguments about you, your strengths, professional identity, expertise, industry exposure, and areas where you add value (front page).',
                  'Add your Key Skills and Areas of Specialisation: optional, overview of skills, technical skills, your functional areas of specialisation (front page).',
                  'Add your Key Career Achievements/Career Highlights: recommended, perhaps include three or four (front page).',
                  'Add your Career/Employment History: company name, dates of employment (years and months) and role/job titles (most recent 10 years, in order of most recent).',
                ],
              ),
              const SizedBox(height: Spacing.s_16),
              CivListTile.svg(
                svgPath: Assets.assets_images_ico_brain_svg,
                color: CivColors.blue,
                title: 'Scope of Position',
                subtitle:
                    'A few sentences or bullet points to outline accountabilities or responsibilities.',
              ),
              const SizedBox(height: Spacing.s_16),
              CivListTile.svg(
                svgPath: Assets.assets_images_ico_brain_svg,
                color: CivColors.orange,
                title: 'Key Achievements',
                subtitle:
                    'Bullets to overview achievements with business results/outcomes.',
              ),
              const SizedBox(height: Spacing.s_16),
              CivListTile.svg(
                svgPath: Assets.assets_images_ico_brain_svg,
                color: CivColors.purple,
                title: 'Multiple Positions',
                subtitle:
                    'If you had multiple positions at one company: give full employment dates first then dates for each position.',
              ),
              const SizedBox(height: Spacing.s_16),
              CivListTile.svg(
                svgPath: Assets.assets_images_ico_brain_svg,
                color: CivColors.blue,
                title: 'Early career',
                subtitle: 'Summarise company name and job title only.',
              ),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'Add any Professional Development and Training that you have done: include as appropriate to the business context (accreditations, qualifications, licences or certificates).',
                  'Add your Qualifications: list the most "senior" and recent first. If you have tertiary qualifications there is no need to list secondary school results.',
                  'Add any relevant additional Information: optional, e.g. "willingness to relocate", voluntary work or language skills.',
                  'Add any relevant memberships: include if relevant to your targeted role.',
                  'Add any other relevant information: e.g. publications, awards/honours, etc.',
                ],
              ),
              const SizedBox(height: Spacing.l_32),
            ],
          )
        ],
      ),
    );
  }
}
