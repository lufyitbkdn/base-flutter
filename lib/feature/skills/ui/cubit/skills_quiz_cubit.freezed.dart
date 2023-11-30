// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skills_quiz_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SkillsQuizState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() errorLoading,
    required TResult Function() hasTakenSkillsQuiz,
    required TResult Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)
        takingSkillsQuiz,
    required TResult Function() savingSkillsQuizResults,
    required TResult Function() quizFinished,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? errorLoading,
    TResult? Function()? hasTakenSkillsQuiz,
    TResult? Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)?
        takingSkillsQuiz,
    TResult? Function()? savingSkillsQuizResults,
    TResult? Function()? quizFinished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? errorLoading,
    TResult Function()? hasTakenSkillsQuiz,
    TResult Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)?
        takingSkillsQuiz,
    TResult Function()? savingSkillsQuizResults,
    TResult Function()? quizFinished,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SkillsQuizStateLoading value) loading,
    required TResult Function(SkillsQuizStateErrorLoading value) errorLoading,
    required TResult Function(SkillsQuizStateHasTakenSkillsQuiz value)
        hasTakenSkillsQuiz,
    required TResult Function(SkillsQuizStateTakingSkillsQuiz value)
        takingSkillsQuiz,
    required TResult Function(SkillsQuizStateSavingSkillsQuizResults value)
        savingSkillsQuizResults,
    required TResult Function(SkillsQuizStateQuizFinished value) quizFinished,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SkillsQuizStateLoading value)? loading,
    TResult? Function(SkillsQuizStateErrorLoading value)? errorLoading,
    TResult? Function(SkillsQuizStateHasTakenSkillsQuiz value)?
        hasTakenSkillsQuiz,
    TResult? Function(SkillsQuizStateTakingSkillsQuiz value)? takingSkillsQuiz,
    TResult? Function(SkillsQuizStateSavingSkillsQuizResults value)?
        savingSkillsQuizResults,
    TResult? Function(SkillsQuizStateQuizFinished value)? quizFinished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SkillsQuizStateLoading value)? loading,
    TResult Function(SkillsQuizStateErrorLoading value)? errorLoading,
    TResult Function(SkillsQuizStateHasTakenSkillsQuiz value)?
        hasTakenSkillsQuiz,
    TResult Function(SkillsQuizStateTakingSkillsQuiz value)? takingSkillsQuiz,
    TResult Function(SkillsQuizStateSavingSkillsQuizResults value)?
        savingSkillsQuizResults,
    TResult Function(SkillsQuizStateQuizFinished value)? quizFinished,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillsQuizStateCopyWith<$Res> {
  factory $SkillsQuizStateCopyWith(
          SkillsQuizState value, $Res Function(SkillsQuizState) then) =
      _$SkillsQuizStateCopyWithImpl<$Res, SkillsQuizState>;
}

