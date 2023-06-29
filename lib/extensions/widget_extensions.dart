import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:mywo/core/enum/enum.dart';
import 'package:mywo/theme/theme.dart';

extension WidgetPresentation on Widget {
  /// Make Status bar light
  /// Please declare this widget in the top level
  /// and after adding this widget, restart the screen instead of Hot reload
  /// ```dart
  /// Container().lightStatusBar(),
  /// ```
  Widget lightStatusBar() {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: this,
    );
  }

  /// Make Status bar dark.
  /// Please declare this widget in the top level
  /// and after adding this widget, restart the screen instead of Hot reload
  /// ```dart
  /// Container().darkStatusBar(),
  /// ```
  Widget darkStatusBar() {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: this,
    );
  }

  Widget setStatusBar(StatusBar statusBar) {
    if (statusBar == StatusBar.light) {
      return lightStatusBar();
    }
    return darkStatusBar();
  }

  Widget positioned({
    double? bottom,
    double? right,
    double? top,
    double? left,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) =>
      Positioned(
        top: top ?? topLeft ?? topRight,
        left: left ?? topLeft ?? bottomLeft,
        bottom: bottom ?? bottomLeft ?? bottomRight,
        right: right ?? topRight ?? bottomRight,
        child: this,
      );

  Widget margin({
    double? left,
    double? right,
    double? top,
    double? bottom,
    double? horizontal,
    double? vertical,
    double? all,
  }) {
    final _top = top ?? vertical ?? all ?? 0;
    final _bottom = bottom ?? vertical ?? all ?? 0;
    final _left = left ?? horizontal ?? all ?? 0;
    final _right = right ?? horizontal ?? all ?? 0;
    if (left == 0 && right == 0 && top == 0 && bottom == 0) {
      return this;
    }
    return Container(
      margin: EdgeInsets.only(
        top: _top,
        right: _right,
        bottom: _bottom,
        left: _left,
      ),
      child: this,
    );
  }

  /// Wraps a widget in a [Padding] widget by chaining `paddingOnly(...)`.
  ///
  /// ```dart
  /// Text("PaddedAll").paddingOnly(top: 10, right: 20, bottom: 10, left: 50),
  /// Text("PaddedX").paddingOnly(horizontal: 10),
  /// Text("PaddedAll").paddingOnly(all: 50),
  /// ```
  Widget paddingOnly({
    double? top,
    double? right,
    double? bottom,
    double? left,
    double? horizontal,
    double? vertical,
    double? all,
  }) {
    final _top = top ?? vertical ?? all ?? 0;
    final _bottom = bottom ?? vertical ?? all ?? 0;
    final _left = left ?? horizontal ?? all ?? 0;
    final _right = right ?? horizontal ?? all ?? 0;

    return Padding(
      padding: EdgeInsets.only(
        top: _top,
        right: _right,
        bottom: _bottom,
        left: _left,
      ),
      child: this,
    );
  }

  Widget addElevation({
    double? elevation,
    double? borderRadius,
    Color? backgroundColor,
    Color? shadowColor,
  }) {
    return PhysicalModel(
      color: backgroundColor ?? Colors.transparent,
      elevation: elevation ?? Span.s40,
      shadowColor: shadowColor ?? Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius ?? Span.zero),
      child: this,
    );
  }

  Widget container({
    Color? color,
    double? height,
    double? width,
    Decoration? decoration,
  }) {
    return Container(
      height: height ?? 100.0.h,
      width: width ?? 100.0.w,
      decoration: decoration ??
          BoxDecoration(
            color: color ?? Colors.transparent,
            borderRadius: BorderRadius.circular(Span.zero),
          ),
      child: this,
    );
  }
}

extension WidgetAction on Widget {
  Widget onTap(Function? fn) => fn == null
      ? this
      : GestureDetector(
          onTap: fn as void Function(),
          behavior: HitTestBehavior.translucent,
          child: this,
        );
}
