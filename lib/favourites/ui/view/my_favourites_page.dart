import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/favourites/favorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MyFavouritesPage extends StatefulWidget {
  const MyFavouritesPage({super.key});

  static const routeName = 'my_favourites';

  @override
  State<MyFavouritesPage> createState() => _MyFavouritesPageState();
}

class _MyFavouritesPageState extends State<MyFavouritesPage> {
  final bloc = getIt<MyFavouritesCubit>();

  @override
  void initState() {
    super.initState();
    bloc.load();

    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  }

  @override
  void dispose() {
    VisibilityDetectorController.instance.updateInterval = const Duration(milliseconds: 500);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key(MyFavouritesPage.routeName),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction == 1) {
          bloc.load();
        }
      },
      child: Scaffold(
        body: ContentBody.sliver(
          title: 'My Favourites',
          svgIconPath: Assets.assets_images_ico_fav_svg,
          iconColor: CivColors.pink,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kContentPaddingSpacing),
                child: CivText.bodyMedium('View the items you have favourited throughout the CivStart app. You can favourite items from our Job Search Steps, Tips and Tricks, and Resources pages.'),
              ),
            ),
            BlocBuilder<MyFavouritesCubit, MyFavouritesState>(
              bloc: bloc,
              builder: (context, state) {
                return switch (state) {
                  MyFavouritesStateLoading() || MyFavouritesStateError() => const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  MyFavouritesStateLoaded() => state.favourites.isEmpty
                      ? const SliverFillRemaining(
                          hasScrollBody: false,
                          child: EmptySection(),
                        )
                      : SliverPadding(
                          padding: const EdgeInsets.only(top: Spacing.l_32),
                          sliver: FavouritesSliver(favourites: state.favourites),
                        ),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}

class EmptySection extends StatelessWidget {
  const EmptySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kContentPaddingSpacing),
          child: CivText.titleMedium("You don't have any favourites"),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}

class FavouritesSliver extends StatelessWidget {
  FavouritesSliver({
    required this.favourites,
    super.key,
  });

  final List<Favourite> favourites;
  final urlLauncher = getIt<UrlLauncher>();

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: favourites.length,
      itemBuilder: (context, index) {
        final favourite = favourites[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: kContentPaddingSpacing, vertical: Spacing.xs_8),
          child: CivCard(
            title: favourite.title,
            subtitle: favourite.subtitle,
            primaryButtonTitle: 'View',
            onPrimaryButtonPressed: () {
              if (favourite.isInternal) {
                context.pushNamed(favourite.path);
              } else {
                urlLauncher.launchAUrl(favourite.path);
              }
            },
          ),
        );
      },
    );
  }
}
