// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(List<CheckListItem> checkList) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(List<CheckListItem> checkList)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(List<CheckListItem> checkList)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckListStateLoading value) loading,
    required TResult Function(CheckListStateError value) error,
    required TResult Function(CheckListStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckListStateLoading value)? loading,
    TResult? Function(CheckListStateError value)? error,
    TResult? Function(CheckListStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckListStateLoading value)? loading,
    TResult Function(CheckListStateError value)? error,
    TResult Function(CheckListStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckListStateCopyWith<$Res> {
  factory $CheckListStateCopyWith(
          CheckListState value, $Res Function(CheckListState) then) =
      _$CheckListStateCopyWithImpl<$Res, CheckListState>;
}

/// @nodoc
class _$CheckListStateCopyWithImpl<$Res, $Val extends CheckListState>
    implements $CheckListStateCopyWith<$Res> {
  _$CheckListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckListStateLoadingCopyWith<$Res> {
  factory _$$CheckListStateLoadingCopyWith(_$CheckListStateLoading value,
          $Res Function(_$CheckListStateLoading) then) =
      __$$CheckListStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckListStateLoadingCopyWithImpl<$Res>
    extends _$CheckListStateCopyWithImpl<$Res, _$CheckListStateLoading>
    implements _$$CheckListStateLoadingCopyWith<$Res> {
  __$$CheckListStateLoadingCopyWithImpl(_$CheckListStateLoading _value,
      $Res Function(_$CheckListStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckListStateLoading
    with DiagnosticableTreeMixin
    implements CheckListStateLoading {
  const _$CheckListStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckListState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'CheckListState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckListStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(List<CheckListItem> checkList) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(List<CheckListItem> checkList)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(List<CheckListItem> checkList)? loaded,
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
    required TResult Function(CheckListStateLoading value) loading,
    required TResult Function(CheckListStateError value) error,
    required TResult Function(CheckListStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckListStateLoading value)? loading,
    TResult? Function(CheckListStateError value)? error,
    TResult? Function(CheckListStateLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckListStateLoading value)? loading,
    TResult Function(CheckListStateError value)? error,
    TResult Function(CheckListStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CheckListStateLoading implements CheckListState {
  const factory CheckListStateLoading() = _$CheckListStateLoading;
}

/// @nodoc
abstract class _$$CheckListStateErrorCopyWith<$Res> {
  factory _$$CheckListStateErrorCopyWith(_$CheckListStateError value,
          $Res Function(_$CheckListStateError) then) =
      __$$CheckListStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckListStateErrorCopyWithImpl<$Res>
    extends _$CheckListStateCopyWithImpl<$Res, _$CheckListStateError>
    implements _$$CheckListStateErrorCopyWith<$Res> {
  __$$CheckListStateErrorCopyWithImpl(
      _$CheckListStateError _value, $Res Function(_$CheckListStateError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckListStateError
    with DiagnosticableTreeMixin
    implements CheckListStateError {
  const _$CheckListStateError();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckListState.error()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'CheckListState.error'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckListStateError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(List<CheckListItem> checkList) loaded,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(List<CheckListItem> checkList)? loaded,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(List<CheckListItem> checkList)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckListStateLoading value) loading,
    required TResult Function(CheckListStateError value) error,
    required TResult Function(CheckListStateLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckListStateLoading value)? loading,
    TResult? Function(CheckListStateError value)? error,
    TResult? Function(CheckListStateLoaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckListStateLoading value)? loading,
    TResult Function(CheckListStateError value)? error,
    TResult Function(CheckListStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CheckListStateError implements CheckListState {
  const factory CheckListStateError() = _$CheckListStateError;
}

/// @nodoc
abstract class _$$CheckListStateLoadedCopyWith<$Res> {
  factory _$$CheckListStateLoadedCopyWith(_$CheckListStateLoaded value,
          $Res Function(_$CheckListStateLoaded) then) =
      __$$CheckListStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CheckListItem> checkList});
}

/// @nodoc
class __$$CheckListStateLoadedCopyWithImpl<$Res>
    extends _$CheckListStateCopyWithImpl<$Res, _$CheckListStateLoaded>
    implements _$$CheckListStateLoadedCopyWith<$Res> {
  __$$CheckListStateLoadedCopyWithImpl(_$CheckListStateLoaded _value,
      $Res Function(_$CheckListStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkList = null,
  }) {
    return _then(_$CheckListStateLoaded(
      checkList: null == checkList
          ? _value._checkList
          : checkList // ignore: cast_nullable_to_non_nullable
              as List<CheckListItem>,
    ));
  }
}

/// @nodoc

class _$CheckListStateLoaded
    with DiagnosticableTreeMixin
    implements CheckListStateLoaded {
  const _$CheckListStateLoaded({required final List<CheckListItem> checkList})
      : _checkList = checkList;

  final List<CheckListItem> _checkList;
  @override
  List<CheckListItem> get checkList {
    if (_checkList is EqualUnmodifiableListView) return _checkList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_checkList);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckListState.loaded(checkList: $checkList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckListState.loaded'))
      ..add(DiagnosticsProperty('checkList', checkList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckListStateLoaded &&
            const DeepCollectionEquality()
                .equals(other._checkList, _checkList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_checkList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckListStateLoadedCopyWith<_$CheckListStateLoaded> get copyWith =>
      __$$CheckListStateLoadedCopyWithImpl<_$CheckListStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(List<CheckListItem> checkList) loaded,
  }) {
    return loaded(checkList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(List<CheckListItem> checkList)? loaded,
  }) {
    return loaded?.call(checkList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(List<CheckListItem> checkList)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(checkList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckListStateLoading value) loading,
    required TResult Function(CheckListStateError value) error,
    required TResult Function(CheckListStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckListStateLoading value)? loading,
    TResult? Function(CheckListStateError value)? error,
    TResult? Function(CheckListStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckListStateLoading value)? loading,
    TResult Function(CheckListStateError value)? error,
    TResult Function(CheckListStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class CheckListStateLoaded implements CheckListState {
  const factory CheckListStateLoaded(
      {required final List<CheckListItem> checkList}) = _$CheckListStateLoaded;

  List<CheckListItem> get checkList;
  @JsonKey(ignore: true)
  _$$CheckListStateLoadedCopyWith<_$CheckListStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
