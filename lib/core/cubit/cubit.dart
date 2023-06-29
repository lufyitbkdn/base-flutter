import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{PROJECT_NAME}}/core/core.dart';

mixin EmitAsync<T> on Cubit<T> {
  Future<T> emitAsync(T state) async {
    emit(state);
    return state;
  }
}

class CubitState<T> extends Equatable {
  CubitState({
    this.status = CubitStatus.initialising,
    this.data,
    this.exception,
    this.stack,
    this.errorMessage = '',
    this.errorCode = 0,
  });

  final CubitStatus status;
  final T? data;
  final BaseException? exception;
  final StackTrace? stack;
  final String errorMessage;
  final int errorCode;
  final DateTime createdAt = DateTime.now();

  @override
  List<Object?> get props =>
      [status, data?.toString(), exception, stack, errorMessage, createdAt];

  CubitState<T> busy() => copyWith(status: CubitStatus.busy);

  CubitState<T> success(T data) =>
      copyWith(status: CubitStatus.idle, data: data);

  CubitState<T> navigate(T data) =>
      copyWith(status: CubitStatus.navigate, data: data);

  CubitState<T> error({
    Object? exception,
    StackTrace? stack,
    String? errorMessage,
    int errorCode = 0,
  }) {
    printError(
      exception,
      exception: exception,
      stack: stack,
    );
    final error = (exception is BaseException)
        ? exception.message
        : errorMessage ?? 'Unknown Error';
    return copyWith(
      status: CubitStatus.error,
      exception: (exception is BaseException) ? exception : null,
      stack: stack,
      errorMessage: error,
      errorCode: errorCode,
    );
  }

  CubitState<T> copyWith({
    CubitStatus? status,
    T? data,
    BaseException? exception,
    StackTrace? stack,
    String? errorMessage,
    int? errorCode = 0,
  }) {
    return CubitState<T>(
      data: data ?? this.data,
      status: status ?? this.status,
      exception: exception ?? this.exception,
      stack: stack ?? this.stack,
      errorMessage: errorMessage ?? this.errorMessage,
      errorCode: errorCode ?? this.errorCode,
    );
  }
}

/// AsyncDataCubit<T> abstracts success and error mappings and state emitting
/// logics
/// for many common api-fetch scenarios that don't require re-parametrization.
///
/// It will emit CubitState<T>, where T is the model to be used.
///
/// It only requires the asyncLoad() method to be overwritten and called.
/// If more functionality is required in a given cubit, it can just be added as
/// additional methods.
abstract class AsyncDataCubit<T> extends Cubit<CubitState<T>>
    with EmitAsync, AsyncMappers {
  AsyncDataCubit({
    T? initialData,
  }) : super(CubitState<T>(data: initialData)) {
    _data = initialData;
  }

  late final T? _data;

  Future<CubitState<T>> asyncLoad() async =>
      handleFuture(Future.value(state.data));

  Future<CubitState<T>> handleFuture(Future<T> future) {
    emit(state.busy());
    return future
        .then(
          mapResponse,
        )
        .onError(mapError)
        .then(emitAsync);
  }

  Future<CubitState<T>> handleFunction(Future<T> Function() service) =>
      handleFuture(service.call());

  void resetData() {
    emit(state.success(_data as T));
  }
}

mixin AsyncMappers<T> on Cubit<CubitState<T>> {
  Future<CubitState<T>> mapResponse(T data) async => state.success(data);

  Future<CubitState<T>> mapError(BaseException error, StackTrace stack) async {
    printError(
      error,
      exception: error,
      stack: stack,
    );
    return state.error(exception: error, stack: stack);
  }
}
