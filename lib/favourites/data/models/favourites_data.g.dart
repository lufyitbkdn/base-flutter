// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourites_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Favourite _$$_FavouriteFromJson(Map<String, dynamic> json) => _$_Favourite(
      title: json['title'] as String,
      path: json['path'] as String,
      isInternal: json['isInternal'] as bool,
      subtitle: json['subtitle'] as String?,
    );

Map<String, dynamic> _$$_FavouriteToJson(_$_Favourite instance) =>
    <String, dynamic>{
      'title': instance.title,
      'path': instance.path,
      'isInternal': instance.isInternal,
      'subtitle': instance.subtitle,
    };
