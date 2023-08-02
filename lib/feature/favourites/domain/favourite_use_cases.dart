import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:my_wo/feature/favourites/favorites.dart';

class IsFavouritedUseCase {
  IsFavouritedUseCase({required this.favouritesRepository});

  static final log = Logger('IsFavouritedUseCase');

  @visibleForTesting
  final FavouritesRepository favouritesRepository;

  Future<bool> call(Favourite favourite) async {
    try {
      final favourites = await favouritesRepository.getFavourites();
      return favourites.contains(favourite);
    } catch (e, s) {
      log.severe(
        'Error while trying to get if ${favourite.title} is favourited.',
        e,
        s,
      );
      return false;
    }
  }
}
