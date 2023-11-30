// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills_use_cases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SortedSkillsQuizResult _$$_SortedSkillsQuizResultFromJson(
        Map<String, dynamic> json) =>
    _$_SortedSkillsQuizResult(
      topSkills: (json['topSkills'] as List<dynamic>)
          .map((e) => $enumDecode(_$SkillEnumMap, e))
          .toList(),
      lowerSkills: (json['lowerSkills'] as List<dynamic>)
          .map((e) => $enumDecode(_$SkillEnumMap, e))
          .toList(),
      otherSkills: (json['otherSkills'] as List<dynamic>)
          .map((e) => $enumDecode(_$SkillEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$_SortedSkillsQuizResultToJson(
        _$_SortedSkillsQuizResult instance) =>
    <String, dynamic>{
      'topSkills': instance.topSkills.map((e) => _$SkillEnumMap[e]!).toList(),
      'lowerSkills':
          instance.lowerSkills.map((e) => _$SkillEnumMap[e]!).toList(),
      'otherSkills':
          instance.otherSkills.map((e) => _$SkillEnumMap[e]!).toList(),
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
