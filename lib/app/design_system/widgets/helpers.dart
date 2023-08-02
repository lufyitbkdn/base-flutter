import 'package:flutter/material.dart';
import 'package:my_wo/app/app.dart';

/// Temporary placeholder widget for simulating content, images, etc.
@Deprecated('Remember to remove this widget from the app')
class WoPlaceholder extends StatelessWidget {
  @Deprecated('Remember to remove this widget from the app')
  const WoPlaceholder({
    required this.name,
    this.width = double.infinity,
    this.height = double.infinity,
    super.key,
  });

  final String name;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Placeholder(
        child: Center(
          child: WoText.titleMedium(name),
        ),
      ),
    );
  }
}
