// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SkillQuestion _$$_SkillQuestionFromJson(Map<String, dynamic> json) =>
    _$_SkillQuestion(
      skill: $enumDecode(_$SkillEnumMap, json['skill']),
      question: json['question'] as String,
    );

Map<String, dynamic> _$$_SkillQuestionToJson(_$_SkillQuestion instance) =>
    <String, dynamic>{
      'skill': _$SkillEnumMap[instance.skill]!,
      'question': instance.question,
    };

const _$SkillEnumMap = {
  Skill.adaptability: 'adaptability',
  Skill.attentionToDetail: 'attentionToDetail',
  Skill.communication: 'communication',
  Skill.creativity: 'creativity',
  Skill.interpersonal: 'interpersonal',
  Skill.leadership: 'leadership',
  Skill.problemSolving: 'problemSolving',
  Skill.teamwork: 'teamwork',
  Skill.timeManagement: 'timeManagement',
  Skill.workEthic: 'workEthic',
};

_$_ScoredSkillQuestion _$$_ScoredSkillQuestionFromJson(
        Map<String, dynamic> json) =>
    _$_ScoredSkillQuestion(
      skillQuestion:
          SkillQuestion.fromJson(json['skillQuestion'] as Map<String, dynamic>),
      score: json['score'] as int,
    );

Map<String, dynamic> _$$_ScoredSkillQuestionToJson(
        _$_ScoredSkillQuestion instance) =>
    <String, dynamic>{
      'skillQuestion': instance.skillQuestion,
      'score': instance.score,
    };

_$_RankedHardSkill _$$_RankedHardSkillFromJson(Map<String, dynamic> json) =>
    _$_RankedHardSkill(
      rank: json['rank'] as String,
      hardSkills: (json['hardSkills'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_RankedHardSkillToJson(_$_RankedHardSkill instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'hardSkills': instance.hardSkills,
    };
