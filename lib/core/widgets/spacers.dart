import 'package:flutter/material.dart';
import 'package:{{PROJECT_NAME}}/theme/theme.dart';

class PaddingSpace extends StatelessWidget {
  const PaddingSpace({
    super.key,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.child,
  });

  const PaddingSpace.horizontal([
    Key? key,
    double size = 16,
  ]) : this(
          key: key,
          verticalPadding: size,
        );
  const PaddingSpace.vertical([
    Key? key,
    double size = 16,
  ]) : this(
          key: key,
          horizontalPadding: size,
        );
  final double horizontalPadding;
  final double? verticalPadding;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final horizontal = horizontalPadding / 2;
    final vertical = verticalPadding! / 2;

    final child = this.child ?? Container();
    final content =
        (horizontal > 0) ? Row(children: [child]) : Column(children: [child]);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      child: content,
    );
  }
}

class HorizontalSpacing extends PaddingSpace {
  HorizontalSpacing.s2({super.key}) : super(horizontalPadding: Span.s2);
  HorizontalSpacing.s4({super.key}) : super(horizontalPadding: Span.s4);
  HorizontalSpacing.s8({super.key}) : super(horizontalPadding: Span.s8);
  HorizontalSpacing.s10({super.key}) : super(horizontalPadding: Span.s10);
  HorizontalSpacing.s12({super.key}) : super(horizontalPadding: Span.s12);
  HorizontalSpacing.s16({super.key}) : super(horizontalPadding: Span.s16);
  HorizontalSpacing.s20({super.key}) : super(horizontalPadding: Span.s20);
  HorizontalSpacing.s24({super.key}) : super(horizontalPadding: Span.s24);
  HorizontalSpacing.s28({super.key}) : super(horizontalPadding: Span.s28);
  HorizontalSpacing.s32({super.key}) : super(horizontalPadding: Span.s32);
  HorizontalSpacing.s36({super.key}) : super(horizontalPadding: Span.s36);
  HorizontalSpacing.s40({super.key}) : super(horizontalPadding: Span.s40);
  HorizontalSpacing.s48({super.key}) : super(horizontalPadding: Span.s48);
  HorizontalSpacing.s56({super.key}) : super(horizontalPadding: Span.s56);
  HorizontalSpacing.s64({super.key}) : super(horizontalPadding: Span.s64);
  HorizontalSpacing.s68({super.key}) : super(horizontalPadding: Span.s68);
  HorizontalSpacing.s72({super.key}) : super(horizontalPadding: Span.s72);
}

class VerticalSpacing extends PaddingSpace {
  VerticalSpacing.s2({super.key}) : super(verticalPadding: Span.s2);
  VerticalSpacing.s4({super.key}) : super(verticalPadding: Span.s4);
  VerticalSpacing.s6({super.key}) : super(verticalPadding: Span.s6);
  VerticalSpacing.s8({super.key}) : super(verticalPadding: Span.s8);
  VerticalSpacing.s10({super.key}) : super(verticalPadding: Span.s10);
  VerticalSpacing.s12({super.key}) : super(verticalPadding: Span.s12);
  VerticalSpacing.s16({super.key}) : super(verticalPadding: Span.s16);
  VerticalSpacing.s18({super.key}) : super(verticalPadding: Span.s18);
  VerticalSpacing.s20({super.key}) : super(verticalPadding: Span.s20);
  VerticalSpacing.s24({super.key}) : super(verticalPadding: Span.s24);
  VerticalSpacing.s28({super.key}) : super(verticalPadding: Span.s28);
  VerticalSpacing.s32({super.key}) : super(verticalPadding: Span.s32);
  VerticalSpacing.s36({super.key}) : super(verticalPadding: Span.s36);
  VerticalSpacing.s40({super.key}) : super(verticalPadding: Span.s40);
  VerticalSpacing.s48({super.key}) : super(verticalPadding: Span.s48);
  VerticalSpacing.s50({super.key}) : super(verticalPadding: Span.s50);
  VerticalSpacing.s56({super.key}) : super(verticalPadding: Span.s56);
  VerticalSpacing.s64({super.key}) : super(verticalPadding: Span.s64);
  VerticalSpacing.s68({super.key}) : super(verticalPadding: Span.s68);
  VerticalSpacing.s72({super.key}) : super(verticalPadding: Span.s72);
  VerticalSpacing.s88({super.key}) : super(verticalPadding: Span.s88);
  VerticalSpacing.s102({super.key}) : super(verticalPadding: Span.s102);
  VerticalSpacing.s182({super.key}) : super(verticalPadding: Span.s182);
}