/// @nodoc
class _$SkillsQuizStateCopyWithImpl<$Res, $Val extends SkillsQuizState>
    implements $SkillsQuizStateCopyWith<$Res> {
  _$SkillsQuizStateCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SkillsQuizStateLoadingCopyWith<$Res> {
  factory _$$SkillsQuizStateLoadingCopyWith(_$SkillsQuizStateLoading value,
          $Res Function(_$SkillsQuizStateLoading) then) =
      __$$SkillsQuizStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SkillsQuizStateLoadingCopyWithImpl<$Res>
    extends _$SkillsQuizStateCopyWithImpl<$Res, _$SkillsQuizStateLoading>
    implements _$$SkillsQuizStateLoadingCopyWith<$Res> {
  __$$SkillsQuizStateLoadingCopyWithImpl(_$SkillsQuizStateLoading _value,
      $Res Function(_$SkillsQuizStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SkillsQuizStateLoading
    with DiagnosticableTreeMixin
    implements SkillsQuizStateLoading {
  const _$SkillsQuizStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SkillsQuizState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SkillsQuizState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SkillsQuizStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() errorLoading,
    required TResult Function() hasTakenSkillsQuiz,
    required TResult Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)
        takingSkillsQuiz,
    required TResult Function() savingSkillsQuizResults,
    required TResult Function() quizFinished,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? errorLoading,
    TResult? Function()? hasTakenSkillsQuiz,
    TResult? Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)?
        takingSkillsQuiz,
    TResult? Function()? savingSkillsQuizResults,
    TResult? Function()? quizFinished,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? errorLoading,
    TResult Function()? hasTakenSkillsQuiz,
    TResult Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)?
        takingSkillsQuiz,
    TResult Function()? savingSkillsQuizResults,
    TResult Function()? quizFinished,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SkillsQuizStateLoading value) loading,
    required TResult Function(SkillsQuizStateErrorLoading value) errorLoading,
    required TResult Function(SkillsQuizStateHasTakenSkillsQuiz value)
        hasTakenSkillsQuiz,
    required TResult Function(SkillsQuizStateTakingSkillsQuiz value)
        takingSkillsQuiz,
    required TResult Function(SkillsQuizStateSavingSkillsQuizResults value)
        savingSkillsQuizResults,
    required TResult Function(SkillsQuizStateQuizFinished value) quizFinished,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SkillsQuizStateLoading value)? loading,
    TResult? Function(SkillsQuizStateErrorLoading value)? errorLoading,
    TResult? Function(SkillsQuizStateHasTakenSkillsQuiz value)?
        hasTakenSkillsQuiz,
    TResult? Function(SkillsQuizStateTakingSkillsQuiz value)? takingSkillsQuiz,
    TResult? Function(SkillsQuizStateSavingSkillsQuizResults value)?
        savingSkillsQuizResults,
    TResult? Function(SkillsQuizStateQuizFinished value)? quizFinished,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SkillsQuizStateLoading value)? loading,
    TResult Function(SkillsQuizStateErrorLoading value)? errorLoading,
    TResult Function(SkillsQuizStateHasTakenSkillsQuiz value)?
        hasTakenSkillsQuiz,
    TResult Function(SkillsQuizStateTakingSkillsQuiz value)? takingSkillsQuiz,
    TResult Function(SkillsQuizStateSavingSkillsQuizResults value)?
        savingSkillsQuizResults,
    TResult Function(SkillsQuizStateQuizFinished value)? quizFinished,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SkillsQuizStateLoading implements SkillsQuizState {
  const factory SkillsQuizStateLoading() = _$SkillsQuizStateLoading;
}

