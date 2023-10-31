import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_list_data.freezed.dart';

part 'check_list_data.g.dart';

@freezed
sealed class CheckListItem with _$CheckListItem {
  const factory CheckListItem({
    required String title,
    required bool isChecked,
    String? subtitle,
  }) = _CheckListItem;

  const CheckListItem._();

  factory CheckListItem.fromJson(Map<String, Object?> json) => _$CheckListItemFromJson(json);
}
