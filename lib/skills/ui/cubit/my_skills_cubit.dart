import 'package:bloc/bloc.dart';
import 'package:civstart/skills/skills.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'my_skills_cubit.freezed.dart';

class MySkillsCubit extends Cubit<MySkillsState> {
  MySkillsCubit({required this.hasCompletedSkillsQuizUseCase}) : super(const MySkillsState.loading());

  static final log = Logger('MySkillsCubit');

  @visibleForTesting
  final HasCompletedSkillsQuizUseCase hasCompletedSkillsQuizUseCase;

  Future<void> load() async {
    emit(const MySkillsState.loading());

    try {
      final hasCompletedSkillsQuiz = await hasCompletedSkillsQuizUseCase();

      if (hasCompletedSkillsQuiz) {
        emit(const MySkillsState.hasSkillTest());
      } else {
        emit(const MySkillsState.hasNotSkillTest());
      }
    } catch (e, s) {
      log.severe('Error while trying to load skills', e, s);
      emit(const MySkillsState.hasNotSkillTest());
    }
  }
}

@freezed
sealed class MySkillsState with _$MySkillsState {
  const factory MySkillsState.loading() = MySkillsStateLoading;

  const factory MySkillsState.hasSkillTest() = MySkillsStateHasSkillTest;

  const factory MySkillsState.hasNotSkillTest() = MySkillsStateHasNotSkillTest;
}
