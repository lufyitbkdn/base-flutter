import 'package:flutter/material.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/assets.dart';
import 'package:my_wo/feature/favourites/favorites.dart';

class BeatingTheSystemPage extends StatefulWidget {
  const BeatingTheSystemPage({super.key});

  static const String routeName = 'beating_the_system';

  @override
  State<BeatingTheSystemPage> createState() => _BeatingTheSystemPageState();
}

class _BeatingTheSystemPageState extends State<BeatingTheSystemPage>
    with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: BeatingTheSystemPage.routeName,
    title: 'Beating the System',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Beating the System',
        svgIconPath: Assets.assets_images_ico_beatthesystem_svg,
        iconColor: WoColors.orange,
        appBarActions: [favouriteAction],
        children: [
          PaddedContent(
            children: [
              Image.asset(
                Assets.assets_images_man_typing_jpg,
                fit: BoxFit.cover,
              ),
              const ParagraphBreakSpace(),
              WoText.bodyMedium(
                  'You spent your time making sure your CV presented your skills, accountabilities, and achievements in an authentic and compelling way, and now you’re ready to send it to relevant recruiters and hiring managers. It feels good to be at the starting blocks and reading to get going with your job search.',),
              const ParagraphBreakSpace(),
              WoText.bodyMedium(
                  "Along the way, as you start to send your CV out, it can feel frustrating when you don't hear back following your application. It can feel like you are being ghosted. There can be a silence that is quite deafening at times.",),
              const ParagraphBreakSpace(),
              WoText.bodyMedium(
                  'That’s why it’s important to realise that when you submit your CV to an advertisement, it doesn’t go to the inbox of a human (who surely will look at it and pick up the phone to call you).',),
              const ParagraphBreakSpace(),
              WoText.bodyMedium('It goes to a computer.'),
              const ParagraphBreakSpace(),
              WoText.bodyMedium(
                  'More and more companies – everywhere – are using Applicant Tracking System (ATS) to scan CVs for certain criteria, keywords and phrases that weed out the CVs that don’t match the job description.',),
              const ParagraphBreakSpace(),
              WoText.bodyMedium(
                  'An ATS is a computer software program that collects, scans, and sorts CVs, and manages the recruitment process in the initial stages before a human actually looks at the CVs. ATS helps companies handle the volume of CVs that they receive. Effectively, the technology makes the first decision on whether the skills, background, and experience outlined in the CV are a match for the job description requirements.',),
              const ParagraphBreakSpace(),
              Image.asset(
                Assets.assets_images_resume_jpg,
                fit: BoxFit.cover,
              ),
              const ParagraphBreakSpace(),
              WoText.bodyMedium('So, here’s what you need to consider:'),
              const ParagraphBreakSpace(),
              const BulletList(
                bullets: [
                  'When you apply for a position, make sure your resume/CV is clean, clear, and not formatted in a "fussy" way. Make sure that technology can easily scan and read it.',
                  'Avoid blocks of colour, tables, logos, pictures, and any formatting that might look very pretty and colourful, as at the end of the day, this can hinder the document getting through the ATS.',
                  'Ensure your branding (your profile/summary, experience, qualifications, etc.) reflects and matches the criteria that the ATS is using to screen CVs.',
                  'Tailor ("optimise") your CV, particularly the first page of the document, to every single role or advertisement that interests you, this is paramount in getting your CV noticed.',
                ],
              ),
              const ParagraphBreakSpace(),
              WoText.bodyMedium(
                  'Remember, if the ATS doesn’t find a match in your CV, it won’t pass through to the next stage of the screening process, and that phone call simply won’t happen.',),
              const ParagraphBreakSpace(),
              WoText.bodyMedium(
                  'If the ATS finds a match to the list of skills and requirements in the advertisement, then your CV has an excellent chance of getting through to the next stage of screening and getting a call to talk further about the position.',),
              const SizedBox(height: Spacing.xl_48),
            ],
          ),
        ],
      ),
    );
  }
}
