// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_list_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CheckListItem _$CheckListItemFromJson(Map<String, dynamic> json) {
  return _CheckListItem.fromJson(json);
}

/// @nodoc
mixin _$CheckListItem {
  String get title => throw _privateConstructorUsedError;

  bool get isChecked => throw _privateConstructorUsedError;

  String? get subtitle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckListItemCopyWith<CheckListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckListItemCopyWith<$Res> {
  factory $CheckListItemCopyWith(
          CheckListItem value, $Res Function(CheckListItem) then) =
      _$CheckListItemCopyWithImpl<$Res, CheckListItem>;

  @useResult
  $Res call({String title, bool isChecked, String? subtitle});
}

/// @nodoc
class _$CheckListItemCopyWithImpl<$Res, $Val extends CheckListItem>
    implements $CheckListItemCopyWith<$Res> {
  _$CheckListItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? isChecked = null,
    Object? subtitle = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CheckListItemCopyWith<$Res>
    implements $CheckListItemCopyWith<$Res> {
  factory _$$_CheckListItemCopyWith(
          _$_CheckListItem value, $Res Function(_$_CheckListItem) then) =
      __$$_CheckListItemCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({String title, bool isChecked, String? subtitle});
}

/// @nodoc
class __$$_CheckListItemCopyWithImpl<$Res>
    extends _$CheckListItemCopyWithImpl<$Res, _$_CheckListItem>
    implements _$$_CheckListItemCopyWith<$Res> {
  __$$_CheckListItemCopyWithImpl(
      _$_CheckListItem _value, $Res Function(_$_CheckListItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? isChecked = null,
    Object? subtitle = freezed,
  }) {
    return _then(_$_CheckListItem(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CheckListItem extends _CheckListItem with DiagnosticableTreeMixin {
  const _$_CheckListItem(
      {required this.title, required this.isChecked, this.subtitle})
      : super._();

  factory _$_CheckListItem.fromJson(Map<String, dynamic> json) =>
      _$$_CheckListItemFromJson(json);

  @override
  final String title;
  @override
  final bool isChecked;
  @override
  final String? subtitle;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckListItem(title: $title, isChecked: $isChecked, subtitle: $subtitle)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckListItem'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('isChecked', isChecked))
      ..add(DiagnosticsProperty('subtitle', subtitle));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckListItem &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, isChecked, subtitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckListItemCopyWith<_$_CheckListItem> get copyWith =>
      __$$_CheckListItemCopyWithImpl<_$_CheckListItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckListItemToJson(
      this,
    );
  }
}

abstract class _CheckListItem extends CheckListItem {
  const factory _CheckListItem(
      {required final String title,
      required final bool isChecked,
      final String? subtitle}) = _$_CheckListItem;

  const _CheckListItem._() : super._();

  factory _CheckListItem.fromJson(Map<String, dynamic> json) =
      _$_CheckListItem.fromJson;

  @override
  String get title;

  @override
  bool get isChecked;

  @override
  String? get subtitle;

  @override
  @JsonKey(ignore: true)
  _$$_CheckListItemCopyWith<_$_CheckListItem> get copyWith =>
      throw _privateConstructorUsedError;
}
