import 'package:civstart/feature/check_list/ui/cubit/check_list_cubit.dart';
import 'package:civstart/feature/tips_and_tricks/tips_and_tricks.dart';

class InterviewAfterCubit extends CheckListCubit {
  InterviewAfterCubit({
    required AfterInterviewCheckListRepository
        afterInterviewCheckListRepository,
  }) : super(checklistRepository: afterInterviewCheckListRepository);
}
