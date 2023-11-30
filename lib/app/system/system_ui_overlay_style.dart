import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

extension SystemUiOverlayStyleAnnotationExtension on List<Widget> {
  List<Widget> annotateWithSystemUiOverlayStyle(
      SystemUiOverlayStyle systemUiOverlayStyle) {
    return map((child) {
      return AnnotatedRegion(
        value: SystemUiOverlayStyle.dark,
        child: child,
      );
    }).toList();
  }
}
