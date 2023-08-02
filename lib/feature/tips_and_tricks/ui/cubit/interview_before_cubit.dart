import 'package:my_wo/feature/check_list/ui/cubit/check_list_cubit.dart';
import 'package:my_wo/feature/tips_and_tricks/tips_and_tricks.dart';

class InterviewBeforeCubit extends CheckListCubit {
  InterviewBeforeCubit({
    required BeforeInterviewCheckListRepository
        beforeInterviewCheckListRepository,
  }) : super(checklistRepository: beforeInterviewCheckListRepository);
}
