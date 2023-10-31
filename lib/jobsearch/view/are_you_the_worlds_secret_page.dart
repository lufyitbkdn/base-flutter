import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/favourites/favorites.dart';
import 'package:flutter/material.dart';

class AreYouTheWorldsSecretPage extends StatefulWidget {
  const AreYouTheWorldsSecretPage({super.key});

  static const String routeName = 'jobsearch.worldssecret';

  @override
  State<AreYouTheWorldsSecretPage> createState() => _AreYouTheWorldsSecretPageState();
}

class _AreYouTheWorldsSecretPageState extends State<AreYouTheWorldsSecretPage> with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: AreYouTheWorldsSecretPage.routeName,
    title: "Are You the World's Best-Kept Secret?",
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: "Are You the World's Best-Kept Secret?",
        svgIconPath: Assets.assets_images_ico_people_svg,
        iconColor: CivColors.green,
        appBarActions: [favouriteAction],
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              Image.asset(
                Assets.assets_images_gr_search_1_jpg,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium("Despite all your good work, you just might still be one of the best-kept secrets around! In a job search, you need to get your message out to as many people as possible. Your message is about who you are and what you have to offer. Remember what we mentioned earlier, job search isn't a solo pursuit, it involves a lot of people and conversations."),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium('The best method for getting your message out? Talking to people. Conversations. Networking. And let’s not be hesitant about that word "networking" – it is just "having conversations". It\'s the most effective method of job search. Quite simply, this is word-of-mouth advertising - people talking to other people about you is the best form of advertising. And of course, LinkedIn is a professional \'must\' for job seekers to be visible and active in "advertising" you and getting your message out to the market.'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium("Networking is about positive conversations and connections, discussions about your plans, your target list and sharing information. It's not always about attending “networking functions” or asking every person “if they know of a job for you”, which can often be uncomfortable for everyone."),
              const SizedBox(height: Spacing.s_16),
              CivText.titleMedium('Networking - Get Your Message Out'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium('Here are some tips to get you started with networking.'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'Use LinkedIn and any industry-specific sites',
                  'Contact 10 people initially, in person, by phone or by email.',
                  "Use these contacts to continue to gather marketplace information, knowledge and 'market intelligence'.",
                  'Follow up with your contacts regularly but make sure it is a productive conversation.',
                  'Always follow up on referrals given to you and let your contact know about the results of their referral.',
                  'Attend professional association meetings, and take an active role on a special project or committee if you have the opportunity.',
                  'Make a list - who do I know in any of my target organisations?',
                  'What professional/industry contacts and former colleagues can I contact for information, referrals and ideas?',
                  'What professional and industry associations am I involved with or I can get involved with?',
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
