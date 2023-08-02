import 'package:flutter/material.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/assets.dart';
import 'package:my_wo/feature/favourites/favorites.dart';

class InterviewsPage extends StatefulWidget {
  const InterviewsPage({super.key});

  static const String routeName = 'jobsearch.interviews';

  @override
  State<InterviewsPage> createState() => _InterviewsPageState();
}

class _InterviewsPageState extends State<InterviewsPage>
    with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: InterviewsPage.routeName,
    title: 'Interviews',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Interviews',
        svgIconPath: Assets.assets_images_ico_interview_svg,
        iconColor: WoColors.green,
        appBarActions: [favouriteAction],
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              Image.asset(
                Assets.assets_images_gr_interview_4_jpg,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium(
                "You're busy now! There's no sitting back waiting waiting waiting for someone to call you - you're reaching out and speaking to contacts, hiring managers, and recruiters and uncovering new information and research. Those conversations are going to pay off: if you're engaged in varied activities - and you're doing enough of them - you can't help but get interviews! This section deals with interviews and ultimately settling into your new role.",
              ),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium(
                "You can't get a job offer without an interview - and it's normal to be anxious before an interview. But remember that an interview is a meeting where both parties want to explore the same things.",
              ),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'Can you do the job?',
                  'Will you do the job?',
                  'Will you do the job with us?',
                ],
              ),
              const SizedBox(height: Spacing.m_25),
              WoText.bodyMedium(
                'Preparation is key, read the job description carefully, several times! You can almost predict the questions that you might be asked. Preparing answers to standard questions and competency-based questions will give you a massive advantage in an interview against someone who does not prepare.',
              ),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium(
                'This is a great opportunity to practise your STAR question answers.',
              ),
              const SizedBox(height: Spacing.m_25),
              const WoStarQuestions(),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'Tell me about yourself.',
                  'Tell me about your last role and your responsibilities.',
                  'What kind of role are you looking for?',
                  'Where do you see yourself in your career in 5 years? 10 years?',
                  'What did you enjoy most in your last role?',
                  'What do you feel is your greatest achievement to date?',
                  'Tell me about a time that you failed to deliver what was expected.',
                  'What salary are you looking for?',
                  'How would your last manager/supervisor/superior describe you?',
                  'Describe a time when you were required to solve a problem.',
                  'How would you describe your leadership style?',
                  'What are your strengths?',
                  'Tell me how you manage your time when juggling multiple responsibilities.',
                  'What are your weaknesses?',
                  "How does this position compare to others that you've interviewed for?",
                  'What do you know about this company?',
                ],
              ),
              const SizedBox(height: Spacing.m_25),
              WoText.bodyMedium(
                'You will typically have an hour to get your core message across convincingly. That means preparation is the key.',
              ),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium(
                "During the Interview, it's not just about your answers to questions. This is a two-way discussion between professionals, your questions are important too.",
              ),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium('Questions you can ask at an interview:'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'What are the major responsibilities of this position?',
                  'Beyond the job description, what are your expectations?',
                  'What situations need immediate attention?',
                  'What experience and background do the team members have?',
                  'Does this department have its own budget?',
                  'How do the corporate teams work together?',
                  'What is the structure of the organisation?',
                  'What are the reporting relationships?',
                  'What are the short- and long-term goals of the position?',
                  'How is performance measured?',
                  'What is the most important contribution you would expect from me during the first six months?',
                  'How would you describe the culture of the organisation?',
                  'How is the corporate culture reflected on a daily basis in my team?',
                  "How would you describe the organisation's management or leadership style?",
                  'Why is this position open? Are there any internal candidates being considered for this position?',
                ],
              ),
              const SizedBox(height: Spacing.m_25),
              WoText.bodyMedium(
                'Pick me! To get an offer the interviewer needs to hear, see and feel your enthusiasm for the role.',
              ),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium(
                "During (and after) the interview, the single best way to communicate your interest and enthusiasm is simply saying “I really want this job” or “I'm very interested in this job, I'd really like to be offered this role”. You do need to back this up by confirming you have the right qualifications, skills and experience for the position but above all the interviewer wants to sense your positive attitude towards the role.",
              ),
              const SizedBox(height: Spacing.m_25),
              Image.asset(
                Assets.assets_images_gr_interview_3_jpg,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: Spacing.s_16),
              WoText.titleMedium(
                "Negotiating - it's vital to take a “win-win” stance",
              ),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium(
                'Almost everything about an offer is (potentially) negotiable, so you need to be clear about what is important enough to talk about, and what you will accept. Take a win-win stance. Research plays an important part in this strategy as does “give and take”. The more work you do beforehand considering what you will and will not accept, the better your negotiating position.',
              ),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium(
                "Second interviews are different, they delve deeper into “fit” areas, checking your match to the role. Don't relax your activities because you have a second interview. Keep up your activity - you could find yourself back to square one!",
              ),
              const SizedBox(height: Spacing.xl_48),
            ],
          ),
        ],
      ),
    );
  }
}
