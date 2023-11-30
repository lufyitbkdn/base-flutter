import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/feature/favourites/favorites.dart';
import 'package:civstart/feature/home/home.dart';
import 'package:civstart/feature/jobsearch/view/jobsearch_page.dart';
import 'package:civstart/feature/resources/view/resources_page.dart';
import 'package:civstart/feature/skills/skills.dart';
import 'package:civstart/feature/tips_and_tricks/tips_and_tricks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

/// The main page of the app, acting as a shell for showing the pages selected by the
/// bottom [NavigationBar].
class MainPage extends StatelessWidget {
  const MainPage({required this.navigationShell, super.key});

  static const routeName = 'main';

  final StatefulNavigationShell navigationShell;

  void handleDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: handleDestinationSelected,
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.grid_view_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: NavigationDestinationIconSvg(
              svgPath: Assets.assets_images_patient_list_outlined_svg,
              isSeletected: navigationShell.currentIndex == 1,
            ),
            label: 'My Skills',
          ),
          NavigationDestination(
            icon: NavigationDestinationIconSvg(
              svgPath: Assets.assets_images_ico_jobsearch_svg,
              isSeletected: navigationShell.currentIndex == 2,
            ),
            label: 'Job Search',
          ),
          NavigationDestination(
            icon: NavigationDestinationIconSvg(
              svgPath: Assets.assets_images_ico_tips_svg,
              isSeletected: navigationShell.currentIndex == 3,
            ),
            label: 'Tips',
          ),
          NavigationDestination(
            icon: NavigationDestinationIconSvg(
              svgPath: Assets.assets_images_ico_resources_svg,
              isSeletected: navigationShell.currentIndex == 4,
            ),
            label: 'Resources',
          ),
        ],
      ),
    );
  }
}

class NavigationDestinationIconSvg extends StatelessWidget {
  const NavigationDestinationIconSvg({
    required this.svgPath,
    required this.isSeletected,
    super.key,
  });

  final String svgPath;
  final bool isSeletected;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      height: 30,
      colorFilter: ColorFilter.mode(
        isSeletected //
            ? Theme.of(context).navigationBarTheme.backgroundColor!
            : Theme.of(context).colorScheme.onSurface,
        BlendMode.srcIn,
      ),
    );
  }
}

/// The home page that's shown inside the [NavigationBar].
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> showWelcomeDialogIfNecessary() async {
    final homeRepository = getIt<HomeRepository>();
    final hasSeenWelcomeMessage =
        await homeRepository.loadHasSeenWelcomeMessage();
    if (!hasSeenWelcomeMessage) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await showDialog<void>(
            context: context, builder: (context) => const HomePageDialog());
        await homeRepository.saveHasSeenWelcomeMessage();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    showWelcomeDialogIfNecessary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            toolbarHeight: 85,
            pinned: true,
            stretch: true,
            centerTitle: false,
            title: Padding(
              padding: const EdgeInsets.only(left: Spacing.xs_8),
              child: SvgPicture.asset(
                Assets.assets_images_ico_logo_svg,
                height: 60,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () =>
                      context.goNamed(MoreInformationPage.routeName),
                  icon: const Icon(Icons.info_outline)),
              const SizedBox(width: Spacing.s_16),
            ],
          ),
          SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: kContentPaddingSpacing),
            sliver: SliverList.list(
              children: [
                ListTileButton.svg(
                  svgPath: Assets.assets_images_patient_list_outlined_svg,
                  color: CivColors.blue,
                  title: 'My Skills',
                  subtitle:
                      'Complete our quiz and learn about your soft and hard skills.',
                  onPressed: () => context.goNamed(MySkillsPage.routeName),
                ),
                const SizedBox(height: Spacing.s_16),
                ListTileButton.svg(
                  svgPath: Assets.assets_images_ico_jobsearch_svg,
                  color: CivColors.green,
                  title: 'My Job Search Steps',
                  subtitle:
                      'Follow these steps to help you succeed with your job search.',
                  onPressed: () => context.goNamed(JobSearchPage.routeName),
                ),
                const SizedBox(height: Spacing.s_16),
                ListTileButton.svg(
                  svgPath: Assets.assets_images_ico_tips_svg,
                  color: CivColors.orange,
                  title: 'Tips and Tricks',
                  subtitle:
                      'Tips to help with your CV, cover letter, network and interviews.',
                  onPressed: () => context.goNamed(TipsAndTricksPage.routeName),
                ),
                const SizedBox(height: Spacing.s_16),
                ListTileButton.svg(
                  svgPath: Assets.assets_images_ico_resources_svg,
                  color: CivColors.purple,
                  title: 'Resources',
                  subtitle: 'Resource to help veterans adapt to civilian life.',
                  onPressed: () => context.goNamed(ResourcesPage.routeName),
                ),
                const SizedBox(height: Spacing.s_16),
                ListTileButton.svg(
                  svgPath: Assets.assets_images_ico_fav_svg,
                  color: CivColors.pink,
                  title: 'My Favourites',
                  subtitle: 'Your saved favourite articles and resources.',
                  onPressed: () => context.goNamed(MyFavouritesPage.routeName),
                ),
                const SizedBox(height: Spacing.l_32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
