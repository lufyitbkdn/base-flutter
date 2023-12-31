import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:my_wo/app/app.dart';
import 'package:my_wo/feature/skills/skills.dart';

class SkillsRepository {
  SkillsRepository({required this.localStorageDataSource});

  @visibleForTesting
  final LocalStorageDataSource localStorageDataSource;

  Future<List<ScoredSkillQuestion>?> loadSoftSkillsQuizResult() async {
    final skillsQuizResultDataString =
        await localStorageDataSource.read(StorageKey.skillsQuizResults);

    if (skillsQuizResultDataString == null) {
      return null;
    }

    final json = jsonDecode(skillsQuizResultDataString) as List<dynamic>;
    final scoredQuestions = json.map((jsonItem) =>
        ScoredSkillQuestion.fromJson(jsonItem as Map<String, Object?>),);

    return List.unmodifiable(scoredQuestions);
  }

  Future<void> saveSoftSkillsQuizResult(
      List<ScoredSkillQuestion> scoredQuestionsData,) {
    return localStorageDataSource.write(
      key: StorageKey.skillsQuizResults,
      value: jsonEncode(scoredQuestionsData),
    );
  }

  Future<void> saveRankedHardSkill(RankedHardSkill rankedHardSkill) async {
    return localStorageDataSource.write(
      key: StorageKey.rankedHardSkill,
      value: jsonEncode(rankedHardSkill),
    );
  }

  Future<RankedHardSkill?> loadRankedHardSkill() async {
    final rankedSkillDataString =
        await localStorageDataSource.read(StorageKey.rankedHardSkill);

    if (rankedSkillDataString == null) {
      return null;
    }

    return RankedHardSkill.fromJson(
        jsonDecode(rankedSkillDataString) as Map<String, dynamic>,);
  }

  List<SkillQuestion> get skillQuestions => _skillQuestions;

  List<RankedHardSkill> get rankedHardSkills => _rankedHardSkills;

  Future<void> clear() =>
      localStorageDataSource.delete(StorageKey.skillsQuizResults);
}

const _skillQuestions = [
  SkillQuestion(
      question:
          'When I need to manage my tasks, I know what I need to get done first.',
      skill: Skill.timeManagement,),
  SkillQuestion(
      question: 'I can be relied upon when working with others.',
      skill: Skill.teamwork,),
  SkillQuestion(
      question: 'I make sure that I finish things on time.',
      skill: Skill.timeManagement,),
  SkillQuestion(
      question:
          'When talking to people about ideas, I always like to lead the conversation.',
      skill: Skill.leadership,),
  SkillQuestion(
      question:
          'When the requirements of a task change I am able to continue working confidently.',
      skill: Skill.adaptability,),
  SkillQuestion(
      question:
          'I notice when the quality of something is not up to standard or expectations.',
      skill: Skill.attentionToDetail,),
  SkillQuestion(
      question:
          'I enjoy teaching others and people are receptive to what I am teaching.',
      skill: Skill.interpersonal,),
  SkillQuestion(
      question:
          'If there is a problem or issue I use my communication skills to fix it.',
      skill: Skill.communication,),
  SkillQuestion(
      question:
          'I am happy to adapt or change to work better with other people.',
      skill: Skill.adaptability,),
  SkillQuestion(
      question:
          'I can recall all the little details and small pieces of events I attend or people I meet.',
      skill: Skill.attentionToDetail,),
  SkillQuestion(
      question:
          'When I have to make a decision, I will make sure this solution is the best one possible.',
      skill: Skill.problemSolving,),
  SkillQuestion(
      question: 'I find it annoying when others are late or forget things.',
      skill: Skill.timeManagement,),
  SkillQuestion(
      question:
          'When I encounter a setback, I always stay positive and keep going.',
      skill: Skill.workEthic,),
  SkillQuestion(
      question:
          'When I encounter a problem, I immediately begin to look for solutions.',
      skill: Skill.problemSolving,),
  SkillQuestion(
      question: 'I am able to clearly communicate my needs to others.',
      skill: Skill.communication,),
  SkillQuestion(
      question:
          'I am aware of the differences between leadership and management.',
      skill: Skill.leadership,),
  SkillQuestion(
      question: 'I will put in extra time to finish a task by the deadline.',
      skill: Skill.workEthic,),
  SkillQuestion(
      question:
          'I am good at making sure people understand what I am telling them.',
      skill: Skill.communication,),
  SkillQuestion(
      question: 'People often come to me to speak about their problems.',
      skill: Skill.interpersonal,),
  SkillQuestion(
      question:
          'I strive to come up with unique and creative solutions to problems.',
      skill: Skill.creativity,),
  SkillQuestion(
      question: 'I understand and empathise with what problems others have.',
      skill: Skill.interpersonal,),
  SkillQuestion(
      question: 'I am receptive to change and new ways of doing things.',
      skill: Skill.adaptability,),
  SkillQuestion(
      question: 'I can do work consistently without being distracted.',
      skill: Skill.workEthic,),
  SkillQuestion(
      question:
          'I enjoy designing things, creative thinking and seeing other peoples ideas.',
      skill: Skill.creativity,),
  SkillQuestion(
      question: 'I am good at leading groups with a clear direction.',
      skill: Skill.leadership,),
  SkillQuestion(
      question: 'I like working with others to solve problems.',
      skill: Skill.teamwork,),
  SkillQuestion(
      question:
          'I try to bring people together when organising in my social and professional circles.',
      skill: Skill.teamwork,),
  SkillQuestion(
      question: 'I am quick to come up with ideas and solutions to problems.',
      skill: Skill.problemSolving,),
  SkillQuestion(
      question:
          'I am good at remembering small details and instructions that I am given.',
      skill: Skill.attentionToDetail,),
  SkillQuestion(
      question:
          'I am proud of the unique ideas, solutions or designs that I come up with.',
      skill: Skill.creativity,),
];