/// @nodoc
abstract class _$$SkillsQuizStateErrorLoadingCopyWith<$Res> {
  factory _$$SkillsQuizStateErrorLoadingCopyWith(
          _$SkillsQuizStateErrorLoading value,
          $Res Function(_$SkillsQuizStateErrorLoading) then) =
      __$$SkillsQuizStateErrorLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SkillsQuizStateErrorLoadingCopyWithImpl<$Res>
    extends _$SkillsQuizStateCopyWithImpl<$Res, _$SkillsQuizStateErrorLoading>
    implements _$$SkillsQuizStateErrorLoadingCopyWith<$Res> {
  __$$SkillsQuizStateErrorLoadingCopyWithImpl(
      _$SkillsQuizStateErrorLoading _value,
      $Res Function(_$SkillsQuizStateErrorLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SkillsQuizStateErrorLoading
    with DiagnosticableTreeMixin
    implements SkillsQuizStateErrorLoading {
  const _$SkillsQuizStateErrorLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SkillsQuizState.errorLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SkillsQuizState.errorLoading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillsQuizStateErrorLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() errorLoading,
    required TResult Function() hasTakenSkillsQuiz,
    required TResult Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)
        takingSkillsQuiz,
    required TResult Function() savingSkillsQuizResults,
    required TResult Function() quizFinished,
  }) {
    return errorLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? errorLoading,
    TResult? Function()? hasTakenSkillsQuiz,
    TResult? Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)?
        takingSkillsQuiz,
    TResult? Function()? savingSkillsQuizResults,
    TResult? Function()? quizFinished,
  }) {
    return errorLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? errorLoading,
    TResult Function()? hasTakenSkillsQuiz,
    TResult Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)?
        takingSkillsQuiz,
    TResult Function()? savingSkillsQuizResults,
    TResult Function()? quizFinished,
    required TResult orElse(),
  }) {
    if (errorLoading != null) {
      return errorLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SkillsQuizStateLoading value) loading,
    required TResult Function(SkillsQuizStateErrorLoading value) errorLoading,
    required TResult Function(SkillsQuizStateHasTakenSkillsQuiz value)
        hasTakenSkillsQuiz,
    required TResult Function(SkillsQuizStateTakingSkillsQuiz value)
        takingSkillsQuiz,
    required TResult Function(SkillsQuizStateSavingSkillsQuizResults value)
        savingSkillsQuizResults,
    required TResult Function(SkillsQuizStateQuizFinished value) quizFinished,
  }) {
    return errorLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SkillsQuizStateLoading value)? loading,
    TResult? Function(SkillsQuizStateErrorLoading value)? errorLoading,
    TResult? Function(SkillsQuizStateHasTakenSkillsQuiz value)?
        hasTakenSkillsQuiz,
    TResult? Function(SkillsQuizStateTakingSkillsQuiz value)? takingSkillsQuiz,
    TResult? Function(SkillsQuizStateSavingSkillsQuizResults value)?
        savingSkillsQuizResults,
    TResult? Function(SkillsQuizStateQuizFinished value)? quizFinished,
  }) {
    return errorLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SkillsQuizStateLoading value)? loading,
    TResult Function(SkillsQuizStateErrorLoading value)? errorLoading,
    TResult Function(SkillsQuizStateHasTakenSkillsQuiz value)?
        hasTakenSkillsQuiz,
    TResult Function(SkillsQuizStateTakingSkillsQuiz value)? takingSkillsQuiz,
    TResult Function(SkillsQuizStateSavingSkillsQuizResults value)?
        savingSkillsQuizResults,
    TResult Function(SkillsQuizStateQuizFinished value)? quizFinished,
    required TResult orElse(),
  }) {
    if (errorLoading != null) {
      return errorLoading(this);
    }
    return orElse();
  }
}

abstract class SkillsQuizStateErrorLoading implements SkillsQuizState {
  const factory SkillsQuizStateErrorLoading() = _$SkillsQuizStateErrorLoading;
}

