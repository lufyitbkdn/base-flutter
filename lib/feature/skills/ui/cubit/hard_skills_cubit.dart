import 'package:bloc/bloc.dart';
import 'package:civstart/feature/skills/skills.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'hard_skills_cubit.freezed.dart';

class HardSkillsCubit extends Cubit<HardSkillsState> {
  HardSkillsCubit({required this.skillsRepository})
      : super(const HardSkillsState.loading());

  static final log = Logger('HardSkillsCubit');

  @visibleForTesting
  final SkillsRepository skillsRepository;

  Future<void> load() async {
    emit(const HardSkillsState.loading());
    try {
      final selectedRankedHardSkill =
          await skillsRepository.loadRankedHardSkill();
      final rankedHardSkills = skillsRepository.rankedHardSkills;
      emit(
        HardSkillsState.loaded(
          rankedHardSkills: rankedHardSkills,
          selectedRankedHardSkill: selectedRankedHardSkill,
        ),
      );
    } catch (error, stacktrace) {
      log.severe(
          'Error while trying to load HardSkillsCubit', error, stacktrace);
      emit(const HardSkillsState.error());
    }
  }

  Future<void> save(RankedHardSkill rankedHardSkill) async {
    emit(const HardSkillsState.loading());
    try {
      await skillsRepository.saveRankedHardSkill(rankedHardSkill);
      emit(
        HardSkillsState.loaded(
          rankedHardSkills: skillsRepository.rankedHardSkills,
          selectedRankedHardSkill: rankedHardSkill,
        ),
      );
    } catch (error, stacktrace) {
      log.severe('Error while trying to save the Ranked Hard Skill', error,
          stacktrace);
      emit(const HardSkillsState.error());
    }
  }
}

@freezed
sealed class HardSkillsState with _$HardSkillsState {
  const factory HardSkillsState.loading() = HardSkillsStateLoading;

  const factory HardSkillsState.loaded({
    required List<RankedHardSkill> rankedHardSkills,
    RankedHardSkill? selectedRankedHardSkill,
  }) = HardSkillsStateLoaded;

  const factory HardSkillsState.error() = HardSkillsStateError;
}
