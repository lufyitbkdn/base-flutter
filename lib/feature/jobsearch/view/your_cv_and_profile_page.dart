import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/feature/favourites/favorites.dart';
import 'package:flutter/material.dart';

class YourCVAndProfilePage extends StatefulWidget {
  const YourCVAndProfilePage({super.key});

  static const String routeName = 'jobsearch.yourcvandprofile';

  @override
  State<YourCVAndProfilePage> createState() => _YourCVAndProfilePageState();
}

class _YourCVAndProfilePageState extends State<YourCVAndProfilePage>
    with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: YourCVAndProfilePage.routeName,
    title: 'Your CV and Profile',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Your CV and Profile',
        svgIconPath: Assets.assets_images_ico_person_svg,
        iconColor: CivColors.green,
        appBarActions: [favouriteAction],
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              Image.asset(
                Assets.assets_images_gr_socials_1_jpg,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  'How is your advertising campaign going? In a job search, you must have an advertising campaign - communications strategy - to deliver a consistent message about yourself across a number of areas.'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  'A planned communications strategy helps you have harmony across three areas:'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'What you write about yourself (Your CV, your cover letter)',
                  "What you say about yourself (Your spoken responses to screening questions - 'Tell me about yourself?' 'What kind of job are you looking for?' 'What sort of skills can to bring to our company?')",
                  'What does your online brand or your social media presence say about you? (LinkedIn, Facebook, Twitter)'
                ],
              ),
              const SizedBox(height: Spacing.m_25),
              CivText.bodyMedium(
                  "Your written communications strategy - your CV and cover letter - it's all about what you do best - your achievements!"),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  "Your CV is often the first impression that a future employer has of you. It's your 'sales brochure' presenting an overview of what you have done in the past and implying what you can do in the future. Its main job is to sell what you have to offer and get you an interview by presenting what you do best - your successes and accomplishments (your STAR stories), your skills, areas of specialisation and your career achievements.",
                  "Your CV presents how well you performed - keep checking yourself to qualify and quantify your statements. Ask yourself 'Why did I do that?' Give the reader outcomes and benefits you delivered - now is not the time to be shy!",
                  "Check out the CV section in Tips and Tricks for specific advice about getting your CV right. There's also a section on Cover letters."
                ],
              ),
              const SizedBox(height: Spacing.m_25),
              CivText.bodyMedium(
                  'Your Summary Statement/Profile is the umbrella over your CV.'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  "Your Summary Statement/Profile is a short, succinct statement of what you have to offer and can be enhanced by a 'Key Skills' or 'Areas of Specialisation' listing on the front page. Your Summary Statement/Profile covers an indication of your professional identity, your core areas of experience or expertise, your industry exposure and your unique blend of characteristics and strengths.",
                ],
              ),
              const SizedBox(height: Spacing.m_25),
              CivText.bodyMedium(
                  'Cover Letters/Emails - Unless expressly told not to, you should always send a cover letter/email with your CV.'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium('Cover letter/email content:'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'Explain why you are writing in a way that raises interest and confirms that what they are asking for is a perfect fit for what you are looking for!',
                  'Briefly describe your relevant qualifications and achievements.',
                  'Relate yourself to the job or company (their products, services or sector).',
                  'Confirm that your CV is attached, suggest a time to meet or indicate when you are available for an interview, and when you are available to start.'
                ],
              ),
              const SizedBox(height: Spacing.m_25),
              CivText.bodyMedium(
                  'Your spoken communications strategy. Behind every good cover letter and customised CV sits a well-planned conversation. Follow up on every application, hiring managers need to hear your voice, energy and confidence.'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  'Here are three critical questions - and tips on answers!'),
              const SizedBox(height: Spacing.s_16),
              CivCard(
                title: "'What kind of job are you looking for?'",
                child: CivText.bodyMedium(
                    "Use your professional objective stating in a tailored phrase or sentence, exactly what you're looking for."),
              ),
              const SizedBox(height: Spacing.s_16),
              CivCard(
                title: "'Why did you leave your last role?'",
                child: CivText.bodyMedium(
                    "This is your 'press release' that tells the world about your transition. It's brief, non-defensive and positive. Firstly, state the circumstances that led to you leaving your job or leaving the defence forces - stick to the facts, keep it short and never say anything negative about your previous superior, the forces or, if you've had other jobs, about your previous boss or employer. Then continue to refocus on what you are looking for now and your professional objective - be positive, optimistic and brief. Hear yourself say it out loud, practise it, rehearse it."),
              ),
              const SizedBox(height: Spacing.s_16),
              CivCard(
                title: "'Tell me about yourself?'",
                child: CivText.bodyMedium(
                    "Outline key elements of your suitability to the role - this is a 'branding statement' and you'll use it across networking, emails, phone calls, and interviews. Avoid talking about personal things – keep it authentic and tied to your professional self and work. Draw inspiration from the Summary Statement/profile you created in your CV when preparing this response. State your professional identity or professional reference to you in the market, your expertise, skills or functions of work that qualify you for the role, your Industry exposure or the types of organisations you've worked for and finish with the qualities that make you stand out from others in your field. Make it your own - edit it, re-draft it, practise it, rehearse it."),
              ),
              const SizedBox(height: Spacing.xl_48),
              Image.asset(
                Assets.assets_images_gr_linkedin_1_jpg,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  "LinkedIn - a professional 'must'. It is for the people you need to be connected to, across your profession, your industry, like-minded professionals who share information, referrals, leads and 'thought leadership' similar to your own knowledge and awareness - essential in a job search."),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'Employers (hiring manager, talent specialists and recruiters) now actively use LinkedIn and other networking sites to find the best people to hire, LinkedIn is the largest professional networking tool online and possibly the single most important social networking tool for your career.',
                  'Ensure your profile is completed effectively and use LinkedIn to proactively build your network, find job leads and connect with recruiters and hiring managers at the companies of your choice.',
                  'Take your time to completely and carefully update your profile and connect with past colleagues, clients, suppliers, competitors, members of your profession or industry to organise and expand your network.',
                  "Don't be passive on LinkedIn - be visible, active and participating in the essence of networking, otherwise you won't be noticed. Be active, get involved, reach out to people - start a 'conversation' - it will make a difference, very quickly to getting noticed and remembered."
                ],
              ),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  'Your online presence - consistency, credibility and a good reputation.'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'Your CV, your online profile, and any other information you post about yourself online must be consistent in content and specific about your credentials and qualifications.',
                  'Remember that your CV and online profile must be searchable by keywords, job titles, qualifications, affiliations, memberships etc. so hiring managers can find you',
                  'Your online presence needs to be both professional and presentable - no typos, spelling, jargon or grammatical errors',
                  'Always communicate professionally with your contacts and connections - always personalise your connection',
                  'If you post your CV online, track everywhere you have posted it and created profiles. Keep these updated, and stay aware of who is accessing your information.',
                  'Remember that your online presence and branding is a means to an end - talking with people, having conversations, following up and engaging person to person is paramount in a job search.'
                ],
              ),
              const SizedBox(height: Spacing.xl_48),
            ],
          ),
        ],
      ),
    );
  }
}
