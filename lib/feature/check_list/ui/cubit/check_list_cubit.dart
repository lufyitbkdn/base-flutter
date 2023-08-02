import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:my_wo/feature/check_list/check_list.dart';

part 'check_list_cubit.freezed.dart';

class CheckListCubit extends Cubit<CheckListState> {
  CheckListCubit({required this.checklistRepository})
      : super(const CheckListState.loading());

  static final log = Logger('CheckListCubit');

  @visibleForTesting
  CheckListRepository checklistRepository;

  Future<void> load() async {
    try {
      emit(const CheckListState.loading());
      final checkList = await checklistRepository.load();
      if (checkList == null) {
        log.severe("Check list can't  be null but a null value was loaded");
        emit(const CheckListState.error());
        return;
      }
      emit(CheckListState.loaded(checkList: checkList));
    } catch (error, stacktrace) {
      log.severe('Error while trying to load checkList', error, stacktrace);
      emit(const CheckListState.error());
    }
  }

  Future<void> changeIsCheckedForIndex({
    required int index,
    required bool isChecked,
  }) async {
    final state = this.state;
    if (state is CheckListStateLoaded) {
      final checkListItem = state.checkList[index];
      final checkListCopy = [...state.checkList];
      checkListCopy[index] = checkListItem.copyWith(isChecked: isChecked);
      try {
        await checklistRepository.save(checkListCopy);
      } catch (error, stacktrace) {
        log.severe('Error while trying to save checkList', error, stacktrace);
        emit(const CheckListState.error());
      }
      emit(CheckListState.loaded(checkList: checkListCopy));
    }
  }

  Future<void> resetAll() async {
    final state = this.state;
    if (state is CheckListStateLoaded) {
      final resetedCheckList = state.checkList
          .map((checkListItem) => checkListItem.copyWith(isChecked: false))
          .toList();
      try {
        await checklistRepository.save(resetedCheckList);
      } catch (error, stacktrace) {
        log.severe('Error while trying to reset checkList', error, stacktrace);
        emit(const CheckListState.error());
      }
      emit(CheckListState.loaded(checkList: resetedCheckList));
    }
  }
}

@freezed
sealed class CheckListState with _$CheckListState {
  const factory CheckListState.loading() = CheckListStateLoading;

  const factory CheckListState.error() = CheckListStateError;

  const factory CheckListState.loaded({
    required List<CheckListItem> checkList,
  }) = CheckListStateLoaded;
}
