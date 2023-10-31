import 'package:civstart/app/app.dart';
import 'package:civstart/favourites/favorites.dart';
import 'package:civstart/home/home.dart';
import 'package:civstart/jobsearch/jobsearch.dart';
import 'package:civstart/resources/resources.dart';
import 'package:civstart/skills/skills.dart';
import 'package:civstart/splash_screen/splash_screen.dart';
import 'package:civstart/tips_and_tricks/tips_and_tricks.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final RouteObserver<ModalRoute<void>> mySkillsRouteObserver = RouteObserver<ModalRoute<void>>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/${SplashScreen.routeName}',
  routes: [
    GoRoute(
      name: SplashScreen.routeName,
      path: '/${SplashScreen.routeName}',
      builder: (BuildContext context, GoRouterState state) => const SplashScreen(),
    ),
    StatefulShellRoute.indexedStack(
      pageBuilder: (context, state, navigationShell) {
        // Fade transition coming from the SplashScreen.
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: MainPage(navigationShell: navigationShell),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: HomePage.routeName,
              path: '/${HomePage.routeName}',
              builder: (BuildContext context, GoRouterState state) => const HomePage(),
              routes: <RouteBase>[
                // TODO(mfeinstein): [18/9/2023] Remove this route
                GoRoute(
                  name: HomePageDialog.routeName,
                  path: HomePageDialog.routeName,
                  pageBuilder: (BuildContext context, GoRouterState state) => DialogPage(builder: (_) => const HomePageDialog()),
                ),
                GoRoute(
                  name: MyFavouritesPage.routeName,
                  path: MyFavouritesPage.routeName,
                  builder: (BuildContext context, GoRouterState state) => const MyFavouritesPage(),
                ),
                GoRoute(
                  name: MoreInformationPage.routeName,
                  path: MoreInformationPage.routeName,
                  builder: (BuildContext context, GoRouterState state) => const MoreInformationPage(),
                  routes: [
                    GoRoute(
                      name: TermsAndConditionsPage.routeName,
                      path: TermsAndConditionsPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const TermsAndConditionsPage(),
                    ),
                    GoRoute(
                      name: PrivacyPolicyPage.routeName,
                      path: PrivacyPolicyPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const PrivacyPolicyPage(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          observers: [mySkillsRouteObserver],
          routes: [
            GoRoute(
              name: MySkillsPage.routeName,
              path: '/${MySkillsPage.routeName}',
              builder: (BuildContext context, GoRouterState state) => const MySkillsPage(),
              routes: [
                GoRoute(
                  name: SkillQuizPage.routeName,
                  path: SkillQuizPage.routeName,
                  builder: (BuildContext context, GoRouterState state) => const SkillQuizPage(),
                ),
                GoRoute(
                  name: SoftSkillsPage.routeName,
                  path: SoftSkillsPage.routeName,
                  builder: (BuildContext context, GoRouterState state) => const SoftSkillsPage(),
                ),
                GoRoute(
                  name: SkillQuizNotCompletedPage.routeName,
                  path: SkillQuizNotCompletedPage.routeName,
                  builder: (BuildContext context, GoRouterState state) => const SkillQuizNotCompletedPage(),
                ),
                GoRoute(
                  name: HardSkillsPage.routeName,
                  path: HardSkillsPage.routeName,
                  builder: (BuildContext context, GoRouterState state) => const HardSkillsPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: JobSearchPage.routeName,
              path: '/${JobSearchPage.routeName}',
              builder: (BuildContext context, GoRouterState state) => const JobSearchPage(),
              routes: <RouteBase>[
                GoRoute(
                  name: BeforeYouBeginPage.routeName,
                  path: BeforeYouBeginPage.routeName,
                  builder: (BuildContext context, GoRouterState state) => const BeforeYouBeginPage(),
                ),
                GoRoute(
                  name: PreparingForTheSearchPage.routeName,
                  path: PreparingForTheSearchPage.routeName,
                  builder: (BuildContext context, GoRouterState state) => const PreparingForTheSearchPage(),
                  routes: <RouteBase>[
                    GoRoute(
                      name: UnderstandingTheJobLandscapePage.routeName,
                      path: UnderstandingTheJobLandscapePage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const UnderstandingTheJobLandscapePage(),
                    ),
                    GoRoute(
                      name: YourProfessionalObjectivesPage.routeName,
                      path: YourProfessionalObjectivesPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const YourProfessionalObjectivesPage(),
                    ),
                    GoRoute(
                      name: YourCVAndProfilePage.routeName,
                      path: YourCVAndProfilePage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const YourCVAndProfilePage(),
                    ),
                    GoRoute(
                      name: GettingInFirstPage.routeName,
                      path: GettingInFirstPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const GettingInFirstPage(),
                    ),
                  ],
                ),
                GoRoute(
                  name: StartingYourJobSearchPage.routeName,
                  path: StartingYourJobSearchPage.routeName,
                  builder: (BuildContext context, GoRouterState state) => const StartingYourJobSearchPage(),
                  routes: <RouteBase>[
                    GoRoute(
                      name: AreYouTheWorldsSecretPage.routeName,
                      path: AreYouTheWorldsSecretPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const AreYouTheWorldsSecretPage(),
                    ),
                    GoRoute(
                      name: KnowledgeIsPowerPage.routeName,
                      path: KnowledgeIsPowerPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const KnowledgeIsPowerPage(),
                    ),
                    GoRoute(
                      name: TalkingToTheRightPeoplePage.routeName,
                      path: TalkingToTheRightPeoplePage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const TalkingToTheRightPeoplePage(),
                    ),
                    GoRoute(
                      name: WhatElseShouldIBeDoingPage.routeName,
                      path: WhatElseShouldIBeDoingPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const WhatElseShouldIBeDoingPage(),
                    ),
                  ],
                ),
                GoRoute(
                  name: FinishingYourJobSearchPage.routeName,
                  path: FinishingYourJobSearchPage.routeName,
                  builder: (BuildContext context, GoRouterState state) => const FinishingYourJobSearchPage(),
                  routes: <RouteBase>[
                    GoRoute(
                      name: InterviewsPage.routeName,
                      path: InterviewsPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const InterviewsPage(),
                    ),
                    GoRoute(
                      name: YouHaveLandedARolePage.routeName,
                      path: YouHaveLandedARolePage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const YouHaveLandedARolePage(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: TipsAndTricksPage.routeName,
              path: '/${TipsAndTricksPage.routeName}',
              builder: (BuildContext context, GoRouterState state) => const TipsAndTricksPage(),
              routes: [
                GoRoute(
                  name: CVPage.routeName,
                  path: CVPage.routeName,
                  builder: (BuildContext context, GoRouterState state) => const CVPage(),
                  routes: [
                    GoRoute(
                      name: CVGeneralTipsPage.routeName,
                      path: CVGeneralTipsPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const CVGeneralTipsPage(),
                    ),
                    GoRoute(
                      name: CVThingsToDoPage.routeName,
                      path: CVThingsToDoPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const CVThingsToDoPage(),
                    ),
                    GoRoute(
                      name: CVThingsToAvoidPage.routeName,
                      path: CVThingsToAvoidPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const CVThingsToAvoidPage(),
                    ),
                    GoRoute(
                      name: BeatingTheSystemPage.routeName,
                      path: BeatingTheSystemPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const BeatingTheSystemPage(),
                    ),
                  ],
                ),
                GoRoute(
                  name: CoverLetterPage.routeName,
                  path: CoverLetterPage.routeName,
                  builder: (BuildContext context, GoRouterState state) => const CoverLetterPage(),
                  routes: [
                    GoRoute(
                      name: CoverLetterGeneralTipsPage.routeName,
                      path: CoverLetterGeneralTipsPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const CoverLetterGeneralTipsPage(),
                    ),
                    GoRoute(
                      name: CoverLetterThingsToDoPage.routeName,
                      path: CoverLetterThingsToDoPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const CoverLetterThingsToDoPage(),
                    ),
                    GoRoute(
                      name: CoverLetterThingsToAvoidPage.routeName,
                      path: CoverLetterThingsToAvoidPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const CoverLetterThingsToAvoidPage(),
                    ),
                  ],
                ),
                GoRoute(
                  name: NetworkingPage.routeName,
                  path: NetworkingPage.routeName,
                  builder: (BuildContext context, GoRouterState state) => const NetworkingPage(),
                  routes: [
                    GoRoute(
                      name: NetworkingGeneralTipsPage.routeName,
                      path: NetworkingGeneralTipsPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const NetworkingGeneralTipsPage(),
                    ),
                    GoRoute(
                      name: NetworkingThingsToDoPage.routeName,
                      path: NetworkingThingsToDoPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const NetworkingThingsToDoPage(),
                    ),
                    GoRoute(
                      name: NetworkingThingsToAvoidPage.routeName,
                      path: NetworkingThingsToAvoidPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const NetworkingThingsToAvoidPage(),
                    ),
                  ],
                ),
                GoRoute(
                  name: InterviewPage.routeName,
                  path: InterviewPage.routeName,
                  builder: (BuildContext context, GoRouterState state) => const InterviewPage(),
                  routes: [
                    GoRoute(
                      name: InterviewBeforePage.routeName,
                      path: InterviewBeforePage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const InterviewBeforePage(),
                    ),
                    GoRoute(
                      name: InterviewDuringPage.routeName,
                      path: InterviewDuringPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const InterviewDuringPage(),
                    ),
                    GoRoute(
                      name: InterviewAfterPage.routeName,
                      path: InterviewAfterPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const InterviewAfterPage(),
                    ),
                    GoRoute(
                      name: InterviewPracticeQuestionsPage.routeName,
                      path: InterviewPracticeQuestionsPage.routeName,
                      builder: (BuildContext context, GoRouterState state) => const InterviewPracticeQuestionsPage(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: ResourcesPage.routeName,
              path: '/${ResourcesPage.routeName}',
              builder: (BuildContext context, GoRouterState state) => const ResourcesPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
