import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:{{PROJECT_NAME}}/core/widgets/capped_progress_indicator.dart';
import 'package:{{PROJECT_NAME}}/theme/theme.dart';

class FullScreenLoadingIndicator extends StatelessWidget {
  const FullScreenLoadingIndicator({
    super.key,
    this.message = 'Analyzing',
  });

  final String message;

  @override
  Widget build(BuildContext context) => Container(
        width: 100.0.w,
        height: 100.0.h,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: Span.s40,
              height: Span.s40,
              child: CircularCappedProgressIndicator(
                strokeWidth: Span.s4,
                color: AppColors.white,
                backgroundColor: const Color(0x44E0E0E0),
              ),
            ),
            Visibility(
              visible: message.isNotEmpty,
              child: Padding(
                padding: EdgeInsets.only(top: Span.s24),
                child: Text(
                  message,
                  style: heading2TextStyle(),
                ),
              ),
            )
          ],
        ),
      );
}
