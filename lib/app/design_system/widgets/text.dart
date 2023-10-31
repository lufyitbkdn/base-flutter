import 'package:flutter/material.dart';

typedef TextThemeBuilder = TextStyle Function(ThemeData themeData);

class CivText extends StatelessWidget {
  CivText.titleLarge(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.titleLarge!);

  CivText.titleMedium(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.titleMedium!);

  CivText.bodyMedium(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.bodyMedium!);

  CivText.labelMedium(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.labelMedium!);

  final String text;
  @visibleForTesting
  final TextThemeBuilder textThemeBuilder;
  final TextStyle? mergeStyleWith;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: textThemeBuilder(Theme.of(context)).merge(mergeStyleWith),
    );
  }
}