/// @nodoc
abstract class _$$SkillsQuizStateHasTakenSkillsQuizCopyWith<$Res> {
  factory _$$SkillsQuizStateHasTakenSkillsQuizCopyWith(
          _$SkillsQuizStateHasTakenSkillsQuiz value,
          $Res Function(_$SkillsQuizStateHasTakenSkillsQuiz) then) =
      __$$SkillsQuizStateHasTakenSkillsQuizCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SkillsQuizStateHasTakenSkillsQuizCopyWithImpl<$Res>
    extends _$SkillsQuizStateCopyWithImpl<$Res,
        _$SkillsQuizStateHasTakenSkillsQuiz>
    implements _$$SkillsQuizStateHasTakenSkillsQuizCopyWith<$Res> {
  __$$SkillsQuizStateHasTakenSkillsQuizCopyWithImpl(
      _$SkillsQuizStateHasTakenSkillsQuiz _value,
      $Res Function(_$SkillsQuizStateHasTakenSkillsQuiz) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SkillsQuizStateHasTakenSkillsQuiz
    with DiagnosticableTreeMixin
    implements SkillsQuizStateHasTakenSkillsQuiz {
  const _$SkillsQuizStateHasTakenSkillsQuiz();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SkillsQuizState.hasTakenSkillsQuiz()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'SkillsQuizState.hasTakenSkillsQuiz'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillsQuizStateHasTakenSkillsQuiz);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() errorLoading,
    required TResult Function() hasTakenSkillsQuiz,
    required TResult Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)
        takingSkillsQuiz,
    required TResult Function() savingSkillsQuizResults,
    required TResult Function() quizFinished,
  }) {
    return hasTakenSkillsQuiz();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? errorLoading,
    TResult? Function()? hasTakenSkillsQuiz,
    TResult? Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)?
        takingSkillsQuiz,
    TResult? Function()? savingSkillsQuizResults,
    TResult? Function()? quizFinished,
  }) {
    return hasTakenSkillsQuiz?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? errorLoading,
    TResult Function()? hasTakenSkillsQuiz,
    TResult Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)?
        takingSkillsQuiz,
    TResult Function()? savingSkillsQuizResults,
    TResult Function()? quizFinished,
    required TResult orElse(),
  }) {
    if (hasTakenSkillsQuiz != null) {
      return hasTakenSkillsQuiz();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SkillsQuizStateLoading value) loading,
    required TResult Function(SkillsQuizStateErrorLoading value) errorLoading,
    required TResult Function(SkillsQuizStateHasTakenSkillsQuiz value)
        hasTakenSkillsQuiz,
    required TResult Function(SkillsQuizStateTakingSkillsQuiz value)
        takingSkillsQuiz,
    required TResult Function(SkillsQuizStateSavingSkillsQuizResults value)
        savingSkillsQuizResults,
    required TResult Function(SkillsQuizStateQuizFinished value) quizFinished,
  }) {
    return hasTakenSkillsQuiz(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SkillsQuizStateLoading value)? loading,
    TResult? Function(SkillsQuizStateErrorLoading value)? errorLoading,
    TResult? Function(SkillsQuizStateHasTakenSkillsQuiz value)?
        hasTakenSkillsQuiz,
    TResult? Function(SkillsQuizStateTakingSkillsQuiz value)? takingSkillsQuiz,
    TResult? Function(SkillsQuizStateSavingSkillsQuizResults value)?
        savingSkillsQuizResults,
    TResult? Function(SkillsQuizStateQuizFinished value)? quizFinished,
  }) {
    return hasTakenSkillsQuiz?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SkillsQuizStateLoading value)? loading,
    TResult Function(SkillsQuizStateErrorLoading value)? errorLoading,
    TResult Function(SkillsQuizStateHasTakenSkillsQuiz value)?
        hasTakenSkillsQuiz,
    TResult Function(SkillsQuizStateTakingSkillsQuiz value)? takingSkillsQuiz,
    TResult Function(SkillsQuizStateSavingSkillsQuizResults value)?
        savingSkillsQuizResults,
    TResult Function(SkillsQuizStateQuizFinished value)? quizFinished,
    required TResult orElse(),
  }) {
    if (hasTakenSkillsQuiz != null) {
      return hasTakenSkillsQuiz(this);
    }
    return orElse();
  }
}

abstract class SkillsQuizStateHasTakenSkillsQuiz implements SkillsQuizState {
  const factory SkillsQuizStateHasTakenSkillsQuiz() =
      _$SkillsQuizStateHasTakenSkillsQuiz;
}

/// @nodoc
abstract class _$$SkillsQuizStateTakingSkillsQuizCopyWith<$Res> {
  factory _$$SkillsQuizStateTakingSkillsQuizCopyWith(
          _$SkillsQuizStateTakingSkillsQuiz value,
          $Res Function(_$SkillsQuizStateTakingSkillsQuiz) then) =
      __$$SkillsQuizStateTakingSkillsQuizCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ScoredSkillQuestion> scoredQuestions,
      int currentQuestionIndex,
      bool canSaveQuestions,
      bool canGoToPreviousQuestion,
      bool canGoToNextQuestion});
}

