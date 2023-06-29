import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:{{PROJECT_NAME}}/core/core.dart';
import 'package:{{PROJECT_NAME}}/extensions/extensions.dart';
import 'package:{{PROJECT_NAME}}/services/navigator_service/navigation_service.dart';
import 'package:{{PROJECT_NAME}}/theme/theme.dart';

void showSettingBottomSheet(
  BuildContext context,
  Widget child, {
  Color? backgroundColor,
  bool isFullScreen = false,
}) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: backgroundColor ?? Colors.transparent,
    barrierColor: backgroundColor ?? Colors.transparent,
    isScrollControlled: true,
    constraints: BoxConstraints(
      minHeight: MediaQuery.of(context).size.height -
          (isFullScreen ? 0 : MediaQuery.of(context).padding.top),
      maxHeight: MediaQuery.of(context).size.height -
          (isFullScreen ? 0 : MediaQuery.of(context).padding.top),
      maxWidth: 100.0.w,
    ),
    builder: (context) => GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Span.s15),
              topRight: Radius.circular(Span.s15),
            ),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF373737), Colors.black],
            ),
          ),
          child: child,
        ),
      ),
    ),
  );
}

Future<int?> showAlertDialog({
  required BuildContext context,
  String? title,
  required String message,
  List<String> actions = const ['OK'],
}) {
  return showGeneralDialog<int>(
    context: context,
    barrierColor: Colors.black.withOpacity(0.7),
    pageBuilder: (context, animation, _) {
      return Center(
        child: Container(
          width: min(100.0.w, Span.s282),
          decoration: BoxDecoration(
            color: AppColors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(Span.s14),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: Span.s16),
              if (title != null)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Span.s16,
                  ),
                  child: Text(
                    title,
                    style: heading2TextStyle(
                      textColor: AppColors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              if (title != null) SizedBox(height: Span.s8),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Span.s16,
                ),
                child: Text(
                  message,
                  style: bodyTextStyle(
                    textColor: AppColors.black,
                    fontSize: Span.s13,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: Span.s20),
              Container(
                height: Span.s1,
                color: AppColors.black.withOpacity(0.2),
              ),
              if (actions.isNotEmpty)
                IntrinsicHeight(
                  child: Row(
                    children: List.generate(actions.length, (index) {
                      return Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: Span.s11,
                                ),
                                child: Text(
                                  actions[index],
                                  style: buttonTextStyle(
                                    textColor: AppColors.blue,
                                    fontWeight: index == 0
                                        ? FontWeight.w400
                                        : FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ).onTap(() {
                                Navigator.pop(context, index);
                              }),
                            ),
                            if (index < actions.length)
                              Container(
                                width: Span.s1,
                                color: AppColors.black.withOpacity(0.2),
                              )
                          ],
                        ),
                      );
                    }),
                  ),
                )
            ],
          ),
        ),
      );
    },
  );
}

void showOverlayLoading({BuildContext? context}) {
  context = context ?? locator<NavigationService>().navigatorKey.currentContext;
  if (context != null) {
    showDialog<void>(
      context: context,
      builder: (context) => const FullScreenLoadingIndicator(
        message: '',
      ),
    );
  }
}

void hideOverlayLoading() {
  locator<NavigationService>().navigatorKey.currentState?.pop();
}
