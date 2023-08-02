import 'package:flutter/material.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/assets.dart';
import 'package:my_wo/feature/favourites/favorites.dart';

class YourProfessionalObjectivesPage extends StatefulWidget {
  const YourProfessionalObjectivesPage({super.key});

  static const String routeName = 'jobsearch.yourprofessionalobjectives';

  @override
  State<YourProfessionalObjectivesPage> createState() =>
      _YourProfessionalObjectivesPageState();
}

class _YourProfessionalObjectivesPageState
    extends State<YourProfessionalObjectivesPage> with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: YourProfessionalObjectivesPage.routeName,
    title: 'Your Professional Objectives',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Your Professional Objectives',
        svgIconPath: Assets.assets_images_ico_checklist_svg,
        iconColor: WoColors.green,
        appBarActions: [favouriteAction],
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              Image.asset(
                Assets.assets_images_gr_job_2_jpg,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium(
                  "Can you answer the question: 'What sort of role are you looking for?'.  If not, then you need to rethink your early job search activity. You need to be able to tell people what you're looking for (maybe you don't know what you're looking for, but we'll get to that later...). If you can't tell someone what you're looking for, then they don't know how to help you. Let's call the answer to that question 'a professional objective'.",),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium(
                  "Your Professional Objective is a “launch pad” for your job search - a statement that tells people “something”! It may not be 100% precise straight away, but over time, you need to develop a statement that lets people understand what you're looking for. Your professional objective is generally a phrase, or a sentence or two that outlines the kind of work you are seeking so that it's understood by everyone - people inside and outside your profession and your industry. Having an objective gives direction to your job search, sets the tone for your CV, and clarifies the role and responsibilities you are seeking. Sometimes a professional objective is a little elusive - you're considering a change, you're at a crossroads and may want something different. There are lots of things that can make your objective hard to define. Don't worry! You're not alone!",),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium(
                  'The first step towards a more clarified definition (or confirmation) of your objective is a self-assessment which leads to increased confidence as you face the job market - a considered self-assessment helps you identify your work preferences, “high interest” areas and your key skills.',),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium(
                  'Your self-assessment should include the following:',),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  "What do you do best? - Your skills, knowledge and competencies: what you've learned and knowledge you've gathered, your personal characteristics, the qualities, talents and abilities make you uniquely... 'you'.",
                  "What do you like to do? - Your interests, the things you enjoy and like doing within a role - after all, you need to be happy getting up and going to work every day don't you?",
                  "What are your priorities in life? - Your values, what's important to you now, your personal preferences, lifestyle needs, and what motivates you.",
                  'Check out the Skills section of this app, take the skills tests and see if you learn anything about yourself that might be useful as part of your job search.',
                ],
              ),
              const SizedBox(height: Spacing.s_16),
              Image.asset(
                Assets.assets_images_gr_interview_6_jpg,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium(
                  'You need to be able to talk about your skills - including your strongest skills - to anyone who asks about them and these can fall across a couple of categories:',),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  "Things you can do - Employers want to know the specific skills you have and what you can do e.g. 'organise effective presentations' or 'develop a project timeline'.",
                  'Things you know - Jobs require knowledge as well as skills.',
                  'Roles you can play - Employers want to know how you combine skills, knowledge and personal traits to fulfil particular roles in the workplace.',
                ],
              ),
              const SizedBox(height: Spacing.m_25),
              WoText.bodyMedium(
                  'Analysing and identifying the things you achieve daily, weekly, and monthly as well as the "Key Achievements" you have accomplished throughout your career to date helps you confirm the skills that you use when you are successful.',),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'Did you identify a problem and solve it? What were the results?',
                  'Did you introduce a new system or procedure to make things easier or more accurate?',
                  'Did you save money or time? How much? What positive impact did the savings have?',
                  'Did you increase productivity or reduce downtime? By how much? How did the savings affect the bottom line?',
                  'Did you effectively manage systems or people? What were the results of your efforts?',
                  'Did you initiate a programme that worked? What were the results? Did this increase morale?',
                  'Did you participate in decision-making or planning? What contributions did you make to the team? What were the results of your efforts?',
                  'Did you write any major reports, programmes, publications, promotions or newsletters? What was the intended audience? What was the distribution or readership?',
                  'Did you improve the efficiency of people or operations? What were the savings?',
                  'Were you responsible for reducing staff or trimming an operation? How were you able to do this efficiently? How did you do this with sensitivity?',
                  'Did you automate or create systems or procedures? How many people did you train?',
                  'Were you a liaison between departments? How were you able to make things run more efficiently?',
                  'Did you produce reports or data that enabled people to make more informed decisions?',
                ],
              ),
              const SizedBox(height: Spacing.m_25),
              Image.asset(
                Assets.assets_images_gr_search_3_jpg,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium(
                  "You need to be able to tell people about your skills in a positive, succinct way and speak about your skills, on the phone, in person and online. You'll also elaborate on your skills at the interview by responding to behavioural or competency-based questions about examples or demonstrations of your skills. The STAR technique can help!",),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium(
                  'The best way to prepare yourself for answering questions about your skills and your accomplishments is to use the "STAR" technique.',),
              const SizedBox(height: Spacing.m_25),
              const WoStarQuestions(),
              const SizedBox(height: Spacing.m_25),
              WoText.bodyMedium(
                  'As you develop your professional objective, concentrate on developing your “brand” - you need an online presence that makes a positive impression, uniquely about you, consistent with your communications strategy, so that what you say about yourself in person is echoed online.',),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium(
                  "You need to be found for the right reasons! (your branding). Personal branding is more than just an elevator speech or a couple of buzzwords - it's about who you are and how you appear to potential hiring managers.",),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium('What image defines you?'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'Know Yourself - Define who you are.',
                  "Distinguish Yourself - You're different from others but how?",
                  'Communicate your Brand - Create your branding statement.',
                  'Use LinkedIn to Build Your Brand - Your brand says who you are.',
                  'Get Feedback - Test the value of your personal brand.',
                ],
              ),
              const SizedBox(height: Spacing.m_25),
              WoText.bodyMedium(
                  'Online Branding: The best-known brands have established an online presence in the minds of their audiences. How about you?',),
              const SizedBox(height: Spacing.s_16),
              WoText.bodyMedium(
                  "You might be a little uncomfortable at 'blowing your own trumpet', but unless you market your skills and their value to your audience, you won't get the attention you deserve. Your Online Brand should tell the hiring world: 'This is who I am and what I do'. If it does it well, your online brand will help you stand out from the crowd.",),
              const SizedBox(height: Spacing.xl_48),
            ],
          ),
        ],
      ),
    );
  }
}