/// @nodoc
class __$$SkillsQuizStateTakingSkillsQuizCopyWithImpl<$Res>
    extends _$SkillsQuizStateCopyWithImpl<$Res,
        _$SkillsQuizStateTakingSkillsQuiz>
    implements _$$SkillsQuizStateTakingSkillsQuizCopyWith<$Res> {
  __$$SkillsQuizStateTakingSkillsQuizCopyWithImpl(
      _$SkillsQuizStateTakingSkillsQuiz _value,
      $Res Function(_$SkillsQuizStateTakingSkillsQuiz) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scoredQuestions = null,
    Object? currentQuestionIndex = null,
    Object? canSaveQuestions = null,
    Object? canGoToPreviousQuestion = null,
    Object? canGoToNextQuestion = null,
  }) {
    return _then(_$SkillsQuizStateTakingSkillsQuiz(
      scoredQuestions: null == scoredQuestions
          ? _value._scoredQuestions
          : scoredQuestions // ignore: cast_nullable_to_non_nullable
              as List<ScoredSkillQuestion>,
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      canSaveQuestions: null == canSaveQuestions
          ? _value.canSaveQuestions
          : canSaveQuestions // ignore: cast_nullable_to_non_nullable
              as bool,
      canGoToPreviousQuestion: null == canGoToPreviousQuestion
          ? _value.canGoToPreviousQuestion
          : canGoToPreviousQuestion // ignore: cast_nullable_to_non_nullable
              as bool,
      canGoToNextQuestion: null == canGoToNextQuestion
          ? _value.canGoToNextQuestion
          : canGoToNextQuestion // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SkillsQuizStateTakingSkillsQuiz
    with DiagnosticableTreeMixin
    implements SkillsQuizStateTakingSkillsQuiz {
  const _$SkillsQuizStateTakingSkillsQuiz(
      {required final List<ScoredSkillQuestion> scoredQuestions,
      required this.currentQuestionIndex,
      this.canSaveQuestions = false,
      this.canGoToPreviousQuestion = true,
      this.canGoToNextQuestion = true})
      : _scoredQuestions = scoredQuestions;

  final List<ScoredSkillQuestion> _scoredQuestions;
  @override
  List<ScoredSkillQuestion> get scoredQuestions {
    if (_scoredQuestions is EqualUnmodifiableListView) return _scoredQuestions;
// ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scoredQuestions);
  }

  @override
  final int currentQuestionIndex;
  @override
  @JsonKey()
  final bool canSaveQuestions;
  @override
  @JsonKey()
  final bool canGoToPreviousQuestion;
  @override
  @JsonKey()
  final bool canGoToNextQuestion;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SkillsQuizState.takingSkillsQuiz(scoredQuestions: $scoredQuestions, currentQuestionIndex: $currentQuestionIndex, canSaveQuestions: $canSaveQuestions, canGoToPreviousQuestion: $canGoToPreviousQuestion, canGoToNextQuestion: $canGoToNextQuestion)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SkillsQuizState.takingSkillsQuiz'))
      ..add(DiagnosticsProperty('scoredQuestions', scoredQuestions))
      ..add(DiagnosticsProperty('currentQuestionIndex', currentQuestionIndex))
      ..add(DiagnosticsProperty('canSaveQuestions', canSaveQuestions))
      ..add(DiagnosticsProperty(
          'canGoToPreviousQuestion', canGoToPreviousQuestion))
      ..add(DiagnosticsProperty('canGoToNextQuestion', canGoToNextQuestion));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillsQuizStateTakingSkillsQuiz &&
            const DeepCollectionEquality()
                .equals(other._scoredQuestions, _scoredQuestions) &&
            (identical(other.currentQuestionIndex, currentQuestionIndex) ||
                other.currentQuestionIndex == currentQuestionIndex) &&
            (identical(other.canSaveQuestions, canSaveQuestions) ||
                other.canSaveQuestions == canSaveQuestions) &&
            (identical(
                    other.canGoToPreviousQuestion, canGoToPreviousQuestion) ||
                other.canGoToPreviousQuestion == canGoToPreviousQuestion) &&
            (identical(other.canGoToNextQuestion, canGoToNextQuestion) ||
                other.canGoToNextQuestion == canGoToNextQuestion));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_scoredQuestions),
      currentQuestionIndex,
      canSaveQuestions,
      canGoToPreviousQuestion,
      canGoToNextQuestion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillsQuizStateTakingSkillsQuizCopyWith<_$SkillsQuizStateTakingSkillsQuiz>
      get copyWith => __$$SkillsQuizStateTakingSkillsQuizCopyWithImpl<
          _$SkillsQuizStateTakingSkillsQuiz>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() errorLoading,
    required TResult Function() hasTakenSkillsQuiz,
    required TResult Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)
        takingSkillsQuiz,
    required TResult Function() savingSkillsQuizResults,
    required TResult Function() quizFinished,
  }) {
    return takingSkillsQuiz(scoredQuestions, currentQuestionIndex,
        canSaveQuestions, canGoToPreviousQuestion, canGoToNextQuestion);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? errorLoading,
    TResult? Function()? hasTakenSkillsQuiz,
    TResult? Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)?
        takingSkillsQuiz,
    TResult? Function()? savingSkillsQuizResults,
    TResult? Function()? quizFinished,
  }) {
    return takingSkillsQuiz?.call(scoredQuestions, currentQuestionIndex,
        canSaveQuestions, canGoToPreviousQuestion, canGoToNextQuestion);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? errorLoading,
    TResult Function()? hasTakenSkillsQuiz,
    TResult Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)?
        takingSkillsQuiz,
    TResult Function()? savingSkillsQuizResults,
    TResult Function()? quizFinished,
    required TResult orElse(),
  }) {
    if (takingSkillsQuiz != null) {
      return takingSkillsQuiz(scoredQuestions, currentQuestionIndex,
          canSaveQuestions, canGoToPreviousQuestion, canGoToNextQuestion);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SkillsQuizStateLoading value) loading,
    required TResult Function(SkillsQuizStateErrorLoading value) errorLoading,
    required TResult Function(SkillsQuizStateHasTakenSkillsQuiz value)
        hasTakenSkillsQuiz,
    required TResult Function(SkillsQuizStateTakingSkillsQuiz value)
        takingSkillsQuiz,
    required TResult Function(SkillsQuizStateSavingSkillsQuizResults value)
        savingSkillsQuizResults,
    required TResult Function(SkillsQuizStateQuizFinished value) quizFinished,
  }) {
    return takingSkillsQuiz(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SkillsQuizStateLoading value)? loading,
    TResult? Function(SkillsQuizStateErrorLoading value)? errorLoading,
    TResult? Function(SkillsQuizStateHasTakenSkillsQuiz value)?
        hasTakenSkillsQuiz,
    TResult? Function(SkillsQuizStateTakingSkillsQuiz value)? takingSkillsQuiz,
    TResult? Function(SkillsQuizStateSavingSkillsQuizResults value)?
        savingSkillsQuizResults,
    TResult? Function(SkillsQuizStateQuizFinished value)? quizFinished,
  }) {
    return takingSkillsQuiz?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SkillsQuizStateLoading value)? loading,
    TResult Function(SkillsQuizStateErrorLoading value)? errorLoading,
    TResult Function(SkillsQuizStateHasTakenSkillsQuiz value)?
        hasTakenSkillsQuiz,
    TResult Function(SkillsQuizStateTakingSkillsQuiz value)? takingSkillsQuiz,
    TResult Function(SkillsQuizStateSavingSkillsQuizResults value)?
        savingSkillsQuizResults,
    TResult Function(SkillsQuizStateQuizFinished value)? quizFinished,
    required TResult orElse(),
  }) {
    if (takingSkillsQuiz != null) {
      return takingSkillsQuiz(this);
    }
    return orElse();
  }
}

