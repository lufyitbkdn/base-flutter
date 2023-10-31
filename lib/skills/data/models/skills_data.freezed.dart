// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skills_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SkillQuestion _$SkillQuestionFromJson(Map<String, dynamic> json) {
  return _SkillQuestion.fromJson(json);
}

/// @nodoc
mixin _$SkillQuestion {
  Skill get skill => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SkillQuestionCopyWith<SkillQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillQuestionCopyWith<$Res> {
  factory $SkillQuestionCopyWith(
          SkillQuestion value, $Res Function(SkillQuestion) then) =
      _$SkillQuestionCopyWithImpl<$Res, SkillQuestion>;
  @useResult
  $Res call({Skill skill, String question});
}

/// @nodoc
class _$SkillQuestionCopyWithImpl<$Res, $Val extends SkillQuestion>
    implements $SkillQuestionCopyWith<$Res> {
  _$SkillQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skill = null,
    Object? question = null,
  }) {
    return _then(_value.copyWith(
      skill: null == skill
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as Skill,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SkillQuestionCopyWith<$Res>
    implements $SkillQuestionCopyWith<$Res> {
  factory _$$_SkillQuestionCopyWith(
          _$_SkillQuestion value, $Res Function(_$_SkillQuestion) then) =
      __$$_SkillQuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Skill skill, String question});
}

/// @nodoc
class __$$_SkillQuestionCopyWithImpl<$Res>
    extends _$SkillQuestionCopyWithImpl<$Res, _$_SkillQuestion>
    implements _$$_SkillQuestionCopyWith<$Res> {
  __$$_SkillQuestionCopyWithImpl(
      _$_SkillQuestion _value, $Res Function(_$_SkillQuestion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skill = null,
    Object? question = null,
  }) {
    return _then(_$_SkillQuestion(
      skill: null == skill
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as Skill,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SkillQuestion with DiagnosticableTreeMixin implements _SkillQuestion {
  const _$_SkillQuestion({required this.skill, required this.question});

  factory _$_SkillQuestion.fromJson(Map<String, dynamic> json) =>
      _$$_SkillQuestionFromJson(json);

  @override
  final Skill skill;
  @override
  final String question;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SkillQuestion(skill: $skill, question: $question)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SkillQuestion'))
      ..add(DiagnosticsProperty('skill', skill))
      ..add(DiagnosticsProperty('question', question));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SkillQuestion &&
            (identical(other.skill, skill) || other.skill == skill) &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, skill, question);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SkillQuestionCopyWith<_$_SkillQuestion> get copyWith =>
      __$$_SkillQuestionCopyWithImpl<_$_SkillQuestion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SkillQuestionToJson(
      this,
    );
  }
}

abstract class _SkillQuestion implements SkillQuestion {
  const factory _SkillQuestion(
      {required final Skill skill,
      required final String question}) = _$_SkillQuestion;

  factory _SkillQuestion.fromJson(Map<String, dynamic> json) =
      _$_SkillQuestion.fromJson;

  @override
  Skill get skill;
  @override
  String get question;
  @override
  @JsonKey(ignore: true)
  _$$_SkillQuestionCopyWith<_$_SkillQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

ScoredSkillQuestion _$ScoredSkillQuestionFromJson(Map<String, dynamic> json) {
  return _ScoredSkillQuestion.fromJson(json);
}

/// @nodoc
mixin _$ScoredSkillQuestion {
  SkillQuestion get skillQuestion => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScoredSkillQuestionCopyWith<ScoredSkillQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoredSkillQuestionCopyWith<$Res> {
  factory $ScoredSkillQuestionCopyWith(
          ScoredSkillQuestion value, $Res Function(ScoredSkillQuestion) then) =
      _$ScoredSkillQuestionCopyWithImpl<$Res, ScoredSkillQuestion>;
  @useResult
  $Res call({SkillQuestion skillQuestion, int score});

  $SkillQuestionCopyWith<$Res> get skillQuestion;
}

/// @nodoc
class _$ScoredSkillQuestionCopyWithImpl<$Res, $Val extends ScoredSkillQuestion>
    implements $ScoredSkillQuestionCopyWith<$Res> {
  _$ScoredSkillQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skillQuestion = null,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      skillQuestion: null == skillQuestion
          ? _value.skillQuestion
          : skillQuestion // ignore: cast_nullable_to_non_nullable
              as SkillQuestion,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SkillQuestionCopyWith<$Res> get skillQuestion {
    return $SkillQuestionCopyWith<$Res>(_value.skillQuestion, (value) {
      return _then(_value.copyWith(skillQuestion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ScoredSkillQuestionCopyWith<$Res>
    implements $ScoredSkillQuestionCopyWith<$Res> {
  factory _$$_ScoredSkillQuestionCopyWith(_$_ScoredSkillQuestion value,
          $Res Function(_$_ScoredSkillQuestion) then) =
      __$$_ScoredSkillQuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SkillQuestion skillQuestion, int score});

  @override
  $SkillQuestionCopyWith<$Res> get skillQuestion;
}

/// @nodoc
class __$$_ScoredSkillQuestionCopyWithImpl<$Res>
    extends _$ScoredSkillQuestionCopyWithImpl<$Res, _$_ScoredSkillQuestion>
    implements _$$_ScoredSkillQuestionCopyWith<$Res> {
  __$$_ScoredSkillQuestionCopyWithImpl(_$_ScoredSkillQuestion _value,
      $Res Function(_$_ScoredSkillQuestion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skillQuestion = null,
    Object? score = null,
  }) {
    return _then(_$_ScoredSkillQuestion(
      skillQuestion: null == skillQuestion
          ? _value.skillQuestion
          : skillQuestion // ignore: cast_nullable_to_non_nullable
              as SkillQuestion,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScoredSkillQuestion
    with DiagnosticableTreeMixin
    implements _ScoredSkillQuestion {
  const _$_ScoredSkillQuestion(
      {required this.skillQuestion, required this.score});

  factory _$_ScoredSkillQuestion.fromJson(Map<String, dynamic> json) =>
      _$$_ScoredSkillQuestionFromJson(json);

  @override
  final SkillQuestion skillQuestion;
  @override
  final int score;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScoredSkillQuestion(skillQuestion: $skillQuestion, score: $score)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScoredSkillQuestion'))
      ..add(DiagnosticsProperty('skillQuestion', skillQuestion))
      ..add(DiagnosticsProperty('score', score));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScoredSkillQuestion &&
            (identical(other.skillQuestion, skillQuestion) ||
                other.skillQuestion == skillQuestion) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, skillQuestion, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScoredSkillQuestionCopyWith<_$_ScoredSkillQuestion> get copyWith =>
      __$$_ScoredSkillQuestionCopyWithImpl<_$_ScoredSkillQuestion>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScoredSkillQuestionToJson(
      this,
    );
  }
}

abstract class _ScoredSkillQuestion implements ScoredSkillQuestion {
  const factory _ScoredSkillQuestion(
      {required final SkillQuestion skillQuestion,
      required final int score}) = _$_ScoredSkillQuestion;

  factory _ScoredSkillQuestion.fromJson(Map<String, dynamic> json) =
      _$_ScoredSkillQuestion.fromJson;

  @override
  SkillQuestion get skillQuestion;
  @override
  int get score;
  @override
  @JsonKey(ignore: true)
  _$$_ScoredSkillQuestionCopyWith<_$_ScoredSkillQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

RankedHardSkill _$RankedHardSkillFromJson(Map<String, dynamic> json) {
  return _RankedHardSkill.fromJson(json);
}

/// @nodoc
mixin _$RankedHardSkill {
  String get rank => throw _privateConstructorUsedError;
  List<String> get hardSkills => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RankedHardSkillCopyWith<RankedHardSkill> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankedHardSkillCopyWith<$Res> {
  factory $RankedHardSkillCopyWith(
          RankedHardSkill value, $Res Function(RankedHardSkill) then) =
      _$RankedHardSkillCopyWithImpl<$Res, RankedHardSkill>;
  @useResult
  $Res call({String rank, List<String> hardSkills});
}

/// @nodoc
class _$RankedHardSkillCopyWithImpl<$Res, $Val extends RankedHardSkill>
    implements $RankedHardSkillCopyWith<$Res> {
  _$RankedHardSkillCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? hardSkills = null,
  }) {
    return _then(_value.copyWith(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String,
      hardSkills: null == hardSkills
          ? _value.hardSkills
          : hardSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RankedHardSkillCopyWith<$Res>
    implements $RankedHardSkillCopyWith<$Res> {
  factory _$$_RankedHardSkillCopyWith(
          _$_RankedHardSkill value, $Res Function(_$_RankedHardSkill) then) =
      __$$_RankedHardSkillCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String rank, List<String> hardSkills});
}

/// @nodoc
class __$$_RankedHardSkillCopyWithImpl<$Res>
    extends _$RankedHardSkillCopyWithImpl<$Res, _$_RankedHardSkill>
    implements _$$_RankedHardSkillCopyWith<$Res> {
  __$$_RankedHardSkillCopyWithImpl(
      _$_RankedHardSkill _value, $Res Function(_$_RankedHardSkill) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? hardSkills = null,
  }) {
    return _then(_$_RankedHardSkill(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String,
      hardSkills: null == hardSkills
          ? _value._hardSkills
          : hardSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RankedHardSkill
    with DiagnosticableTreeMixin
    implements _RankedHardSkill {
  const _$_RankedHardSkill(
      {required this.rank, required final List<String> hardSkills})
      : _hardSkills = hardSkills;

  factory _$_RankedHardSkill.fromJson(Map<String, dynamic> json) =>
      _$$_RankedHardSkillFromJson(json);

  @override
  final String rank;
  final List<String> _hardSkills;
  @override
  List<String> get hardSkills {
    if (_hardSkills is EqualUnmodifiableListView) return _hardSkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hardSkills);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RankedHardSkill(rank: $rank, hardSkills: $hardSkills)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RankedHardSkill'))
      ..add(DiagnosticsProperty('rank', rank))
      ..add(DiagnosticsProperty('hardSkills', hardSkills));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RankedHardSkill &&
            (identical(other.rank, rank) || other.rank == rank) &&
            const DeepCollectionEquality()
                .equals(other._hardSkills, _hardSkills));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, rank, const DeepCollectionEquality().hash(_hardSkills));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RankedHardSkillCopyWith<_$_RankedHardSkill> get copyWith =>
      __$$_RankedHardSkillCopyWithImpl<_$_RankedHardSkill>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RankedHardSkillToJson(
      this,
    );
  }
}

abstract class _RankedHardSkill implements RankedHardSkill {
  const factory _RankedHardSkill(
      {required final String rank,
      required final List<String> hardSkills}) = _$_RankedHardSkill;

  factory _RankedHardSkill.fromJson(Map<String, dynamic> json) =
      _$_RankedHardSkill.fromJson;

  @override
  String get rank;
  @override
  List<String> get hardSkills;
  @override
  @JsonKey(ignore: true)
  _$$_RankedHardSkillCopyWith<_$_RankedHardSkill> get copyWith =>
      throw _privateConstructorUsedError;
}
