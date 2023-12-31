import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/assets.dart';
import 'package:my_wo/feature/skills/skills.dart';

class SkillQuizNotCompletedPage extends StatelessWidget {
  const SkillQuizNotCompletedPage({super.key});

  static const String routeName = 'skill_quiz_not_completed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Your Soft Skills',
        svgIconPath: Assets.assets_images_ico_skillsoft_svg,
        iconColor: WoColors.blue,
        children: [
          PaddedContent(
            children: [
              WoText.bodyMedium(
                  'Read about your soft skills, get to know what you are naturally talented in and feel free to share them on your CV and in interviews. They are just as valuable as your work experience!',),
              const SizedBox(height: Spacing.l_32),
              ListTileButton.svg(
                svgPath: Assets.assets_images_ico_star_svg,
                color: WoColors.blue,
                title: 'You Have not Completed the Skills Quiz',
                subtitle: 'Click here to complete the skills quiz.',
                onPressed: () => context.goNamed(SkillQuizPage.routeName),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
