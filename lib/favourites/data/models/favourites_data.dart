import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourites_data.freezed.dart';

part 'favourites_data.g.dart';

@freezed
class Favourite with _$Favourite {
  const factory Favourite({
    required String title,
    required String path,
    required bool isInternal,
    String? subtitle,
  }) = _Favourite;

  const Favourite._();

  factory Favourite.fromJson(Map<String, Object?> json) => _$FavouriteFromJson(json);
}
