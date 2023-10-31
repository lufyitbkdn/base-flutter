import 'package:civstart/skills/skills.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'soft_skills_cubit.freezed.dart';

class SoftSkillsCubit extends Cubit<SoftSkillsState> {
  SoftSkillsCubit({
    required this.sortSkillQuizResultsUseCase,
  }) : super(const SoftSkillsState.loading());

  static final log = Logger('SoftSkillsCubit');

  final SortSkillQuizResultsUseCase sortSkillQuizResultsUseCase;

  Future<void> load() async {
    emit(const SoftSkillsState.loading());

    try {
      final quizResult = await sortSkillQuizResultsUseCase();

      if (quizResult == null) {
        log.severe("Error: There are no skills result. The Soft Skills page shouldn't be open if there are no skills result");
        emit(const SoftSkillsState.errorLoading());
      } else {
        emit(
          SoftSkillsState.success(
            topSkills: quizResult.topSkills,
            lowerSkills: quizResult.lowerSkills,
            otherSkills: quizResult.otherSkills,
          ),
        );
      }
    } catch (e, s) {
      log.severe('Error while trying to load skills', e, s);
      emit(const SoftSkillsState.errorLoading());
    }
  }
}

@freezed
sealed class SoftSkillsState with _$SoftSkillsState {
  const factory SoftSkillsState.loading() = SoftSkillsStateLoading;

  const factory SoftSkillsState.errorLoading() = SoftSkillsStateErrorLoading;

  const factory SoftSkillsState.success({
    required List<Skill> topSkills,
    required List<Skill> lowerSkills,
    required List<Skill> otherSkills,
  }) = SoftSkillsStateSucess;
}
