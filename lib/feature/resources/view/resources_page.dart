import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/feature/favourites/favorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  static const String routeName = 'resources';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SectionSliverAppBar.svg(
            title: 'Resources',
            iconBackgroundColor: CivColors.purple,
            svgPath: Assets.assets_images_ico_resources_svg,
            backgroundImageAssetPath: Assets.assets_images_resources_header_png,
            expandedSystemOverlayStyle: SystemUiOverlayStyle.light,
            collapsedOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.m_25),
            sliver: SliverList.list(
              children: const [
                SizedBox(height: 5),
                // compensating for the app bar cut radius of 20
                ResourceCard(
                  title: 'Skill Recognition',
                  path:
                      'https://www.defence.gov.au/adf-members-families/transition/skill-recognition',
                  content:
                      'Australian Defence Force (ADF) members can have their military skills recognised through a national qualification before transitioning to civilian employment.',
                ),
                SizedBox(height: Spacing.s_16),
                ResourceCard(
                  title: 'Coaching and Support',
                  path:
                      'https://www.defence.gov.au/adf-members-families/transition/coaching-and-support',
                  content:
                      'Defence helps you and your family through the transition process by providing specialist support and programs.',
                ),
                SizedBox(height: Spacing.s_16),
                ResourceCard(
                  title: 'Transition Stories',
                  path:
                      'https://www.veteransemployment.gov.au/veterans/transition-stories',
                  content:
                      "Read the stories of other Veterans who've transitioned from their career in Defence.",
                ),
                SizedBox(height: Spacing.s_16),
                ResourceCard(
                  title: 'Veteran Friendly Employers',
                  path:
                      'https://www.veteransemployment.gov.au/show-your-commitment/commitment-supporters',
                  content:
                      "See organisations that have signed the Veterans' Employment Commitment (VEC) declaring they value the skills and experience of ex-ADF members and will consider veterans for employment opportunities.",
                ),
                SizedBox(height: Spacing.s_16),
                ResourceCard(
                  title: 'Transition Centres',
                  path:
                      'https://www.defence.gov.au/adf-members-families/local-services-events/transition-centres',
                  content:
                      'Transition support is offered through a national network of Transition Centres and is available to all members with more than one day of service.',
                ),
                SizedBox(height: Spacing.s_16),
                ResourceCard(
                  title: 'Navigating the Civilian Workplace',
                  path:
                      'https://www.veteransemployment.gov.au/veterans/civilian-workplace',
                  content:
                      'Civilian workplace culture can be quite different to the ADF.',
                ),
                SizedBox(height: Spacing.s_16),
                ResourceCard(
                  title: 'Translating Your Military Experience',
                  path:
                      'https://www.actrsl.org.au/veterans-employment/2022/4/13/translating-military-experience-for-your-civilian-cv',
                  content:
                      'How to sell yourself effectively and land the job you want in the civilian workforce.',
                ),
                SizedBox(height: Spacing.s_16),
                ResourceCard(
                  title: 'Defense Experience Roles',
                  path:
                      'https://www.workforceaustralia.gov.au/individuals/jobs/search?specialVacancyTypeCodes%5B0%5D=DFE',
                  content:
                      'See jobs currently advertised on Workforce Australia.',
                ),
                SizedBox(height: Spacing.s_16),
                ResourceCard(
                  title: 'Open Arms - Veterans & Families Councelling',
                  path: 'https://www.openarms.gov.au/',
                  content:
                      'Mental health support for Navy, Army and Air Force personnel, veterans & their families.',
                ),
                SizedBox(height: Spacing.s_16),
                ResourceCard(
                  title: 'State and Territory Forums',
                  path:
                      'https://www.dva.gov.au/about-us/overview/consultations-and-grants/how-we-consult-ex-service-community/state-and-territory/',
                  content:
                      "Forums where ex-service groups meet to give their views and advise on veterans' welfare issues.",
                ),
                SizedBox(height: Spacing.s_16),
                ResourceCard(
                  title: 'Young Veterans',
                  path: 'https://www.youngveterans.com.au/',
                  content:
                      'Young Veterans has set out to enrich the lives of Australian veterans by connecting them with their communities through active and social events.',
                ),
                SizedBox(height: Spacing.xl_48),
              ].annotateWithSystemUiOverlayStyle(SystemUiOverlayStyle.dark),
            ),
          ),
        ],
      ),
    );
  }
}

class ResourceCard extends StatefulWidget {
  const ResourceCard({
    required this.title,
    required this.path,
    required this.content,
    super.key,
  });

  final String title;
  final String path;
  final String content;

  @override
  State<ResourceCard> createState() => _ResourceCardState();
}

class _ResourceCardState extends State<ResourceCard>
    with FavouritablePageMixin {
  @override
  late final Favourite favourite = Favourite(
    title: widget.title,
    path: widget.path,
    isInternal: false,
  );

  @override
  Widget build(BuildContext context) {
    final urlLauncher = getIt<UrlLauncher>();

    return CivCard(
      title: widget.title,
      actionButton: favouriteAction,
      primaryButtonTitle: 'Visit',
      onPrimaryButtonPressed: () => urlLauncher.launchAUrl(widget.path),
      child: CivText.bodyMedium(widget.content),
    );
  }
}
