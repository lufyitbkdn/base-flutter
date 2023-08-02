import 'package:flutter/material.dart';
import 'package:my_wo/app/app.dart';

class WoStarQuestions extends StatelessWidget {
  const WoStarQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        WoListTile(
          leading: _ColoredText(text: 'S', color: WoColors.blue),
          title: 'Situation',
          subtitle: '(Description the Situation, briefly and succinctly)',
        ),
        SizedBox(height: Spacing.s_16),
        WoListTile(
          leading: _ColoredText(text: 'T', color: WoColors.green),
          title: 'Task',
          subtitle: '(Outline the Task you faced in addressing that situation)',
        ),
        SizedBox(height: Spacing.s_16),
        WoListTile(
          leading: _ColoredText(text: 'A', color: WoColors.orange),
          title: 'Actions',
          subtitle:
              '(What actions did you take? How do you operate? What do you do?)',
        ),
        SizedBox(height: Spacing.s_16),
        WoListTile(
          leading: _ColoredText(text: 'R', color: WoColors.purple),
          title: 'Results',
          subtitle:
              '(What business outcome did you accomplish? What was the result?)',
        ),
        SizedBox(height: Spacing.m_25),
      ],
    );
  }
}

class _ColoredText extends StatelessWidget {
  const _ColoredText({
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 34,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
