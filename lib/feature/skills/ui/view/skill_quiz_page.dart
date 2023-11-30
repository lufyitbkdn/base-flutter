import 'dart:math';

import 'package:civstart/app/app.dart';
import 'package:civstart/assets.dart';
import 'package:civstart/feature/skills/skills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SkillQuizPage extends StatefulWidget {
  const SkillQuizPage({super.key});

  static const String routeName = 'skill_quiz';

  @override
  State<SkillQuizPage> createState() => _SkillQuizPageState();
}

class _SkillQuizPageState extends State<SkillQuizPage> {
  final bloc = getIt<SkillsQuizCubit>();

  @override
  void initState() {
    super.initState();
    bloc.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentBody(
        title: 'Skills Quiz',
        svgIconPath: Assets.assets_images_ico_quiz_svg,
        iconColor: CivColors.blue,
        children: [
          PaddedContent(
            children: [
              const SizedBox(height: Spacing.s_16),
              CivText.titleMedium('Know your Soft Skills'),
              const SizedBox(height: Spacing.s_16),
              CivText.bodyMedium(
                  'Soft skills are a combination of both social, interpersonal, character or personality traits and attitudes. They can be learnt, expanded and increased. So if you feel you lack in some, the good news is you can improve with practise and exercises.'),
              const SizedBox(height: Spacing.l_32),
              BlocConsumer<SkillsQuizCubit, SkillsQuizState>(
                listener: (context, state) {
                  if (state is SkillsQuizStateQuizFinished) {
                    context.goNamed(SoftSkillsPage.routeName);
                  }
                },
                bloc: bloc,
                builder: (context, state) {
                  return switch (state) {
                    SkillsQuizStateHasTakenSkillsQuiz() => Center(
                        child: CivButton.primaryFilled(
                          title: 'Retake the Skills Quiz',
                          onPressed: bloc.handleRetakeTestSelected,
                        ),
                      ),
                    SkillsQuizStateTakingSkillsQuiz() => SkillsQuizQuestions(
                        scoredQuestions: state.scoredQuestions,
                        currentQuestionIndex: state.currentQuestionIndex,
                        onScoreChanged: bloc.changeQuestionScore,
                        onNextPressed: state.canSaveQuestions
                            ? bloc.saveQuestions
                            : bloc.goToNextQuestion,
                        onBackPressed: bloc.goToPreviousQuestion,
                        shouldShowSaveButton: state.canSaveQuestions,
                        canGoToPreviousQuestion: state.canGoToPreviousQuestion,
                        canGoToNextQuestion: state.canGoToNextQuestion,
                      ),
                    SkillsQuizStateLoading() || //
                    SkillsQuizStateErrorLoading() || //
                    SkillsQuizStateSavingSkillsQuizResults() || //
                    SkillsQuizStateQuizFinished() =>
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                  };
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillsQuizQuestions extends StatefulWidget {
  const SkillsQuizQuestions({
    required this.scoredQuestions,
    required this.currentQuestionIndex,
    required this.onNextPressed,
    required this.onBackPressed,
    required this.onScoreChanged,
    required this.shouldShowSaveButton,
    required this.canGoToPreviousQuestion,
    required this.canGoToNextQuestion,
    super.key,
  });

  final List<ScoredSkillQuestion> scoredQuestions;
  final int currentQuestionIndex;
  final VoidCallback onNextPressed;
  final VoidCallback onBackPressed;
  final ValueChanged<int> onScoreChanged;
  final bool shouldShowSaveButton;
  final bool canGoToPreviousQuestion;
  final bool canGoToNextQuestion;

  @override
  State<SkillsQuizQuestions> createState() => _SkillsQuizQuestionsState();
}

class _SkillsQuizQuestionsState extends State<SkillsQuizQuestions> {
  final pageController = PageController();

  @override
  void didUpdateWidget(SkillsQuizQuestions oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentQuestionIndex != widget.currentQuestionIndex) {
      pageController.animateToPage(
        widget.currentQuestionIndex,
        duration: AnimationDuration.short,
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = max(MediaQuery.of(context).textScaleFactor, 1);
    final questionsHeight = 230.0 * textScaleFactor;

    return Column(
      children: [
        CivText.labelMedium(
            'Question ${widget.currentQuestionIndex + 1} of ${widget.scoredQuestions.length}'),
        SizedBox(
          height: questionsHeight,
          child: PageView.builder(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.scoredQuestions.length,
            itemBuilder: (context, index) {
              return SkillQuizItem(
                scoredQuestion: widget.scoredQuestions[index],
                onChanged: widget.onScoreChanged,
              );
            },
          ),
        ),
        Row(
          children: [
            CivButton.primaryOutlined(
              title: 'Back',
              onPressed:
                  widget.canGoToPreviousQuestion ? widget.onBackPressed : null,
            ),
            const Spacer(),
            CivButton.primaryFilled(
              title: widget.shouldShowSaveButton ? 'Finish' : 'Next',
              onPressed: widget.onNextPressed,
            ),
          ],
        ),
        const SizedBox(height: Spacing.s_16),
      ],
    );
  }
}

class SkillQuizItem extends StatelessWidget {
  const SkillQuizItem({
    required this.scoredQuestion,
    required this.onChanged,
    super.key,
  });

  final ScoredSkillQuestion scoredQuestion;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CivText.titleMedium(scoredQuestion.skillQuestion.question),
        const SizedBox(height: Spacing.s_16),
        Slider(
          max: 7,
          divisions: 7,
          value: scoredQuestion.score.toDouble(),
          label: scoredQuestion.score.toString(),
          onChanged: (score) => onChanged(score.toInt()),
        ),
        Row(
          children: [
            CivText.labelMedium('Strongly\nDisagree'),
            const Spacer(),
            DefaultTextStyle.merge(
              textAlign: TextAlign.end,
              child: CivText.labelMedium('Strongly\nAgree'),
            ),
          ],
        ),
      ],
    );
  }
}
