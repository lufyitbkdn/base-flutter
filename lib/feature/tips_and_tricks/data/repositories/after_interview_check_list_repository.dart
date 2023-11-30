import 'package:civstart/feature/check_list/check_list.dart';

class AfterInterviewCheckListRepository extends CheckListRepository {
  AfterInterviewCheckListRepository({required super.checkListsRepository});

  @override
  final checkListId = 'after_interview_check_list';

  @override
  final checkList = [
    const CheckListItem(
      title:
          'Sit down somewhere comfortable and review your notes ASAP - think about the interview, start to finish, recall information that passed between you and the interviewer(s)',
      subtitle: 'Make more notes!',
      isChecked: false,
    ),
    const CheckListItem(
      title: 'Are there any questions that remain unanswered?',
      isChecked: false,
    ),
    const CheckListItem(
        title:
            'Does the role make sense? Do I feel clear on all the information?',
        isChecked: false),
    const CheckListItem(
      title: 'How did I perform?',
      subtitle: 'Rate yourself 1 to 5',
      isChecked: false,
    ),
    const CheckListItem(
      title: 'Were my answers too long?',
      isChecked: false,
    ),
    const CheckListItem(
      title: 'Were my answers too short?',
      isChecked: false,
    ),
    const CheckListItem(
      title: 'Did I feel confident?',
      isChecked: false,
    ),
    const CheckListItem(
      title: 'Did it “feel” right?',
      isChecked: false,
    ),
    const CheckListItem(
      title: 'Did I get my message across?',
      isChecked: false,
    ),
    const CheckListItem(
      title: 'What would I do differently in my next interview?',
      isChecked: false,
    ),
    const CheckListItem(
      title: 'Do I know what is going to happen next?',
      isChecked: false,
    ),
    const CheckListItem(
      title:
          "Within the next business day, send an email to the interviewer - thank them for their time, confirm my interest in the role, ask for any further information that I may need. This is important - it's one of the biggest differentiators, and it puts you at the forefront of the interviewer's mind - again!",
      isChecked: false,
    ),
  ];
}
