import 'package:civstart/feature/skills/skills.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'skills_use_cases.freezed.dart';
part 'skills_use_cases.g.dart';

class HasCompletedSkillsQuizUseCase {
  HasCompletedSkillsQuizUseCase({required this.skillsRepository});

  @visibleForTesting
  final SkillsRepository skillsRepository;

  Future<bool> call() async {
    final softSkillsQuizResultsData =
        await skillsRepository.loadSoftSkillsQuizResult();
    return softSkillsQuizResultsData != null;
  }
}

class SortSkillQuizResultsUseCase {
  SortSkillQuizResultsUseCase({required this.skillsRepository});

  @visibleForTesting
  final SkillsRepository skillsRepository;

  Future<SortedSkillsQuizResult?> call() async {
    final softSkillsQuizResultsData =
        await skillsRepository.loadSoftSkillsQuizResult();

    if (softSkillsQuizResultsData == null) {
      return null;
    }

    // ignore: omit_local_variable_types
    final List<Skill> sortedSkills = groupBy(softSkillsQuizResultsData,
            (scoredQuestion) => scoredQuestion.skillQuestion.skill)
        .map((key, scoredQuestions) {
          return MapEntry(
            key,
            scoredQuestions.fold(
                0,
                (previousSum, scoredQuestion) =>
                    scoredQuestion.score + previousSum),
          );
        })
        .entries
        .sorted((entryA, entryB) => entryA.value.compareTo(entryB.value))
        .reversed
        .map((entry) => entry.key)
        .toList();

    if (sortedSkills.length < 6) {
      throw StateError(
          'There should be more than 6 skills, but there are only ${sortedSkills.length}');
    }

    final topSkills = sortedSkills.sublist(0, 3)..forEach(sortedSkills.remove);
    final lowerSkills = sortedSkills.sublist(sortedSkills.length - 3)
      ..forEach(sortedSkills.remove);
    final otherSkills = sortedSkills;

    return SortedSkillsQuizResult(
        topSkills: topSkills,
        lowerSkills: lowerSkills,
        otherSkills: otherSkills);
  }
}

@freezed
class SortedSkillsQuizResult with _$SortedSkillsQuizResult {
  const factory SortedSkillsQuizResult({
    required List<Skill> topSkills,
    required List<Skill> lowerSkills,
    required List<Skill> otherSkills,
  }) = _SortedSkillsQuizResult;

  factory SortedSkillsQuizResult.fromJson(Map<String, Object?> json) =>
      _$SortedSkillsQuizResultFromJson(json);
}
