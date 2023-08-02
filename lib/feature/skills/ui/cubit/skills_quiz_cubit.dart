import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:my_wo/feature/skills/skills.dart';

part 'skills_quiz_cubit.freezed.dart';

class SkillsQuizCubit extends Cubit<SkillsQuizState> {
  SkillsQuizCubit({
    required this.hasCompletedSkillsQuizUseCase,
    required this.skillsRepository,
  }) : super(const SkillsQuizState.loading());

  static final log = Logger('SkillsQuizCubit');

  @visibleForTesting
  final HasCompletedSkillsQuizUseCase hasCompletedSkillsQuizUseCase;
  @visibleForTesting
  final SkillsRepository skillsRepository;

  @visibleForTesting
  int currentQuestionIndex = 0;

  Future<void> load() async {
    emit(const SkillsQuizState.loading());

    try {
      final hasCompletedSkillsQuiz = await hasCompletedSkillsQuizUseCase();

      if (hasCompletedSkillsQuiz) {
        emit(const SkillsQuizState.hasTakenSkillsQuiz());
      } else {
        emit(SkillsQuizState.startTakingSkillsQuiz(
            skillQuestions: skillsRepository.skillQuestions,),);
      }
    } catch (e, s) {
      log.severe('Error while trying to load skills', e, s);
      emit(const SkillsQuizState.errorLoading());
    }
  }

  void handleRetakeTestSelected() => emit(SkillsQuizState.startTakingSkillsQuiz(
      skillQuestions: skillsRepository.skillQuestions,),);

  void goToNextQuestion() {
    final state = this.state;
    if (state is! SkillsQuizStateTakingSkillsQuiz) {
      throw StateError(
          "Can't go to the next question if the user is not taking the quiz",);
    }

    final nextQuestionIndex = currentQuestionIndex + 1;
    final isNextQuestionTheLast =
        nextQuestionIndex == state.scoredQuestions.length - 1;
    if (nextQuestionIndex < state.scoredQuestions.length) {
      currentQuestionIndex = nextQuestionIndex;
    }

    emit(
      state.copyWith(
        canSaveQuestions: isNextQuestionTheLast,
        currentQuestionIndex: currentQuestionIndex,
        canGoToPreviousQuestion: true,
        canGoToNextQuestion: !isNextQuestionTheLast,
      ),
    );
  }

  void goToPreviousQuestion() {
    final previousQuestionIndex = currentQuestionIndex - 1;
    final isPreviousTheFirstQuestion = previousQuestionIndex == 0;
    if (previousQuestionIndex >= 0) {
      currentQuestionIndex = previousQuestionIndex;
    }

    final state = this.state;
    if (state is SkillsQuizStateTakingSkillsQuiz) {
      emit(
        state.copyWith(
          currentQuestionIndex: currentQuestionIndex,
          canGoToPreviousQuestion: !isPreviousTheFirstQuestion,
          canGoToNextQuestion: true,
          canSaveQuestions: false,
        ),
      );
    }
  }

  void changeQuestionScore(int newScore) {
    final state = this.state;
    if (state is! SkillsQuizStateTakingSkillsQuiz) {
      throw StateError(
          'The question score should only change if the user is taking the quiz',);
    }

    final scoredQuestion = state.scoredQuestions[currentQuestionIndex];
    final updatedScoredQuestion = scoredQuestion.copyWith(score: newScore);
    final scoredQuestionsCopy = [...state.scoredQuestions];
    scoredQuestionsCopy[currentQuestionIndex] = updatedScoredQuestion;

    emit(state.copyWith(scoredQuestions: scoredQuestionsCopy));
  }

  Future<void> saveQuestions() async {
    final state = this.state;
    if (state is! SkillsQuizStateTakingSkillsQuiz) {
      throw StateError(
          'The scores should only be saved if the user is taking the quiz',);
    }

    emit(const SkillsQuizState.savingSkillsQuizResults());

    try {
      await skillsRepository.saveSoftSkillsQuizResult(state.scoredQuestions);
    } catch (e, s) {
      log.severe('Error while trying to save skills', e, s);
    }

    emit(const SkillsQuizState.quizFinished());
  }
}

@freezed
sealed class SkillsQuizState with _$SkillsQuizState {
  const factory SkillsQuizState.loading() = SkillsQuizStateLoading;

  const factory SkillsQuizState.errorLoading() = SkillsQuizStateErrorLoading;

  const factory SkillsQuizState.hasTakenSkillsQuiz() =
      SkillsQuizStateHasTakenSkillsQuiz;

  const factory SkillsQuizState.takingSkillsQuiz({
    required List<ScoredSkillQuestion> scoredQuestions,
    required int currentQuestionIndex,
    @Default(false) bool canSaveQuestions,
    @Default(true) bool canGoToPreviousQuestion,
    @Default(true) bool canGoToNextQuestion,
  }) = SkillsQuizStateTakingSkillsQuiz;

  factory SkillsQuizState.startTakingSkillsQuiz(
      {required List<SkillQuestion> skillQuestions,}) {
    final scoredQuestions = skillQuestions.map(
      (question) {
        return ScoredSkillQuestion(skillQuestion: question, score: 0);
      },
    ).toList();

    return SkillsQuizStateTakingSkillsQuiz(
      scoredQuestions: scoredQuestions,
      currentQuestionIndex: 0,
      canGoToPreviousQuestion: false,
    );
  }

  const factory SkillsQuizState.savingSkillsQuizResults() =
      SkillsQuizStateSavingSkillsQuizResults;

  const factory SkillsQuizState.quizFinished() = SkillsQuizStateQuizFinished;
}
