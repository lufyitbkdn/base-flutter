import 'package:flutter/material.dart';

typedef TextThemeBuilder = TextStyle Function(ThemeData themeData);

class WoText extends StatelessWidget {
  WoText.titleLarge(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.titleLarge!);

  WoText.titleMedium(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.titleMedium!);

  WoText.bodyMedium(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.bodyMedium!);

  WoText.labelMedium(
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
