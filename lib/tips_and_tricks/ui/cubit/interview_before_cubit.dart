import 'package:civstart/check_list/ui/cubit/check_list_cubit.dart';
import 'package:civstart/tips_and_tricks/tips_and_tricks.dart';

class InterviewBeforeCubit extends CheckListCubit {
  InterviewBeforeCubit({
    required BeforeInterviewCheckListRepository beforeInterviewCheckListRepository,
  }) : super(checklistRepository: beforeInterviewCheckListRepository);
}
