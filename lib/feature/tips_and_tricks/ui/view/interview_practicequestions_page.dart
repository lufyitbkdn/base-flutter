import 'package:flutter/material.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/assets.dart';
import 'package:my_wo/feature/favourites/favorites.dart';

class InterviewPracticeQuestionsPage extends StatefulWidget {
  const InterviewPracticeQuestionsPage({super.key});

  static const String routeName = 'tipsandtricks.interview.practicequestions';

  @override
  State<InterviewPracticeQuestionsPage> createState() =>
      _InterviewPracticeQuestionsPageState();
}

class _InterviewPracticeQuestionsPageState
    extends State<InterviewPracticeQuestionsPage> with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: InterviewPracticeQuestionsPage.routeName,
    title: 'Practice Questions',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Practice Questions',
        svgIconPath: Assets.assets_images_ico_chat_svg,
        iconColor: WoColors.orange,
        appBarActions: [favouriteAction],
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              WoListTile.svg(
                svgPath: Assets.assets_images_ico_support_svg,
                color: WoColors.blue,
                title: 'What are you looking for?',
                subtitle:
                    'Use your professional objective, relative to the role',
              ),
              const SizedBox(height: Spacing.xs_8),
              WoListTile.svg(
                svgPath: Assets.assets_images_ico_support_svg,
                color: WoColors.green,
                title: 'Why did you leave your last role/the defence force?',
                subtitle: "Use your 'departure' statement",
              ),
              const SizedBox(height: Spacing.xs_8),
              WoListTile.svg(
                svgPath: Assets.assets_images_ico_support_svg,
                color: WoColors.orange,
                title: 'Tell me about yourself.',
                subtitle: 'Use your prepared and tailored branding statement',
              ),
              const SizedBox(height: Spacing.xs_8),
              WoListTile.svg(
                svgPath: Assets.assets_images_ico_support_svg,
                color: WoColors.purple,
                title: 'What did you like in your last role?',
                subtitle:
                    "State the three or four areas that you enjoyed. Make it as relevant to the role you're interviewing for as you can.",
              ),
              const SizedBox(height: Spacing.xs_8),
              WoListTile.svg(
                svgPath: Assets.assets_images_ico_support_svg,
                color: WoColors.blue,
                title: 'What did you dislike in your last role?',
                subtitle:
                    "Indicate one area that “wasn't your favourite” and ensure it's not a core function of the role you're interviewing for.",
              ),
              const SizedBox(height: Spacing.xs_8),
              WoListTile.svg(
                svgPath: Assets.assets_images_ico_support_svg,
                color: WoColors.green,
                title: 'What is your greatest career achievement?',
                subtitle:
                    'Use your STAR story to succinctly describe your career highlight',
              ),
              const SizedBox(height: Spacing.xs_8),
              WoListTile.svg(
                svgPath: Assets.assets_images_ico_support_svg,
                color: WoColors.orange,
                title: 'What are your strengths?',
                subtitle:
                    "Indicate three or four areas of strength relevant to the role that you're interviewing for.",
              ),
              const SizedBox(height: Spacing.xs_8),
              WoListTile.svg(
                svgPath: Assets.assets_images_ico_support_svg,
                color: WoColors.purple,
                title: 'What is your greatest weakness?',
                subtitle:
                    "Indicate one weakness and your way of self-management of that area - (don't leave it hanging without a self-management solution)",
              ),
              const SizedBox(height: Spacing.xs_8),
              WoListTile.svg(
                svgPath: Assets.assets_images_ico_support_svg,
                color: WoColors.blue,
                title:
                    'We have a lot of candidates for this role, why should we pick you?',
                subtitle:
                    'Reiterate your areas of strength so far as they relate to the role, using different language but underscoring your strongest skills matching to the role.',
              ),
              const SizedBox(height: Spacing.xs_8),
              WoListTile.svg(
                svgPath: Assets.assets_images_ico_support_svg,
                color: WoColors.green,
                title: 'Why are you interested in this role?',
                subtitle:
                    "Indicate the areas of enjoyment or interest from your last role and relate them to the role that you're interviewing for, integrate your three or four strengths/strongest skills matching to the role and the utilisation of those skills within the role.",
              ),
              const SizedBox(height: Spacing.xs_8),
              WoListTile.svg(
                svgPath: Assets.assets_images_ico_support_svg,
                color: WoColors.orange,
                title: 'Where do you see yourself in 5 years?',
                subtitle:
                    'Indicate where you want your career to progress, describe broad areas (paint a picture), and link your longer-term strategy to your more immediate goals and professional objectives.',
              ),
              const SizedBox(height: Spacing.xs_8),
              WoListTile.svg(
                svgPath: Assets.assets_images_ico_support_svg,
                color: WoColors.purple,
                title: 'What could you bring to this role?',
                subtitle:
                    'Respond to this by weaving your strongest skill points into your response, focusing on what the interviewer and the organisation need you to deliver/problems that need solving. Use alternate vocabulary to your “strengths” answer but integrate a consistent message.',
              ),
              const SizedBox(height: Spacing.l_32),
              WoText.titleMedium('STAR Responses'),
              const SizedBox(height: Spacing.xs_8),
              WoText.bodyMedium(
                  'Practice your STAR responses with the method:',),
              const SizedBox(height: Spacing.s_16),
              const WoStarQuestions(),
              WoText.bodyMedium(
                  'Example: "I had a project (situation) where I was required to do A, B, C (Tasks) and the challenges were X, Y and Z. So, what I did (actions) was D, E and F which resulted (results) in G, H and I."',),
              const SizedBox(height: Spacing.m_25),
              WoText.titleMedium('Questions:'),
              const SizedBox(height: Spacing.s_16),
              WoListTile.svg(
                svgPath: Assets.assets_images_ico_support_svg,
                color: WoColors.blue,
                title:
                    'Tell me about a time when you solved a problem within your role. What did you do and what was the result?',
                subtitle: 'Use a STAR story.',
              ),
              const SizedBox(height: Spacing.xs_8),
              WoListTile.svg(
                svgPath: Assets.assets_images_ico_support_svg,
                color: WoColors.green,
                title:
                    'Tell me about a time when you implemented a new process or system that saved money or improved business operations.',
                subtitle: 'Use a STAR story.',
              ),
              const SizedBox(height: Spacing.xs_8),
              WoListTile.svg(
                svgPath: Assets.assets_images_ico_support_svg,
                color: WoColors.orange,
                title:
                    'Give me an example of your experience in managing people…',
                subtitle: 'Use a STAR story.',
              ),
              const SizedBox(height: Spacing.xs_8),
              WoListTile.svg(
                svgPath: Assets.assets_images_ico_support_svg,
                color: WoColors.purple,
                title:
                    'Tell me the techniques you use to build high-performing teams…',
                subtitle: 'Use a STAR story.',
              ),
              const SizedBox(height: Spacing.xs_8),
              WoListTile.svg(
                svgPath: Assets.assets_images_ico_support_svg,
                color: WoColors.blue,
                title:
                    'Describe a time that you were required to retrieve an unhappy customer. What did you do and what were the results?',
                subtitle: 'Use a STAR story.',
              ),
              const SizedBox(height: Spacing.xs_8),
              WoListTile.svg(
                svgPath: Assets.assets_images_ico_support_svg,
                color: WoColors.green,
                title:
                    'Give me an example of how you have dealt with pressure or a stressful situation.',
                subtitle: 'Use a STAR story.',
              ),
              const SizedBox(height: Spacing.xs_8),
              WoListTile.svg(
                svgPath: Assets.assets_images_ico_support_svg,
                color: WoColors.orange,
                title:
                    'Tell me about a time when you and a work colleague disagreed on a project deliverable. What did you do and what were the results?',
                subtitle: 'Use a STAR story.',
              ),
              const SizedBox(height: Spacing.l_32),
            ],
          ),
        ],
      ),
    );
  }
}
