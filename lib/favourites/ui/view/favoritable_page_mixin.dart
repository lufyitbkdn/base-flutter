import 'package:civstart/app/app.dart';
import 'package:civstart/favourites/favorites.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

mixin FavouritablePageMixin<T extends StatefulWidget> on State<T> {
  final favouritesRepository = getIt<FavouritesRepository>();
  final isFavouritedUseCase = getIt<IsFavouritedUseCase>();

  static final log = Logger('FavouritablePageMixin');

  Favourite get favourite;

  Widget get favouriteAction {
    return isFavourited != null
        ? FavouriteAction(
            isFavourited: isFavourited!,
            onPressed: toggleFavourite,
          )
        : const SizedBox.shrink();
  }

  bool? isFavourited;

  Future<void> loadIsFavourite() async {
    final isFavourited = await isFavouritedUseCase(favourite);
    if (mounted) {
      setState(() => this.isFavourited = isFavourited);
    }
  }

  Future<void> toggleFavourite() async {
    final isFavourited = this.isFavourited;

    if (isFavourited == null) {
      return;
    }

    try {
      if (isFavourited) {
        await favouritesRepository.remove(favourite);
      } else {
        await favouritesRepository.add(favourite);
      }

      setState(() {
        this.isFavourited = !isFavourited;
      });
    } catch (e, s) {
      log.severe('Error while trying to toggle the favourite ${favourite.title}', e, s);
    }
  }

  @override
  void initState() {
    super.initState();
    loadIsFavourite();
    router.routerDelegate.addListener(loadIsFavourite);
  }

  @override
  void dispose() {
    router.routerDelegate.removeListener(loadIsFavourite);
    super.dispose();
  }
}
