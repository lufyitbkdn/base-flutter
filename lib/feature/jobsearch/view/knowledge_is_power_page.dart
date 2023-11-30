import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/feature/favourites/favorites.dart';
import 'package:flutter/material.dart';

class KnowledgeIsPowerPage extends StatefulWidget {
  const KnowledgeIsPowerPage({super.key});

  static const String routeName = 'jobsearch.knowledgeispower';

  @override
  State<KnowledgeIsPowerPage> createState() => _KnowledgeIsPowerPageState();
}

class _KnowledgeIsPowerPageState extends State<KnowledgeIsPowerPage>
    with FavouritablePageMixin {
  @override
  final favourite = const Favourite(
    path: KnowledgeIsPowerPage.routeName,
    title: 'Knowledge is Power',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Knowledge is Power',
        svgIconPath: Assets.assets_images_ico_brain_svg,
        iconColor: CivColors.green,
        appBarActions: [favouriteAction],
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              Image.asset(
                Assets.assets_images_gr_search_10_jpg,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  'The more you know, the shorter your job search will be. The right kind of knowledge is essential in a job search and allows you to make better decisions, create a better impression when networking and in interviews and leverage introductions to the right people. Having information about your target companies, industries, professions - and people - helps you prioritise your Target List.'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  'Knowledge comes from research, and research is an activity that needs thought. Think carefully about what you already know and what you need to uncover. Online resources, other people - and of course, LinkedIn, are great sources of information for your job search.'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  "Networking - talking to people - is key to search success - you do it every day without knowing that you do it and in job search it's essential."),
              const SizedBox(height: Spacing.s_16),
              CivText.titleMedium('Research and Marketplace Information'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  'When researching, you should ask yourself the following questions:'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'Which organisations are likely to meet my personal expectations and criteria?',
                  'What do my target organisations do?',
                  'What are their business strategies and what challenges are they facing that might require my competencies and expertise?',
                  'What can I find out about their culture?',
                  'Who are the key people in the individual organisations I am targeting?',
                  'Who are the relevant hiring managers?',
                  'What are the remuneration levels at my level in my chosen industries?',
                  'What is the going rate for someone at my level with my competencies?',
                  'How is compensation usually structured for the job titles that interest me?',
                  'What others may be possible choices?',
                  'Who are the major players in my targeted geographical area?',
                  'How do they differ? How are they the same?',
                  'What issues do each of them face? Are the issues the same or different?',
                ],
              ),
              const SizedBox(height: Spacing.m_25),
              Image.asset(
                Assets.assets_images_gr_search_6_jpg,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: Spacing.m_25),
              CivText.bodyMedium(
                  'Work on your Top 10 company targets first - define, research and gather information about them. Being informed will help you engage in more meaningful conversations with insiders and hiring managers, become a much more appealing candidate and be able to better position yourself in networking conversations and especially at interviews.'),
              const SizedBox(height: Spacing.s_16),
              CivText.titleMedium(
                  'Guidelines on Researching Your Target Companies'),
              const SizedBox(height: Spacing.s_16),
              const BulletList(
                bullets: [
                  'What is the full name of the organisation and its location(s)?',
                  'How large is it (revenue, employees, product lines)?',
                  'What products/services does it provide?',
                  'How long has it been in business?',
                  'What has its growth pattern been and how well is it doing right now?',
                  'Who are the competitors?',
                  'Who are the key executives and hiring managers?',
                  'What needs does this organisation have that I might be able to fill?',
                  'How can you access business and annual reports?',
                  "What alerts will I set up to monitor 'happenings' in my target companies",
                  'Bookmark and review the individual websites of your target organisations',
                  'Review the “careers” tab on their websites frequently',
                  'Research issues and specific topics',
                  'Identify an industry or trade association likely to have information about the issue you are investigating and contact them',
                  'Identify and contact experts on a topic and reach out to them for information',
                  'Be familiar with the issues facing your target companies so you can speak intelligently to their needs and be a good “conversationalist” in and outside of interviews.'
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
