import 'package:flutter/material.dart';
import 'package:mywo/assets.dart';
import 'package:mywo/core/core.dart';
import 'package:mywo/extensions/extensions.dart';
import 'package:mywo/theme/theme.dart';

class ScaffoldCustom extends StatelessWidget {
  const ScaffoldCustom({
    super.key,
    required this.body,
    this.title,
    this.rightButton,
    this.onBackAction,
    this.rightButtonAction,
    this.overlapTitleBar = false,
    this.isShowBack = true,
    this.background,
    this.backgroundColor = AppColors.white,
    this.appBarWidget,
    this.useDefaultPadding = true,
    this.showAppBar = true,
  });

  final Widget body;
  final dynamic rightButton;
  final String? title;
  final VoidCallback? onBackAction;
  final VoidCallback? rightButtonAction;
  final bool overlapTitleBar;
  final Widget? background;
  final Color backgroundColor;
  final bool isShowBack;
  final PreferredSize? appBarWidget;
  final bool useDefaultPadding;
  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.hideKeyBoard();
      },
      child: ColoredBox(
        color: backgroundColor,
        child: Stack(
          children: [
            if (background != null) background!,
            Scaffold(
              backgroundColor:
                  background != null ? Colors.transparent : Colors.white,
              appBar:
                  showAppBar ? (appBarWidget ?? _displayAppbar(context)) : null,
              extendBody: true,
              extendBodyBehindAppBar: true,
              body: Padding(
                padding: useDefaultPadding
                    ? EdgeInsets.symmetric(
                        horizontal: Span.horizontalPadding,
                        vertical: Span.verticalPadding,
                      )
                    : EdgeInsets.zero,
                child: SafeArea(
                  child: body,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSize? _displayAppbar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(Span.toolbarHeight),
      child: SafeArea(
        child: SizedBox(
          height: Span.s54,
          child: Row(
            children: [
              if (isShowBack)
                Container(
                  height: Span.s54,
                  padding: EdgeInsets.only(right: Span.s16, left: Span.s16),
                  child: svgWidget(
                    Assets.assets_svg_back_svg,
                  ),
                ).onTap(() {
                  if (onBackAction != null) {
                    onBackAction?.call();
                  } else if (Navigator.canPop(context)) {
                    Navigator.of(context).pop();
                  }
                }),
              Expanded(
                child: Text(
                  title ?? '',
                  style: bodyTextStyle(),
                ),
              ),
              if (rightButton != null)
                Container(
                  height: Span.s54,
                  padding: EdgeInsets.symmetric(horizontal: Span.s16),
                  child: rightButton is Widget
                      ? Center(
                          child: rightButton as Widget,
                        )
                      : Center(
                          child: Text(
                            rightButton.toString(),
                            style: buttonTextStyle(),
                          ),
                        ),
                ).onTap(() {
                  rightButtonAction?.call();
                })
            ],
          ),
        ),
      ),
    );
  }
}
