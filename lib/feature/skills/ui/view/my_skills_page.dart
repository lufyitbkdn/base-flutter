import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/feature/skills/skills.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MySkillsPage extends StatefulWidget {
  const MySkillsPage({super.key});

  static const String routeName = 'my_skills';

  @override
  State<MySkillsPage> createState() => _MySkillsPageState();
}

class _MySkillsPageState extends State<MySkillsPage> with RouteAware {
  final bloc = getIt<MySkillsCubit>();

  @override
  void didPush() {
    bloc.load();
  }

  @override
  void didPopNext() {
    bloc.load();
  }

  @override
  void initState() {
    super.initState();
    bloc.load();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mySkillsRouteObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    mySkillsRouteObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SectionSliverAppBar.svg(
            title: 'My Skills',
            svgPath: Assets.assets_images_patient_list_outlined_svg,
            iconBackgroundColor: CivColors.blue,
            backgroundImageAssetPath: Assets.assets_images_skill_header_png,
            collapsedOverlayStyle: SystemUiOverlayStyle.dark,
            expandedSystemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.m_25),
            sliver: SliverList.list(
              children: [
                const SizedBox(height: Spacing.s_16),
                CivText.bodyMedium(
                    'To be a good performer, you need a mix of both soft and hard skills.'),
                const SizedBox(height: Spacing.s_16),
                ListTileButton.svg(
                  svgPath: Assets.assets_images_ico_quiz_svg,
                  color: CivColors.blue,
                  title: 'Skills Quiz',
                  subtitle:
                      'Take the skills quiz to find out your soft skills.',
                  onPressed: () => context.goNamed(SkillQuizPage.routeName),
                ),
                const SizedBox(height: Spacing.s_16),
                BlocBuilder<MySkillsCubit, MySkillsState>(
                  bloc: bloc,
                  builder: (context, state) {
                    return ListTileButton.svg(
                      svgPath: Assets.assets_images_ico_skillsoft_svg,
                      color: CivColors.blue,
                      title: 'View Your Soft Skills',
                      subtitle:
                          'Personality traits, attitudes, and behaviours—things that come naturally to you.',
                      onPressed: () {
                        final nextRoute = switch (state) {
                          MySkillsStateHasSkillTest() =>
                            SoftSkillsPage.routeName,
                          MySkillsStateLoading() =>
                            SkillQuizNotCompletedPage.routeName,
                          MySkillsStateHasNotSkillTest() =>
                            SkillQuizNotCompletedPage.routeName,
                        };

                        context.goNamed(nextRoute);
                      },
                    );
                  },
                ),
                const SizedBox(height: Spacing.s_16),
                ListTileButton.svg(
                  svgPath: Assets.assets_images_ico_skillhard_svg,
                  color: CivColors.blue,
                  title: 'View Your Hard Skills',
                  subtitle:
                      'Specific abilities and capabilities that you have learnt and can demonstrate.',
                  onPressed: () => context.goNamed(HardSkillsPage.routeName),
                ),
              ].annotateWithSystemUiOverlayStyle(SystemUiOverlayStyle.dark),
            ),
          ),
        ],
      ),
    );
  }
}