abstract class SkillsQuizStateTakingSkillsQuiz implements SkillsQuizState {
  const factory SkillsQuizStateTakingSkillsQuiz(
      {required final List<ScoredSkillQuestion> scoredQuestions,
      required final int currentQuestionIndex,
      final bool canSaveQuestions,
      final bool canGoToPreviousQuestion,
      final bool canGoToNextQuestion}) = _$SkillsQuizStateTakingSkillsQuiz;

  List<ScoredSkillQuestion> get scoredQuestions;
  int get currentQuestionIndex;
  bool get canSaveQuestions;
  bool get canGoToPreviousQuestion;
  bool get canGoToNextQuestion;
  @JsonKey(ignore: true)
  _$$SkillsQuizStateTakingSkillsQuizCopyWith<_$SkillsQuizStateTakingSkillsQuiz>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SkillsQuizStateSavingSkillsQuizResultsCopyWith<$Res> {
  factory _$$SkillsQuizStateSavingSkillsQuizResultsCopyWith(
          _$SkillsQuizStateSavingSkillsQuizResults value,
          $Res Function(_$SkillsQuizStateSavingSkillsQuizResults) then) =
      __$$SkillsQuizStateSavingSkillsQuizResultsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SkillsQuizStateSavingSkillsQuizResultsCopyWithImpl<$Res>
    extends _$SkillsQuizStateCopyWithImpl<$Res,
        _$SkillsQuizStateSavingSkillsQuizResults>
    implements _$$SkillsQuizStateSavingSkillsQuizResultsCopyWith<$Res> {
  __$$SkillsQuizStateSavingSkillsQuizResultsCopyWithImpl(
      _$SkillsQuizStateSavingSkillsQuizResults _value,
      $Res Function(_$SkillsQuizStateSavingSkillsQuizResults) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SkillsQuizStateSavingSkillsQuizResults
    with DiagnosticableTreeMixin
    implements SkillsQuizStateSavingSkillsQuizResults {
  const _$SkillsQuizStateSavingSkillsQuizResults();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SkillsQuizState.savingSkillsQuizResults()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'SkillsQuizState.savingSkillsQuizResults'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillsQuizStateSavingSkillsQuizResults);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() errorLoading,
    required TResult Function() hasTakenSkillsQuiz,
    required TResult Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)
        takingSkillsQuiz,
    required TResult Function() savingSkillsQuizResults,
    required TResult Function() quizFinished,
  }) {
    return savingSkillsQuizResults();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? errorLoading,
    TResult? Function()? hasTakenSkillsQuiz,
    TResult? Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)?
        takingSkillsQuiz,
    TResult? Function()? savingSkillsQuizResults,
    TResult? Function()? quizFinished,
  }) {
    return savingSkillsQuizResults?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? errorLoading,
    TResult Function()? hasTakenSkillsQuiz,
    TResult Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)?
        takingSkillsQuiz,
    TResult Function()? savingSkillsQuizResults,
    TResult Function()? quizFinished,
    required TResult orElse(),
  }) {
    if (savingSkillsQuizResults != null) {
      return savingSkillsQuizResults();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SkillsQuizStateLoading value) loading,
    required TResult Function(SkillsQuizStateErrorLoading value) errorLoading,
    required TResult Function(SkillsQuizStateHasTakenSkillsQuiz value)
        hasTakenSkillsQuiz,
    required TResult Function(SkillsQuizStateTakingSkillsQuiz value)
        takingSkillsQuiz,
    required TResult Function(SkillsQuizStateSavingSkillsQuizResults value)
        savingSkillsQuizResults,
    required TResult Function(SkillsQuizStateQuizFinished value) quizFinished,
  }) {
    return savingSkillsQuizResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SkillsQuizStateLoading value)? loading,
    TResult? Function(SkillsQuizStateErrorLoading value)? errorLoading,
    TResult? Function(SkillsQuizStateHasTakenSkillsQuiz value)?
        hasTakenSkillsQuiz,
    TResult? Function(SkillsQuizStateTakingSkillsQuiz value)? takingSkillsQuiz,
    TResult? Function(SkillsQuizStateSavingSkillsQuizResults value)?
        savingSkillsQuizResults,
    TResult? Function(SkillsQuizStateQuizFinished value)? quizFinished,
  }) {
    return savingSkillsQuizResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SkillsQuizStateLoading value)? loading,
    TResult Function(SkillsQuizStateErrorLoading value)? errorLoading,
    TResult Function(SkillsQuizStateHasTakenSkillsQuiz value)?
        hasTakenSkillsQuiz,
    TResult Function(SkillsQuizStateTakingSkillsQuiz value)? takingSkillsQuiz,
    TResult Function(SkillsQuizStateSavingSkillsQuizResults value)?
        savingSkillsQuizResults,
    TResult Function(SkillsQuizStateQuizFinished value)? quizFinished,
    required TResult orElse(),
  }) {
    if (savingSkillsQuizResults != null) {
      return savingSkillsQuizResults(this);
    }
    return orElse();
  }
}

