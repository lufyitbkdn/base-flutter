import 'dart:io';
import 'dart:math';

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

Widget safeBottomSpacing(BuildContext context, {double? height}) {
  if (Platform.isIOS && MediaQuery.of(context).padding.bottom != 0) {
    return SizedBox(
      height: max(
        Span.s24,
        (height ?? Span.s48) - MediaQuery.of(context).padding.bottom,
      ),
    );
  }
  return SizedBox(
    height: height ?? Span.s36,
  );
}