const _rankedHardSkills = [
  RankedHardSkill(
    rank: 'Able Seaman (AB)',
    hardSkills: [
      'Apply ethical leadership skills & knowledge in the workplace',
      'Lead & develop an effective workplace team',
      'Support individual & team training',
      'Monitor, maintain & report workplace needs & training requirements',
      'Provide advice to supervisors & managers',
      'Communicate effectively (including presentations)',
      'Monitor & maintain safety protocols in the workplace',
      'Manage the effective use of workplace resources',
      'Manage workplace performance of junior staff members',
      'Coordinate the effective operation & security requirements of the workplace',
      'Plan & coordinate activities to meet workplace expectations in often complex, difficult & challenging environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Acting Sub Lieutenant (ASLT)',
    hardSkills: [
      'Learn & apply effective & ethical leadership with teams',
      'Support the development of teams',
      'Support individual & workplace training',
      'Assist in monitoring & reporting workplace capability & effectiveness',
      'Provide advice to supervisors',
      'Communicate effectively within the workplace',
      'Support the maintenance of safety in the workplace',
      'Assist in managing workplace resources',
      'Manage workplace performance of junior staff',
      'Assist with coordinating the operation & security of the workplace.',
      'Assist with planning & coordinating workplace activities in complex & challenging work environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Aircraftman/Aircraftwoman (AC/ACW)',
    hardSkills: [
      'Contribute to maintaining professional skills & professional accountability',
      'Provide advice consistent with management’s intent',
      'Communicate effectively (including presentations)',
      'Maintain equipment & resources in often difficult & demanding work conditions',
      'Adopt & apply appropriate measures to ensure a safe workplace',
      'Adopt & apply appropriate measures to ensure the security of the workplace',
      'Comply with policies, directives, governance requirements & standard operating procedures',
      'Comply with workplace expectations in often complex, difficult & challenging environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Bombardier (BDR) / Corporal (CPL)',
    hardSkills: [
      'Lead & manage small teams to achieve workplace goals & tasks',
      'Analyse directions & develop a plan to achieve goals & tasks',
      'Under minimal supervision, prepare & develop small teams',
      'Monitor & manage team welfare & workplace behaviour',
      'Deliver training & assessments in the workplace',
      'Provide advice to managers on workplace requirements & issues',
      'Communicate workplace requirements through written & verbal means to work crews',
      'Monitor, maintain & administer safety protocols in the workplace',
      'Monitor & manage the effective use of workplace resources',
      'Coordinate effective operation & security compliance in the workplace',
      'Analyse risks to operations & present opportunities to achieve satisfactory outcomes',
      'Plan & coordinate directions to meet management expectations within complex & challenging work environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Captain (CAPT)',
    hardSkills: [
      'Apply effective & ethical leadership of large teams',
      'Monitor, coach & mentor workplace supervisors & junior management staff',
      'Design, lead & manage individual & workgroup training & education in the workplace',
      'Contribute to & participate in planning for contingencies & organisational goals',
      'Analyse, plan, prepare & action large workplace activities',
      'Apply international standards in the workplace',
      'Monitor, maintain & report on workplace skilling needs, education & training',
      'Provide advice & assistance to executive level managers',
      'Oversee personnel & organisation administration in accordance with policies & procedures',
      'Communicate to wide audiences in writing and verbally',
      'Monitor & maintain safety & behavioural standards in the workplace',
      'Monitor, maintain & ensure equity & safety standards & behaviour in the workplace',
      'Plan & coordinate workplace activities in complex & challenging work environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Captain (CAPT-RAN)',
    hardSkills: [
      'Apply effective & ethical executive leadership & strategic management within a complex organisation',
      'Ensure organisational compliance with national & international legal obligations',
      'Lead organisational strategic initiatives & reform',
      'Assist with development of executive support teams & functions',
      'Consult & advise the executive on strategic workforce capability, workforce training & education needs, & future requirements',
      'Mentor executive & supporting staff',
      'Develop major goals to support organisational objectives',
      'Advise the executive on matters & issues affecting the organisation',
      'Employ highly advanced communication skills across the organisation & when representing the organisation',
      'Exercise due care & diligence of governance responsibilities, including equity & safety, across the organisation',
      'Analyse, determine & report to the executive on current & future resource requirements to meet organisational goals & objectives',
      'Oversee performance management & reporting of organisational staff, recruitment & contractor engagement',
      'Analyse & facilitate organisational requirements for security, welfare & wellbeing of staff & organisational activities/business within complex, difficult & challenging work environments',
      'Act as organisational executive representative in meetings, strategic planning or high-profile engagements',
    ],
  ),
  RankedHardSkill(
    rank: 'Chief Petty Officer (CPO)',
    hardSkills: [
      'Apply effective & ethical leadership across the organisation',
      'Develop skilled teams to meet organisational requirements',
      'Scope, deliver & support staff training across the organisation',
      'Monitor, maintain & report on workplace skilling needs',
      'Provide advice to executive level managers on personnel, workplace operations & governance requirements',
      'Monitor the morale, health & welfare of the organisation & advise senior level managers',
      'Communicate effectively across the organisation; often delivering briefings to large audiences',
      'Monitor, maintain & enforce standards in the workplace & across the organisation',
      'Prioritise, allocate & manage the effective use of an organisation’s logistics & resources',
      'Manage workplace performance & development of staff across the organisation',
      'Plan & coordinate workplace activities in complex & challenging environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Colonel (COL)',
    hardSkills: [
      'Apply effective & ethical executive leadership & strategic management within a complex organisation',
      'Ensure organisational compliance with national & international legal obligations',
      'Lead organisational strategic initiatives & reform',
      'Assist with development of executive support teams & functions',
      'Consult & advise the executive on strategic workforce capability, workforce training & education needs, & future requirements',
      'Mentor executive & supporting staff',
      'Develop major goals to support organisational objectives',
      'Advise the executive on matters & issues affecting the organisation',
      'Employ highly advanced communication skills across the organisation & when representing the organisation',
      'Exercise due care & diligence of governance responsibilities, including equity & safety, across the organisation',
      'Analyse, determine & report to the executive on current & future resource requirements to meet organisational goals & objectives',
      'Oversee performance management & reporting of organisational staff, recruitment & contractor engagement',
      'Analyse & facilitate organisational requirements for security, welfare & wellbeing of staff & organisational activities/business within complex, difficult & challenging work environments',
      'Act as organisational executive representative in meetings, strategic planning or high-profile engagements',
    ],
  ),
  RankedHardSkill(
    rank: 'Commander (CMDR)',
    hardSkills: [
      'Apply effective & ethical senior leadership to manage multiple, integrated large teams',
      'Oversee & conduct complex administration ensuring adherence to values & expectations',
      'Set the vision, purpose & goals, to focus & motivate all teams',
      'Recognise & adjust to changing situations using flexible leadership',
      'Manage organisational learning at a high level & ensure organisational technical & specialist knowledge',
      'Develop & manage a workforce able to work in complex, difficult & challenging environments',
      'Analyse, design & implement individual & group training & education to achieve goals',
      'Analyse, maintain & report on service resources to achieve organisational vision & goals',
      'Communicate with & provide strategic advice to senior executive leadership & managers',
      'Monitor, coach & mentor key subordinates',
      'Communicate effectively to inform, persuade, substantiate, negotiate or present information',
      'Ensure planning, activities & control measures meet policy guidelines & appropriate standards',
      'Apply, monitor & manage safety standards across the organisation',
      'Allocate & manage investigations, workplace/workforce actions & staff welfare issues',
      'Enact accountable governance responsibilities & ensure compliance with policy, standards & procedures',
      'Plan, allocate & manage organisational activities in often complex & challenging work environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Corporal (CPL)',
    hardSkills: [
      'Lead & manage small teams to achieve workplace goals & tasks',
      'Analyse directions & develop a plan to achieve goals & tasks',
      'Under minimal supervision, prepare & develop small teams',
      'Monitor & manage team welfare & workplace behaviour',
      'Deliver training & assessments in the workplace',
      'Provide advice to managers on workplace requirements & issues',
      'Communicate workplace requirements through written & verbal means to work crews',
      'Monitor, maintain & administer safety protocols in the workplace',
      'Monitor & manage the effective use of workplace resources',
      'Coordinate effective operation & security compliance in the workplace',
      'Analyse risks to operations & present opportunities to achieve satisfactory outcomes',
      'Plan & coordinate directions to meet management expectations within complex & challenging work environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Flight Lieutenant (FLTLT)',
    hardSkills: [
      'Apply effective & ethical leadership of large teams',
      'Monitor, coach & mentor workplace supervisors & junior management staff',
      'Design, lead & manage individual & workgroup training & education in the workplace',
      'Contribute to & participate in planning for contingencies & organisational goals',
      'Analyse, plan, prepare & action large workplace activities',
      'Apply international standards in the workplace',
      'Monitor, maintain & report on workplace skilling needs, education & training',
      'Provide advice & assistance to executive level managers',
      'Oversee personnel & organisation administration in accordance with policies & procedures',
      'Communicate to wide audiences in writing and verbally',
      'Monitor, audit & ensure compliance with organisational policy & governance requirements',
      'Monitor, maintain & ensure equity & safety standards & behaviour in the workplace',
      'Plan & coordinate workplace activities in complex & challenging work environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Flight Sergeant (FSGT)',
    hardSkills: [
      'Apply effective & ethical leadership across the organisation',
      'Develop skilled teams to meet organisational requirements',
      'Scope, deliver & support staff training across the organisation',
      'Monitor, maintain & report on workplace skilling needs',
      'Provide advice to executive level managers on personnel, workplace operations & governance requirements',
      'Monitor the morale, health & welfare of the organisation & advise senior level managers',
      'Communicate effectively across the organisation; often delivering briefings to large audiences',
      'Monitor, maintain & enforce standards in the workplace & across the organisation',
      'Prioritise, allocate & manage the effective use of an organisation’s logistics & resources',
      'Manage workplace performance & development of staff across the organisation',
      'Plan & coordinate workplace activities in complex & challenging environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Flying Officer (FLGOFF)',
    hardSkills: [
      'Apply effective & ethical leadership of small & large teams',
      'Counsel, coach, mentor & develop small & large teams in the workplace',
      'Monitor & manage team performance, administration & welfare in the workplace',
      'Monitor & manage effective use of team equipment & resources in the workplace',
      'Monitor, maintain & report workplace skilling development & training requirements',
      'Conduct workplace tasks & actions to achieve goals & outcomes',
      'Provide advice to senior managers to develop staff & achieve workplace goals & outcomes',
      'Communicate verbally and in writing with staff across all levels',
      'Monitor, manage & ensure safety standards in the workplace',
      'Plan & coordinate workplace activities in complex and challenging work environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Group Captain (GPCAPT)',
    hardSkills: [
      'Apply effective & ethical executive leadership & strategic management within a complex organisation',
      'Ensure organisational compliance with national & international legal obligations',
      'Lead organisational strategic initiatives & reform',
      'Assist with development of executive support teams & functions',
      'Consult & advise the executive on strategic workforce capability, workforce training & education needs, & future requirements',
      'Mentor executive & supporting staff',
      'Develop major goals to support organisational objectives',
      'Advise the executive on matters & issues affecting the organisation',
      'Employ highly advanced communication skills across the organisation & when representing the organisation',
      'Exercise due care & diligence of governance responsibilities, including equity & safety, across the organisation',
      'Analyse, determine & report to the executive on current & future resource requirements to meet organisational goals & objectives',
      'Oversee performance management & reporting of organisational staff, recruitment & contractor engagement',
      'Analyse & facilitate organisational requirements for security, welfare & wellbeing of staff & organisational activities/business within complex, difficult & challenging work environments',
      'Act as organisational executive representative in meetings, strategic planning or high-profile engagements',
    ],
  ),
  RankedHardSkill(
    rank: 'Lance Corporal/Lance Bombardier (LCPL/LBDR)',
    hardSkills: [
      'Apply ethical leadership skills & knowledge in the workplace',
      'Lead & develop an effective workplace team',
      'Support individual & team training',
      'Monitor, maintain & report workplace needs & training requirements',
      'Provide advice to supervisors & managers',
      'Communicate effectively (including presentations)',
      'Monitor & maintain safety protocols in the workplace',
      'Manage the effective use of workplace resources',
      'Manage workplace performance of junior staff members',
      'Coordinate the effective operation & security requirements of the workplace',
      'Plan & coordinate activities to meet workplace expectations in often complex, difficult & challenging environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Leading Aircraftman/Aircraftwoman (LAC/LACW)',
    hardSkills: [
      'Apply ethical leadership skills & knowledge in the workplace',
      'Lead & develop an effective workplace team',
      'Support individual & team training',
      'Monitor, maintain & report workplace needs & training requirements',
      'Provide advice to supervisors & managers',
      'Communicate effectively (including presentations)',
      'Monitor & maintain safety protocols in the workplace',
      'Manage the effective use of workplace resources',
      'Manage workplace performance of junior staff members',
      'Coordinate the effective operation & security requirements of the workplace',
      'Plan & coordinate activities to meet workplace expectations in often complex, difficult & challenging environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Leading Seaman (LS)',
    hardSkills: [
      'Lead & manage small teams to achieve workplace goals & tasks',
      'Analyse directions & develop a plan to achieve goals & tasks',
      'Under minimal supervision, prepare & develop small teams',
      'Monitor & manage team welfare & workplace behaviour',
      'Deliver training & assessments in the workplace',
      'Provide advice to managers on workplace requirements & issues',
      'Communicate workplace requirements through written & verbal means to work crews',
      'Monitor, maintain & administer safety protocols in the workplace',
      'Monitor & manage the effective use of workplace resources',
      'Coordinate effective operation & security compliance in the workplace',
      'Analyse risks to operations & present opportunities to achieve satisfactory outcomes',
      'Plan & coordinate directions to meet management expectations within complex & challenging work environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Lieutenant (LEUT)',
    hardSkills: [
      'Apply effective & ethical leadership of large teams',
      'Monitor, coach & mentor workplace supervisors & junior management staff',
      'Design, lead & manage individual & workgroup training & education in the workplace',
      'Contribute to & participate in planning for contingencies & organisational goals',
      'Analyse, plan, prepare & action large workplace activities',
      'Apply international standards in the workplace',
      'Monitor, maintain & report on workplace skilling needs, education & training',
      'Provide advice & assistance to executive level managers',
      'Oversee personnel & organisation administration in accordance with policies & procedures',
      'Communicate to wide audiences in writing and verbally',
      'Monitor & maintain safety & behavioural standards in the workplace',
      'Monitor, maintain & ensure equity & safety standards & behaviour in the workplace',
      'Plan & coordinate workplace activities in complex & challenging work environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Lieutenant (LT)',
    hardSkills: [
      'Apply effective & ethical leadership of small & large teams',
      'Counsel, coach, mentor & develop small & large teams in the workplace',
      'Monitor & manage team performance, administration & welfare in the workplace',
      'Monitor & manage effective use of team equipment & resources in the workplace',
      'Monitor, maintain & report workplace skilling development & training requirements',
      'Conduct workplace tasks & actions to achieve goals & outcomes',
      'Provide advice to senior managers to develop staff & achieve workplace goals & outcomes',
      'Communicate verbally and in writing with staff across all levels',
      'Monitor, manage & ensure safety standards in the workplace',
      'Plan & coordinate workplace activities in complex and challenging work environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Lieutenant Colonel (LTCOL)',
    hardSkills: [
      'Apply effective & ethical senior leadership to manage multiple, integrated large teams',
      'Oversee & conduct complex administration ensuring adherence to values & expectations',
      'Set the vision, purpose & goals, to focus & motivate all teams',
      'Recognise & adjust to changing situations using flexible leadership',
      'Manage organisational learning at a high level & ensure organisational technical & specialist knowledge',
      'Develop & manage a workforce able to work in complex, difficult & challenging environments',
      'Analyse, design & implement individual & group training & education to achieve goals',
      'Analyse, maintain & report on service resources to achieve organisational vision & goals',
      'Communicate with & provide strategic advice to senior executive leadership & managers',
      'Monitor, coach & mentor key subordinates',
      'Communicate effectively to inform, persuade, substantiate, negotiate or present information',
      'Ensure planning, activities & control measures meet policy guidelines & appropriate standards',
      'Apply, monitor & manage safety standards across the organisation',
      'Allocate & manage investigations, workplace/workforce actions & staff welfare issues',
      'Enact accountable governance responsibilities & ensure compliance with policy, standards & procedures',
      'Plan, allocate & manage organisational activities in often complex & challenging work environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Lieutenant Commander (LCDR)',
    hardSkills: [
      'Apply effective & ethical leadership to multiple organisational teams',
      'Oversee & conduct complex organisational administration',
      'Manage organisational learning; identify & develop technical & specialist knowledge of organisational teams',
      'Manage & develop a workforce able to work in complex, difficult & challenging environments',
      'Design, manage & implement individual & group training & education in the workplace',
      'Monitor, maintain & report on organisational skilling needs, education & training to meet organisational goals',
      'Provide trusted advice & support to senior management & executive',
      'Lead, coach & mentor junior managers & senior staff',
      'Communicate effectively with staff, management & executive to substantiate, negotiate & present information',
      'Ensure organisational plans, actions & controls meet national/ international standards & policy',
      'Monitor, manage & maintain equity, safety & behavioural standards across the organisation',
      'Manage internal investigations, workplace & workforce actions, & staff welfare issues',
      'Monitor, manage & ensure compliance with organisational policy & governance requirements',
      'Plan & manage organisational activities in complex & challenging work environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Major (MAJ)',
    hardSkills: [
      'Apply effective & ethical leadership to multiple organisational teams',
      'Oversee & conduct complex organisational administration',
      'Manage organisational learning; identify & develop technical & specialist knowledge of organisational teams',
      'Manage & develop a workforce able to work in complex, difficult & challenging environments',
      'Design, manage & implement individual & group training & education in the workplace',
      'Monitor, maintain & report on organisational skilling needs, education & training to meet organisational goals',
      'Provide trusted advice & support to senior management & executive',
      'Lead, coach & mentor junior managers & senior staff',
      'Communicate effectively with staff, management & executive to substantiate, negotiate & present information',
      'Ensure organisational plans, actions & controls meet national/ international standards & policy',
      'Monitor, manage & maintain equity, safety & behavioural standards across the organisation',
      'Manage internal investigations, workplace & workforce actions, & staff welfare issues',
      'Monitor, manage & ensure compliance with organisational policy & governance requirements',
      'Plan & manage organisational activities in complex & challenging work environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Petty Officer (PO)',
    hardSkills: [
      'Effective & ethical leadership of a large team',
      'Manage workplace performance & development of junior supervisors & their staff',
      'Apply expertise to training delivery & development to maintain skills essential to the functioning of the organisation',
      'Ensure compliance with policy, directives, instructions, regulations, standard operating procedures, & technical frameworks',
      'Communicate to wide audiences through presentations or written channels',
      'Analyse directions & identify options for conducting tasks',
      'Monitor the morale, health & welfare of the team',
      'Provide advice to senior staff on team issues & needs',
      'Manage logistical & resource requirements of a large team',
      'Ensure effective use of resources; advising on management of priorities & options',
      'Monitor, maintain & report workplace capability, including equity & safety',
      'Plan & coordinate workplace activities in frequently challenging environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Pilot Officer (PLTOFF)',
    hardSkills: [
      'Learn & apply effective & ethical leadership with teams',
      'Support the development of teams',
      'Support individual & workplace training',
      'Assist in monitoring & reporting workplace capability & effectiveness',
      'Provide advice to supervisors',
      'Communicate effectively within the workplace',
      'Support the maintenance of safety in the workplace',
      'Assist in managing workplace resources',
      'Manage workplace performance of junior staff',
      'Assist with coordinating the operation & security of the workplace.',
      'Assist with planning & coordinating workplace activities in complex & challenging work environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Private (PTE)',
    hardSkills: [
      'Contribute to maintaining professional skills & professional accountability',
      'Provide advice consistent with management’s intent',
      'Communicate effectively (including presentations)',
      'Maintain equipment & resources in often difficult & demanding work conditions',
      'Adopt & apply appropriate measures to ensure a safe workplace',
      'Adopt & apply appropriate measures to ensure the security of the workplace',
      'Comply with policies, directives, governance requirements & standard operating procedures',
      'Comply with workplace expectations in often complex, difficult & challenging environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Seaman (SMN)',
    hardSkills: [
      'Contribute to maintaining professional skills & professional accountability',
      'Provide advice consistent with management’s intent',
      'Communicate effectively (including presentations)',
      'Maintain equipment & resources in often difficult & demanding work conditions',
      'Adopt & apply appropriate measures to ensure a safe workplace',
      'Adopt & apply appropriate measures to ensure the security of the workplace',
      'Comply with policies, directives, governance requirements & standard operating procedures',
      'Comply with workplace expectations in often complex, difficult & challenging environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Second Lieutenant (2LT)',
    hardSkills: [
      'Learn & apply effective & ethical leadership with teams',
      'Support the development of teams',
      'Support individual & workplace training',
      'Assist in monitoring & reporting workplace capability & effectiveness',
      'Provide advice to supervisors',
      'Communicate effectively within the workplace',
      'Support the maintenance of safety in the workplace',
      'Assist in managing workplace resources',
      'Manage workplace performance of junior staff',
      'Assist with coordinating the operation & security of the workplace.',
      'Assist with planning & coordinating workplace activities in complex & challenging work environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Sergeant (SGT)',
    hardSkills: [
      'Effective & ethical leadership of a large team',
      'Manage workplace performance & development of junior supervisors & their staff',
      'Apply expertise to training delivery & development to maintain skills essential to the functioning of the organisation',
      'Ensure compliance with policy, directives, instructions, regulations, standard operating procedures, & technical frameworks',
      'Communicate to wide audiences through presentations or written channels',
      'Analyse directions & identify options for conducting tasks',
      'Monitor the morale, health & welfare of the team',
      'Provide advice to senior staff on team issues & needs',
      'Manage logistical & resource requirements of a large team',
      'Ensure effective use of resources; advising on management of priorities & options',
      'Monitor, maintain & report workplace capability, including equity & safety',
      'Plan & coordinate workplace activities in frequently challenging environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Sergeant/Staff Sergeant (SGT/SSGT)',
    hardSkills: [
      'Effective & ethical leadership of a large team',
      'Manage workplace performance & development of junior supervisors & their staff',
      'Apply expertise to training delivery & development to maintain skills essential to the functioning of the organisation',
      'Ensure compliance with policy, directives, instructions, regulations, standard operating procedures, & technical frameworks',
      'Communicate to wide audiences through presentations or written channels',
      'Analyse directions & identify options for conducting tasks',
      'Monitor the morale, health & welfare of the team',
      'Provide advice to senior staff on team issues & needs',
      'Manage logistical & resource requirements of a large team',
      'Ensure effective use of resources; advising on management of priorities & options',
      'Monitor, maintain & report workplace capability, including equity & safety',
      'Plan & coordinate workplace activities in frequently challenging environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Squadron Leader (SQNLDR)',
    hardSkills: [
      'Apply effective & ethical leadership to multiple organisational teams',
      'Oversee & conduct complex organisational administration',
      'Manage organisational learning; identify & develop technical & specialist knowledge of organisational teams',
      'Manage & develop a workforce able to work in complex, difficult & challenging environments',
      'Design, manage & implement individual & group training & education in the workplace',
      'Monitor, maintain & report on organisational skilling needs, education & training to meet organisational goals',
      'Provide trusted advice & support to senior management & executive',
      'Lead, coach & mentor junior managers & senior staff',
      'Communicate effectively with staff, management & executive to substantiate, negotiate & present information',
      'Ensure organisational plans, actions & controls meet national/ international standards & policy',
      'Monitor, manage & maintain equity, safety & behavioural standards across the organisation',
      'Manage internal investigations, workplace & workforce actions, & staff welfare issues',
      'Monitor, manage & ensure compliance with organisational policy & governance requirements',
      'Plan & manage organisational activities in complex & challenging work environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Sub Lieutenant (SBLT)',
    hardSkills: [
      'Apply effective & ethical leadership of small & large teams',
      'Counsel, coach, mentor & develop small & large teams in the workplace',
      'Monitor & manage team performance, administration & welfare in the workplace',
      'Monitor & manage effective use of team equipment & resources in the workplace',
      'Monitor, maintain & report workplace skilling development & training requirements',
      'Conduct workplace tasks & actions to achieve goals & outcomes',
      'Provide advice to senior managers to develop staff & achieve workplace goals & outcomes',
      'Communicate verbally and in writing with staff across all levels',
      'Monitor, manage & ensure safety standards in the workplace',
      'Plan & coordinate workplace activities in complex and challenging work environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Warrant Officer (WO)',
    hardSkills: [
      'Apply effective & ethical leadership across the organisation & in support of organisational direction',
      'Provide expert advice to the CEO & executive management to ensure staff are best prepared for organisational roles, including career management & tasks',
      'Use advanced communication skills within an executive team & the organisation',
      'Develop & lead specialist education in the organisation',
      'Analyse workplace development needs & provide advice to the executive for the ongoing development of all staff & teams',
      'Support & mentor senior supervisory & management staff',
      'Promote & ensure organisational tasks are executed lawfully, morally& ethically',
      'Ensure safety & equity standards are maintained across the organisation',
      'Prioritise & administer the strategic management of logistics & resources',
      'Monitor & oversee the organisation’s security & activities in complex & demanding environments',
      'Oversee & supervise the use of organisational, social & recreational resources to enhance deep-rooted professionalism & positive spirit in the workplace',
    ],
  ),
  RankedHardSkill(
    rank: 'Warrant Officer (WOFF)',
    hardSkills: [
      'Apply effective & ethical leadership across the organisation & in support of organisational direction',
      'Provide expert advice to the CEO & executive management to ensure staff are best prepared for organisational roles, including career management & tasks',
      'Use advanced communication skills within an executive team & the organisation',
      'Develop & lead specialist education in the organisation',
      'Analyse workplace development needs & provide advice to the executive for the ongoing development of all staff & teams',
      'Support & mentor senior supervisory & management staff',
      'Promote & ensure organisational tasks are executed lawfully, morally& ethically',
      'Ensure safety & equity standards are maintained across the organisation',
      'Prioritise & administer the strategic management of logistics & resources',
      'Monitor & oversee the organisation’s security & activities in complex & demanding environments',
      'Oversee & supervise the use of organisational, social & recreational resources to enhance deep-rooted professionalism & positive spirit in the workplace',
    ],
  ),
  RankedHardSkill(
    rank: 'Warrant Officer Class 1 (WO1)',
    hardSkills: [
      'Apply effective & ethical leadership across the organisation & in support of organisational direction',
      'Provide expert advice to the CEO & executive management to ensure staff are best prepared for organisational roles, including career management & tasks',
      'Use advanced communication skills within an executive team & the organisation',
      'Develop & lead specialist education in the organisation',
      'Analyse workplace development needs & provide advice to the executive for the ongoing development of all staff & teams',
      'Support & mentor senior supervisory & management staff',
      'Promote & ensure organisational tasks are executed lawfully, morally& ethically',
      'Ensure safety & equity standards are maintained across the organisation',
      'Prioritise & administer the strategic management of logistics & resources',
      'Monitor & oversee the organisation’s security & activities in complex & demanding environments',
      'Oversee & supervise the use of organisational, social & recreational resources to enhance deep-rooted professionalism & positive spirit in the workplace',
    ],
  ),
  RankedHardSkill(
    rank: 'Warrant Officer Class 2 (WO2)',
    hardSkills: [
      'Apply effective & ethical leadership across the organisation',
      'Develop skilled teams to meet organisational requirements',
      'Scope, deliver & support staff training across the organisation',
      'Monitor, maintain & report on workplace skilling needs',
      'Provide advice to executive level managers on personnel, workplace operations & governance requirements',
      'Monitor the morale, health & welfare of the organisation & advise senior level managers',
      'Communicate effectively across the organisation; often delivering briefings to large audiences',
      'Monitor, maintain & enforce standards in the workplace & across the organisation',
      'Prioritise, allocate & manage the effective use of an organisation’s logistics & resources',
      'Manage workplace performance & development of staff across the organisation',
      'Plan & coordinate workplace activities in complex & challenging environments',
    ],
  ),
  RankedHardSkill(
    rank: 'Wing Commander (WGCDR)',
    hardSkills: [
      'Apply effective & ethical senior leadership to manage multiple, integrated large teams',
      'Oversee & conduct complex administration ensuring adherence to values & expectations',
      'Set the vision, purpose & goals, to focus & motivate all teams',
      'Recognise & adjust to changing situations using flexible leadership',
      'Manage organisational learning at a high level & ensure organisational technical & specialist knowledge',
      'Develop & manage a workforce able to work in complex, difficult & challenging environments',
      'Analyse, design & implement individual & group training & education to achieve goals',
      'Analyse, maintain & report on service resources to achieve organisational vision & goals',
      'Communicate with & provide strategic advice to senior executive leadership & managers',
      'Monitor, coach & mentor key subordinates',
      'Communicate effectively to inform, persuade, substantiate, negotiate or present information',
      'Ensure planning, activities & control measures meet policy guidelines & appropriate standards',
      'Apply, monitor & manage safety standards across the organisation',
      'Allocate & manage investigations, workplace/workforce actions & staff welfare issues',
      'Enact accountable governance responsibilities & ensure compliance with policy, standards & procedures',
      'Plan, allocate & manage organisational activities in often complex & challenging work environments',
    ],
  ),
];
