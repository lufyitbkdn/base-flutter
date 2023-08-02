import 'package:flutter/material.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/assets.dart';
import 'package:my_wo/feature/check_list/ui/view/check_list.dart';
import 'package:my_wo/feature/favourites/favorites.dart';
import 'package:my_wo/feature/tips_and_tricks/tips_and_tricks.dart';

class InterviewBeforePage extends StatefulWidget {
  const InterviewBeforePage({super.key});

  static const String routeName = 'tipsandtricks.interview.before';

  @override
  State<InterviewBeforePage> createState() => _InterviewBeforePageState();
}

class _InterviewBeforePageState extends State<InterviewBeforePage>
    with FavouritablePageMixin {
  final bloc = getIt<InterviewBeforeCubit>();

  @override
  final favourite = const Favourite(
    path: InterviewBeforePage.routeName,
    title: 'Before Your Interview',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody.sliver(
        title: 'Before Your Interview',
        svgIconPath: Assets.assets_images_ico_before_svg,
        iconColor: WoColors.orange,
        appBarActions: [favouriteAction],
        slivers: [
          SliverToBoxAdapter(
            child: PaddedContent(
              children: [
                const SizedBox(height: Spacing.s_16),
                WoText.bodyMedium(
                    'The best way to prepare yourself for answering questions about your skills and your accomplishments is to use the "STAR" technique.',),
                const SizedBox(height: Spacing.s_16),
                const WoStarQuestions(),
                const SizedBox(height: Spacing.l_32),
                WoText.titleMedium('Before your meeting checklist:'),
                const SizedBox(height: Spacing.s_16),
              ],
            ),
          ),
          ResetableCheckList(bloc: bloc),
          const SliverToBoxAdapter(
            child: SizedBox(height: Spacing.l_32),
          ),
        ],
      ),
    );
  }
}
