// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skills_use_cases.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SortedSkillsQuizResult _$SortedSkillsQuizResultFromJson(
    Map<String, dynamic> json) {
  return _SortedSkillsQuizResult.fromJson(json);
}

/// @nodoc
mixin _$SortedSkillsQuizResult {
  List<Skill> get topSkills => throw _privateConstructorUsedError;

  List<Skill> get lowerSkills => throw _privateConstructorUsedError;

  List<Skill> get otherSkills => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SortedSkillsQuizResultCopyWith<SortedSkillsQuizResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortedSkillsQuizResultCopyWith<$Res> {
  factory $SortedSkillsQuizResultCopyWith(SortedSkillsQuizResult value,
          $Res Function(SortedSkillsQuizResult) then) =
      _$SortedSkillsQuizResultCopyWithImpl<$Res, SortedSkillsQuizResult>;

  @useResult
  $Res call(
      {List<Skill> topSkills,
      List<Skill> lowerSkills,
      List<Skill> otherSkills});
}

/// @nodoc
class _$SortedSkillsQuizResultCopyWithImpl<$Res,
        $Val extends SortedSkillsQuizResult>
    implements $SortedSkillsQuizResultCopyWith<$Res> {
  _$SortedSkillsQuizResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topSkills = null,
    Object? lowerSkills = null,
    Object? otherSkills = null,
  }) {
    return _then(_value.copyWith(
      topSkills: null == topSkills
          ? _value.topSkills
          : topSkills // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      lowerSkills: null == lowerSkills
          ? _value.lowerSkills
          : lowerSkills // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      otherSkills: null == otherSkills
          ? _value.otherSkills
          : otherSkills // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SortedSkillsQuizResultCopyWith<$Res>
    implements $SortedSkillsQuizResultCopyWith<$Res> {
  factory _$$_SortedSkillsQuizResultCopyWith(_$_SortedSkillsQuizResult value,
          $Res Function(_$_SortedSkillsQuizResult) then) =
      __$$_SortedSkillsQuizResultCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {List<Skill> topSkills,
      List<Skill> lowerSkills,
      List<Skill> otherSkills});
}

/// @nodoc
class __$$_SortedSkillsQuizResultCopyWithImpl<$Res>
    extends _$SortedSkillsQuizResultCopyWithImpl<$Res,
        _$_SortedSkillsQuizResult>
    implements _$$_SortedSkillsQuizResultCopyWith<$Res> {
  __$$_SortedSkillsQuizResultCopyWithImpl(_$_SortedSkillsQuizResult _value,
      $Res Function(_$_SortedSkillsQuizResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topSkills = null,
    Object? lowerSkills = null,
    Object? otherSkills = null,
  }) {
    return _then(_$_SortedSkillsQuizResult(
      topSkills: null == topSkills
          ? _value._topSkills
          : topSkills // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      lowerSkills: null == lowerSkills
          ? _value._lowerSkills
          : lowerSkills // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
      otherSkills: null == otherSkills
          ? _value._otherSkills
          : otherSkills // ignore: cast_nullable_to_non_nullable
              as List<Skill>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SortedSkillsQuizResult
    with DiagnosticableTreeMixin
    implements _SortedSkillsQuizResult {
  const _$_SortedSkillsQuizResult(
      {required final List<Skill> topSkills,
      required final List<Skill> lowerSkills,
      required final List<Skill> otherSkills})
      : _topSkills = topSkills,
        _lowerSkills = lowerSkills,
        _otherSkills = otherSkills;

  factory _$_SortedSkillsQuizResult.fromJson(Map<String, dynamic> json) =>
      _$$_SortedSkillsQuizResultFromJson(json);

  final List<Skill> _topSkills;

  @override
  List<Skill> get topSkills {
    if (_topSkills is EqualUnmodifiableListView) return _topSkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topSkills);
  }

  final List<Skill> _lowerSkills;

  @override
  List<Skill> get lowerSkills {
    if (_lowerSkills is EqualUnmodifiableListView) return _lowerSkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lowerSkills);
  }

  final List<Skill> _otherSkills;

  @override
  List<Skill> get otherSkills {
    if (_otherSkills is EqualUnmodifiableListView) return _otherSkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherSkills);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SortedSkillsQuizResult(topSkills: $topSkills, lowerSkills: $lowerSkills, otherSkills: $otherSkills)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SortedSkillsQuizResult'))
      ..add(DiagnosticsProperty('topSkills', topSkills))
      ..add(DiagnosticsProperty('lowerSkills', lowerSkills))
      ..add(DiagnosticsProperty('otherSkills', otherSkills));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SortedSkillsQuizResult &&
            const DeepCollectionEquality()
                .equals(other._topSkills, _topSkills) &&
            const DeepCollectionEquality()
                .equals(other._lowerSkills, _lowerSkills) &&
            const DeepCollectionEquality()
                .equals(other._otherSkills, _otherSkills));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_topSkills),
      const DeepCollectionEquality().hash(_lowerSkills),
      const DeepCollectionEquality().hash(_otherSkills));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SortedSkillsQuizResultCopyWith<_$_SortedSkillsQuizResult> get copyWith =>
      __$$_SortedSkillsQuizResultCopyWithImpl<_$_SortedSkillsQuizResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SortedSkillsQuizResultToJson(
      this,
    );
  }
}

abstract class _SortedSkillsQuizResult implements SortedSkillsQuizResult {
  const factory _SortedSkillsQuizResult(
      {required final List<Skill> topSkills,
      required final List<Skill> lowerSkills,
      required final List<Skill> otherSkills}) = _$_SortedSkillsQuizResult;

  factory _SortedSkillsQuizResult.fromJson(Map<String, dynamic> json) =
      _$_SortedSkillsQuizResult.fromJson;

  @override
  List<Skill> get topSkills;

  @override
  List<Skill> get lowerSkills;

  @override
  List<Skill> get otherSkills;

  @override
  @JsonKey(ignore: true)
  _$$_SortedSkillsQuizResultCopyWith<_$_SortedSkillsQuizResult> get copyWith =>
      throw _privateConstructorUsedError;
}
