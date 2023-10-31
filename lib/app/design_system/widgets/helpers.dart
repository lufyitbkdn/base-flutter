import 'package:civstart/app/app.dart';
import 'package:flutter/material.dart';

// TODO(mfeinstein): [02/08/2023] Check if there are references to this widget being used in the app. It shouldn't!
/// Temporary placeholder widget for simulating content, images, etc.
@Deprecated('Remember to remove this widget from the app')
class CivPlaceholder extends StatelessWidget {
  @Deprecated('Remember to remove this widget from the app')
  const CivPlaceholder({
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
          child: CivText.titleMedium(name),
        ),
      ),
    );
  }
}
