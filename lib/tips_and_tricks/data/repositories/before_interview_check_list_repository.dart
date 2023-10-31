import 'package:civstart/check_list/check_list.dart';

class BeforeInterviewCheckListRepository extends CheckListRepository {
  BeforeInterviewCheckListRepository({required super.checkListsRepository});

  @override
  final checkListId = 'before_interview_check_list';

  @override
  final checkList = [
    const CheckListItem(
      title: 'Do I have a position description for the role?',
      isChecked: false,
    ),
    const CheckListItem(
      title: 'Have I confirmed the time, day, date, address, company details and the person who will interview me?',
      subtitle: 'How do I get there? How long will it take me?',
      isChecked: false,
    ),
    const CheckListItem(
      title: 'What kind of interview will it be?',
      subtitle: 'Remote (Zoom/Teams/WhatsApp); Panel, 1:1, competency-based, technical interview, etc.',
      isChecked: false,
    ),
    const CheckListItem(
      title: 'Do I need to prepare anything to bring to the interview?',
      subtitle: 'Do I have extra copies of my CV with me?',
      isChecked: false,
    ),
    const CheckListItem(
      title: 'Have I prepared my interview attire?',
      isChecked: false,
    ),
    const CheckListItem(
      title: 'Have I researched the company and its products and services? Do I know what projects and plans they have coming up in the future?',
      isChecked: false,
    ),
    const CheckListItem(
      title: 'What do I know about the interviewer? Have I reviewed their LinkedIn profile?',
      isChecked: false,
    ),
    const CheckListItem(
      title: "What do I know generally about the organisation's people, history, values, mission, and strategic goals?",
      isChecked: false,
    ),
    const CheckListItem(
      title: "Do I know what kind of remuneration structure they pay? What's my negotiating strategy?",
      isChecked: false,
    ),
    const CheckListItem(
      title: 'Have I prepared my answers to standard interview questions?',
      isChecked: false,
    ),
    const CheckListItem(
      title: 'Have I prepared my answers to behavioural or competency-based questions? Have I selected appropriate STAR Stories from my collated Accomplishment stories?',
      isChecked: false,
    ),
    const CheckListItem(
      title: 'What specific strengths or assets do I want to present at the interview?',
      isChecked: false,
    ),
    const CheckListItem(
      title: 'Have I developed a list of questions I want to ask, and practised them?',
      isChecked: false,
    ),
  ];
}