abstract class SkillsQuizStateSavingSkillsQuizResults
    implements SkillsQuizState {
  const factory SkillsQuizStateSavingSkillsQuizResults() =
      _$SkillsQuizStateSavingSkillsQuizResults;
}

/// @nodoc
abstract class _$$SkillsQuizStateQuizFinishedCopyWith<$Res> {
  factory _$$SkillsQuizStateQuizFinishedCopyWith(
          _$SkillsQuizStateQuizFinished value,
          $Res Function(_$SkillsQuizStateQuizFinished) then) =
      __$$SkillsQuizStateQuizFinishedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SkillsQuizStateQuizFinishedCopyWithImpl<$Res>
    extends _$SkillsQuizStateCopyWithImpl<$Res, _$SkillsQuizStateQuizFinished>
    implements _$$SkillsQuizStateQuizFinishedCopyWith<$Res> {
  __$$SkillsQuizStateQuizFinishedCopyWithImpl(
      _$SkillsQuizStateQuizFinished _value,
      $Res Function(_$SkillsQuizStateQuizFinished) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SkillsQuizStateQuizFinished
    with DiagnosticableTreeMixin
    implements SkillsQuizStateQuizFinished {
  const _$SkillsQuizStateQuizFinished();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SkillsQuizState.quizFinished()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SkillsQuizState.quizFinished'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillsQuizStateQuizFinished);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() errorLoading,
    required TResult Function() hasTakenSkillsQuiz,
    required TResult Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)
        takingSkillsQuiz,
    required TResult Function() savingSkillsQuizResults,
    required TResult Function() quizFinished,
  }) {
    return quizFinished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? errorLoading,
    TResult? Function()? hasTakenSkillsQuiz,
    TResult? Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)?
        takingSkillsQuiz,
    TResult? Function()? savingSkillsQuizResults,
    TResult? Function()? quizFinished,
  }) {
    return quizFinished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? errorLoading,
    TResult Function()? hasTakenSkillsQuiz,
    TResult Function(
            List<ScoredSkillQuestion> scoredQuestions,
            int currentQuestionIndex,
            bool canSaveQuestions,
            bool canGoToPreviousQuestion,
            bool canGoToNextQuestion)?
        takingSkillsQuiz,
    TResult Function()? savingSkillsQuizResults,
    TResult Function()? quizFinished,
    required TResult orElse(),
  }) {
    if (quizFinished != null) {
      return quizFinished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SkillsQuizStateLoading value) loading,
    required TResult Function(SkillsQuizStateErrorLoading value) errorLoading,
    required TResult Function(SkillsQuizStateHasTakenSkillsQuiz value)
        hasTakenSkillsQuiz,
    required TResult Function(SkillsQuizStateTakingSkillsQuiz value)
        takingSkillsQuiz,
    required TResult Function(SkillsQuizStateSavingSkillsQuizResults value)
        savingSkillsQuizResults,
    required TResult Function(SkillsQuizStateQuizFinished value) quizFinished,
  }) {
    return quizFinished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SkillsQuizStateLoading value)? loading,
    TResult? Function(SkillsQuizStateErrorLoading value)? errorLoading,
    TResult? Function(SkillsQuizStateHasTakenSkillsQuiz value)?
        hasTakenSkillsQuiz,
    TResult? Function(SkillsQuizStateTakingSkillsQuiz value)? takingSkillsQuiz,
    TResult? Function(SkillsQuizStateSavingSkillsQuizResults value)?
        savingSkillsQuizResults,
    TResult? Function(SkillsQuizStateQuizFinished value)? quizFinished,
  }) {
    return quizFinished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SkillsQuizStateLoading value)? loading,
    TResult Function(SkillsQuizStateErrorLoading value)? errorLoading,
    TResult Function(SkillsQuizStateHasTakenSkillsQuiz value)?
        hasTakenSkillsQuiz,
    TResult Function(SkillsQuizStateTakingSkillsQuiz value)? takingSkillsQuiz,
    TResult Function(SkillsQuizStateSavingSkillsQuizResults value)?
        savingSkillsQuizResults,
    TResult Function(SkillsQuizStateQuizFinished value)? quizFinished,
    required TResult orElse(),
  }) {
    if (quizFinished != null) {
      return quizFinished(this);
    }
    return orElse();
  }
}

abstract class SkillsQuizStateQuizFinished implements SkillsQuizState {
  const factory SkillsQuizStateQuizFinished() = _$SkillsQuizStateQuizFinished;
}
