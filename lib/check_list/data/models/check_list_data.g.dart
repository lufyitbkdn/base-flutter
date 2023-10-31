// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CheckListItem _$$_CheckListItemFromJson(Map<String, dynamic> json) =>
    _$_CheckListItem(
      title: json['title'] as String,
      isChecked: json['isChecked'] as bool,
      subtitle: json['subtitle'] as String?,
    );

Map<String, dynamic> _$$_CheckListItemToJson(_$_CheckListItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'isChecked': instance.isChecked,
      'subtitle': instance.subtitle,
    };
