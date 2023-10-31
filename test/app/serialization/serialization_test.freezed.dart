// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'serialization_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SerializableClass _$SerializableClassFromJson(Map<String, dynamic> json) {
  return _SerializableClass.fromJson(json);
}

/// @nodoc
mixin _$SerializableClass {
  String get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SerializableClassCopyWith<SerializableClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SerializableClassCopyWith<$Res> {
  factory $SerializableClassCopyWith(
          SerializableClass value, $Res Function(SerializableClass) then) =
      _$SerializableClassCopyWithImpl<$Res, SerializableClass>;
  @useResult
  $Res call({String data});
}

/// @nodoc
class _$SerializableClassCopyWithImpl<$Res, $Val extends SerializableClass>
    implements $SerializableClassCopyWith<$Res> {
  _$SerializableClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SerializableClassCopyWith<$Res>
    implements $SerializableClassCopyWith<$Res> {
  factory _$$_SerializableClassCopyWith(_$_SerializableClass value,
          $Res Function(_$_SerializableClass) then) =
      __$$_SerializableClassCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String data});
}

/// @nodoc
class __$$_SerializableClassCopyWithImpl<$Res>
    extends _$SerializableClassCopyWithImpl<$Res, _$_SerializableClass>
    implements _$$_SerializableClassCopyWith<$Res> {
  __$$_SerializableClassCopyWithImpl(
      _$_SerializableClass _value, $Res Function(_$_SerializableClass) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_SerializableClass(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SerializableClass extends _SerializableClass {
  const _$_SerializableClass({required this.data}) : super._();

  factory _$_SerializableClass.fromJson(Map<String, dynamic> json) =>
      _$$_SerializableClassFromJson(json);

  @override
  final String data;

  @override
  String toString() {
    return 'SerializableClass(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SerializableClass &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SerializableClassCopyWith<_$_SerializableClass> get copyWith =>
      __$$_SerializableClassCopyWithImpl<_$_SerializableClass>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SerializableClassToJson(
      this,
    );
  }
}

abstract class _SerializableClass extends SerializableClass {
  const factory _SerializableClass({required final String data}) =
      _$_SerializableClass;
  const _SerializableClass._() : super._();

  factory _SerializableClass.fromJson(Map<String, dynamic> json) =
      _$_SerializableClass.fromJson;

  @override
  String get data;
  @override
  @JsonKey(ignore: true)
  _$$_SerializableClassCopyWith<_$_SerializableClass> get copyWith =>
      throw _privateConstructorUsedError;
}
