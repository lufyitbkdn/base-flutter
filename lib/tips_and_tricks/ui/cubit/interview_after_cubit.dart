import 'package:civstart/check_list/ui/cubit/check_list_cubit.dart';
import 'package:civstart/tips_and_tricks/tips_and_tricks.dart';

class InterviewAfterCubit extends CheckListCubit {
  InterviewAfterCubit({
    required AfterInterviewCheckListRepository afterInterviewCheckListRepository,
  }) : super(checklistRepository: afterInterviewCheckListRepository);
}
