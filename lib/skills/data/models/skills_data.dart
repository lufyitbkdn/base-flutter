import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'skills_data.freezed.dart';

part 'skills_data.g.dart';

@freezed
class SkillQuestion with _$SkillQuestion {
  const factory SkillQuestion({
    required Skill skill,
    required String question,
  }) = _SkillQuestion;

  factory SkillQuestion.fromJson(Map<String, dynamic> json) => _$SkillQuestionFromJson(json);
}

enum Skill {
  adaptability(
    fullName: 'Adaptability',
    description: "Adaptability can be defined as your ability to adjust to a change in conditions. Being able to learn from your mistakes and experiences help with your adaptability skill. An adaptable person is someone who is willing to experiment and test their ideas and learn from their results. In most cases, they don't see a mistake as a failure but instead take this upon them as a learning experience and a new opportunity. Being adaptable means that you can think ahead and are able to push forward when issues arise.",
  ),
  attentionToDetail(
    fullName: 'Attention to Detail',
    description: 'Being thorough when working in all aspects of a task regardless of how small shows your attention to detail. Having a strong attention to detail also requires you to have good planning skills; setting up checklists for yourself to complete to ensure nothing is missed out during production is a sign of working through a task thoroughly. Proofreading your work before submission will help you out in cases where you may have forgotten important pieces of information. By continually doing this with your work you will find it becoming an automatic process and will strengthen your attention to detail.',
  ),
  communication(
    fullName: 'Communication',
    description: 'Communication is the process of us expressing our ideas and sending and receiving messages to other people, this can be through verbal or non-verbal means. Some of the ways we communicate to others are through text, voice, images (such as graphs and charts) and through our own behaviour and body language. To have good communication skills means that your ideas and messages are expressed clearly to other people in ways that they can understand.',
  ),
  creativity(
    fullName: 'Creativity',
    description: 'Creativity is your ability to "think outside the box", this usually results in different ideas and approaches towards a task. It\'s the ability to turn the ideas floating around in your head into a reality. if you feel as though you think differently to other people who come up with ideas and solutions to problems other people may not have thought is a sign that you have strong creativity skills.',
  ),
  interpersonal(
    fullName: 'Interpersonal',
    description: 'Interpersonal skills are closely related to communication skills, they require you to be able to listen, question and understanding body language. Interpersonal skills also relate to your skills in emotional intelligence, or being able to understand and control your emotions and the emotions of others. Being able to communicate effectively with many different personality types without much conflict shows that you have strong interpersonal skills and are looked for in the workplace, as it shows that you can work collaboratively within a team effectively.',
  ),
  leadership(
    fullName: 'Leadership',
    description: 'Being a leader puts you in charge of a team, being a good leader requires you to have strong time management, communication and teamwork skills. A leader has to be able to delegate tasks to their team based off their individual skills and be able to manage their team ensuring that their team completed the appropriate tasks on scheduled time. Being a good leader doesn\'t mean "bossing" your team around but helping guide your team towards a common goal. If you find yourself easily being able to encourage and inspire your fellow peers you have the first steps to becoming a successful leader.',
  ),
  problemSolving(
    fullName: 'Problem Solving',
    description: 'When joining the workplace there are going to be problems that you will have to try to solve, these may be problems you can solve as a team and in some cases they may be problems that must be solved on your own. Having strong problem solving skills means that you can break down and define the problem, find multiple possible solutions and then implementing them into your work.',
  ),
  teamwork(
    fullName: 'Teamwork',
    description: "Teamwork is a soft skill that is about your ability to work together as a group to achieve a common goal. Being in a team requires you to use your individual skills to the teams advantage and requires you to give and listen to constructive feedback. It's important to be able to work well with people, and you will find in the workplace you will be exposed to different personalities that you will need to be able to work and communicate effectively with to ensure strong productivity in the company. Having empathy and thinking about others before yourself is a useful skill to have when it comes to teamwork.",
  ),
  timeManagement(
    fullName: 'Time Management',
    description: "Time management is the process of being able to organise your time effectively. Planning ahead of time how long you will delegate time on certain tasks and activities will give you better productivity and efficiency, and will ensure that you will be less stressed closer to due dates. if you're the type of person who doesn't find themselves leaving their work to the last minute you have strong time management skills. You have a strong understanding of how long tasks will take and have a higher quality of work.",
  ),
  workEthic(
    fullName: 'Work Ethic',
    description: "Having a strong work ethic requires you to be professional in your workplace, this usually involves coming to work on time, coming in looking clean and presentable and staying productive throughout the work day without much distraction. Being productive in the workplace and getting large amounts of work done on time shows that you have a strong work ethic that workplaces look for. Having strong communication and teamwork skills can help with your work ethic skills, as you don't see what you need to get done, you see what the team needs to get done in order for the company to succeed.",
  );

  const Skill({
    required this.fullName,
    required this.description,
  });

  final String fullName;
  final String description;
}

@freezed
class ScoredSkillQuestion with _$ScoredSkillQuestion {
  const factory ScoredSkillQuestion({
    required SkillQuestion skillQuestion,
    required int score,
  }) = _ScoredSkillQuestion;

  factory ScoredSkillQuestion.fromJson(Map<String, dynamic> json) => _$ScoredSkillQuestionFromJson(json);
}

@freezed
class RankedHardSkill with _$RankedHardSkill {
  const factory RankedHardSkill({
    required String rank,
    required List<String> hardSkills,
  }) = _RankedHardSkill;

  factory RankedHardSkill.fromJson(Map<String, dynamic> json) => _$RankedHardSkillFromJson(json);
}
