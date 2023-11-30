import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/feature/check_list/ui/view/check_list.dart';
import 'package:civstart/feature/favourites/favorites.dart';
import 'package:civstart/feature/tips_and_tricks/tips_and_tricks.dart';
import 'package:flutter/material.dart';

class InterviewAfterPage extends StatefulWidget {
  const InterviewAfterPage({super.key});

  static const String routeName = 'tipsandtricks.interview.after';

  @override
  State<InterviewAfterPage> createState() => _InterviewAfterPageState();
}

class _InterviewAfterPageState extends State<InterviewAfterPage>
    with FavouritablePageMixin {
  final bloc = getIt<InterviewAfterCubit>();
  @override
  final favourite = const Favourite(
    path: InterviewAfterPage.routeName,
    title: 'After Your Interview',
    isInternal: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody.sliver(
        title: 'After Your Interview',
        svgIconPath: Assets.assets_images_ico_after_svg,
        iconColor: CivColors.orange,
        appBarActions: [favouriteAction],
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: Spacing.s_16),
            sliver: ResetableCheckList(bloc: bloc),
          ),
        ],
      ),
    );
  }
}
