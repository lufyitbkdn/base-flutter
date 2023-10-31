import 'package:civstart/favourites/favorites.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'my_favourites_cubit.freezed.dart';

class MyFavouritesCubit extends Cubit<MyFavouritesState> {
  MyFavouritesCubit({required this.favouritesRepository}) : super(const MyFavouritesState.loading());

  static final log = Logger('MyFavouritesCubit');

  @visibleForTesting
  final FavouritesRepository favouritesRepository;

  Future<void> load() async {
    emit(const MyFavouritesState.loading());

    try {
      final favourites = await favouritesRepository.getFavourites();

      emit(MyFavouritesState.loaded(favourites: favourites.toList()));
    } catch (e, s) {
      log.severe('Error while trying to load the favourites', e, s);
      emit(const MyFavouritesState.error());
    }
  }
}

@freezed
sealed class MyFavouritesState with _$MyFavouritesState {
  const factory MyFavouritesState.loading() = MyFavouritesStateLoading;

  const factory MyFavouritesState.error() = MyFavouritesStateError;

  const factory MyFavouritesState.loaded({required List<Favourite> favourites}) = MyFavouritesStateLoaded;
}
