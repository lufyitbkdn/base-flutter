import 'dart:convert';

import 'package:civstart/app/app.dart';
import 'package:civstart/feature/favourites/data/models/favourites_data.dart';
import 'package:flutter/foundation.dart';

class FavouritesRepository {
  FavouritesRepository({required this.localStorageDataSource});

  @visibleForTesting
  final LocalStorageDataSource localStorageDataSource;

  Set<Favourite>? _favouritesCache;

  Future<Set<Favourite>> getFavourites() async {
    if (_favouritesCache != null) {
      return _favouritesCache!;
    }

    final favouritesDataString = await read();

    if (favouritesDataString == null) {
      return _favouritesCache = {};
    }

    return _favouritesCache =
        deserializeJsonList(favouritesDataString, Favourite.fromJson).toSet();
  }

  @visibleForTesting
  Future<String?> read() => localStorageDataSource.read(StorageKey.favourites);

  @visibleForTesting
  Future<void> write(Set<Favourite> favourites) async {
    await localStorageDataSource.write(
      key: StorageKey.favourites,
      value: jsonEncode(favourites.toList()),
    );
  }

  Future<void> add(Favourite favourite) async {
    final cache = await getFavourites();
    final wasAdded = cache.add(favourite);

    if (wasAdded) {
      await write(cache);
    }
  }

  Future<void> remove(Favourite favourite) async {
    final cache = await getFavourites();
    final wasRemoved = cache.remove(favourite);

    if (wasRemoved) {
      await write(cache);
    }
  }
}
