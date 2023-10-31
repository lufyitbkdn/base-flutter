import 'dart:math';

import 'package:civstart/skills/skills.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<SkillsRepository>()])
import 'skills_use_cases_test.mocks.dart';

void main() {
  group('When sorting the skill quiz results', () {
    test('the top, lower and other skills should be separated and ordered by their scores', () async {
      final topScoredQuestion = [
        const ScoredSkillQuestion(skillQuestion: SkillQuestion(skill: Skill.attentionToDetail, question: 'attentionToDetail question'), score: 20),
        const ScoredSkillQuestion(skillQuestion: SkillQuestion(skill: Skill.workEthic, question: 'workEthic question'), score: 19),
        const ScoredSkillQuestion(skillQuestion: SkillQuestion(skill: Skill.creativity, question: 'creativity question'), score: 18),
      ];

      final lowerScoredQuestion = [
        const ScoredSkillQuestion(skillQuestion: SkillQuestion(skill: Skill.interpersonal, question: 'interpersonal question'), score: 3),
        const ScoredSkillQuestion(skillQuestion: SkillQuestion(skill: Skill.problemSolving, question: 'problemSolving question'), score: 2),
        const ScoredSkillQuestion(skillQuestion: SkillQuestion(skill: Skill.communication, question: 'communication question'), score: 1),
      ];
      final otherScoredQuestion = [
        const ScoredSkillQuestion(skillQuestion: SkillQuestion(skill: Skill.leadership, question: 'leadership question'), score: 10),
        const ScoredSkillQuestion(skillQuestion: SkillQuestion(skill: Skill.timeManagement, question: 'timeManagement question'), score: 9),
        const ScoredSkillQuestion(skillQuestion: SkillQuestion(skill: Skill.adaptability, question: 'adaptability question'), score:8),
        const ScoredSkillQuestion(skillQuestion: SkillQuestion(skill: Skill.teamwork, question: 'teamwork question'), score: 7),
      ];

      // not a true random, so our tests have always the same results (if the Random implementation doesn't change).
      final random = Random(123);
      final scoredQuestions = [...topScoredQuestion, ...lowerScoredQuestion, ...otherScoredQuestion] //
        ..shuffle(random);

      final skillsRepository = MockSkillsRepository();
      when(skillsRepository.loadSoftSkillsQuizResult()).thenAnswer((_) async => scoredQuestions);

      final sortSkillQuizResultsUseCase = SortSkillQuizResultsUseCase(skillsRepository: skillsRepository);
      final sortedSkills = await sortSkillQuizResultsUseCase();

      List<Skill> mapScoredQuestionToSkills(List<ScoredSkillQuestion> scoredQuestion) {
        return scoredQuestion.map((question) => question.skillQuestion.skill).toList();
      }

      final topSkills = mapScoredQuestionToSkills(topScoredQuestion);
      final lowerSkills = mapScoredQuestionToSkills(lowerScoredQuestion);
      final otherSkills = mapScoredQuestionToSkills(otherScoredQuestion);

      expect(sortedSkills, isNotNull);
      expect(sortedSkills!.topSkills, orderedEquals(topSkills));
      expect(sortedSkills.lowerSkills, orderedEquals(lowerSkills));
      expect(sortedSkills.otherSkills, orderedEquals(otherSkills));
    });
  });
}
