import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/favourites/favorites.dart';
import 'package:flutter/material.dart';

class BeforeYouBeginPage extends StatefulWidget {
  const BeforeYouBeginPage({super.key});

  static const String routeName = 'jobsearch.beforeyoubegin';

  @override
  State<BeforeYouBeginPage> createState() => _BeforeYouBeginPageState();
}

class _BeforeYouBeginPageState extends State<BeforeYouBeginPage> with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: BeforeYouBeginPage.routeName,
    title: 'Before You Begin',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Before You Begin',
        svgIconPath: Assets.assets_images_ico_jobsearch_svg,
        iconColor: CivColors.green,
        appBarActions: [favouriteAction],
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              Image.asset(
                Assets.assets_images_gr_search_7_jpg,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium("It's time to focus on looking for that next role."),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'It is important that you focus on having a productive job search rather than a passive or reactive search, where you spend most of your time waiting for other people.',
                  "A “productive job search” involves a variety of activities, tracking those activities and it's what we call proactive and productive. Approach your job search with a sense of planning and organisation, this will speed up getting a new job considerably.",
                ],
              ),
              const SizedBox(height: Spacing.m_25),
              CivText.bodyMedium('Before we get started, here are some helpful things to remember.'),
              const SizedBox(height: Spacing.s_16),
              CivText.titleMedium('Dealing with Stories and Myths'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'People love to share what they think are “insights”. And often they are not insights at all! You\'ve probably heard stories like: "It\'s easier to get a job when you\'re in a job” or "I don\'t have time to look for work" or "I\'m too old to get a job in this market" or "I\'ve only done one thing before up to now - no one else will hire me". Throw these myths away. Move forward - these stories can be self-defeating barriers that will obstruct your search and your confidence.',
                ],
              ),
              const SizedBox(height: Spacing.s_16),
              CivText.titleMedium('Keeping on Track'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  "The Internet. Love it. It's a great tool. And networking sites and job postings are essential. But it's also the biggest time-waster. It's too easy to get bogged down and distracted and start randomly browsing. Be focused when online, and know what information you want before you log on. If you haven't found it in 10 minutes, stop and reassess where else you might look, who you might talk to, or who might be able to help. Even if you do find what appears to be useful information, stop and evaluate after 10 minutes. What is its value to you? Avoid information overload.",
                ],
              ),
              const SizedBox(height: Spacing.s_16),
              CivText.titleMedium('Time Management'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  "You don't make time: you allocate it. The ways you used to manage your time simply don't work when job hunting. Your diary isn't filled with the same kinds of activities. You'll have a lot of 'silent' time - time to clean out the garage or paint the front door - don't get distracted from the real work of job search. Manage your diary carefully. Build discipline, focus and momentum.",
                ],
              ),
              const SizedBox(height: Spacing.s_16),
              CivText.titleMedium('Emotional Survival Tactics'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  "Unemployment can result in feelings of grief, anger, denial, and even acceptance. It's an emotional roller coaster at times, causing a sense of frustration. These feelings will change as you get focussed on a productive search - it will get easier. You will always feel energised when you are “doing” something.",
                ],
              ),
              const SizedBox(height: Spacing.s_16),
              CivText.titleMedium('Financial Assistance'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'A well-planned search could land you a job before your savings run out, but even in a good job market, you should do your transitional financial planning based on the possibility of a long search.',
                ],
              ),
              const SizedBox(height: Spacing.s_16),
              CivText.titleMedium('Final Word'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'Job search isn’t a solo activity -you need others to provide information, give you additional bits and pieces of knowledge, tips, hints – and possibly leads. Be ready to chat and engage with others – this is how productive job searching gets traction.',
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
