import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:mywo/theme/theme.dart';

enum ButtonType {
  noBorder,
  withBorder,
}

enum IconPosition {
  left,
  right,
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.buttonText,
    this.onPressed,
    this.buttonType = ButtonType.noBorder,
    this.backgroundColor = AppColors.blue,
    this.borderColor = AppColors.blue,
    this.isEnabled = true,
    this.buttonTextColor = AppColors.white,
    this.leftIcon,
    this.rightIcon,
    this.buttonTextFontSize,
    this.buttonTextFontWeight,
    this.lineHeight,
    this.width,
    this.height,
    this.paddingHorizontal,
    this.iconPadding,
    this.hasShadow = true,
  });

  final VoidCallback? onPressed;
  final ButtonType buttonType;
  final Color backgroundColor;
  final Color borderColor;
  final bool isEnabled;
  final String? buttonText;
  final Color buttonTextColor;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final double? buttonTextFontSize;
  final FontWeight? buttonTextFontWeight;
  final double? lineHeight;
  final double? width;
  final double? height;
  final double? paddingHorizontal;
  final double? iconPadding;
  final bool hasShadow;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isEnabled,
      child: SizedBox(
        width: width ?? 100.0.w,
        height: height ?? Span.buttonHeight,
        child: ElevatedButton(
          style: _getButtonStyle(),
          onPressed: onPressed,
          child: _getButtonChild(),
        ),
      ),
    );
  }

  ButtonStyle _getButtonStyle() {
    switch (buttonType) {
      case ButtonType.noBorder:
        return _noBorderButtonStyle();
      case ButtonType.withBorder:
        return _withBorderButtonStyle();
    }
  }

  Widget _getButtonChild() {
    return leftIcon == null && rightIcon == null
        ? Opacity(
            opacity: isEnabled ? 1 : 0.5,
            child: Text(
              buttonText ?? '',
              textAlign: TextAlign.center,
              style: buttonTextStyle(
                textColor: buttonTextColor,
                fontSize: buttonTextFontSize,
                fontWeight: buttonTextFontWeight,
                height: lineHeight ?? 1,
              ),
              maxLines: 1,
            ),
          )
        : Row(
            children: [
              if (leftIcon != null)
                Opacity(
                  opacity: isEnabled ? 1 : 0.5,
                  child: SizedBox(
                    height: Span.s24,
                    width: Span.s24,
                    child: leftIcon,
                  ),
                ),
              if (leftIcon != null)
                SizedBox(
                  width: iconPadding ?? Span.s16,
                ),
              Opacity(
                opacity: isEnabled ? 1 : 0.5,
                child: Text(
                  buttonText ?? '',
                  textAlign: leftIcon == null && rightIcon == null
                      ? TextAlign.center
                      : rightIcon != null
                          ? TextAlign.end
                          : TextAlign.start,
                  style: buttonTextStyle(
                    textColor: buttonTextColor,
                    fontSize: buttonTextFontSize,
                    fontWeight: buttonTextFontWeight,
                    height: lineHeight ?? 1,
                  ),
                  maxLines: 1,
                ),
              ),
              if (rightIcon != null)
                SizedBox(
                  width: iconPadding ?? Span.s16,
                ),
              if (rightIcon != null)
                Opacity(
                  opacity: isEnabled ? 1 : 0.5,
                  child: SizedBox(
                    height: Span.s24,
                    width: Span.s24,
                    child: rightIcon,
                  ),
                ),
            ],
          );
  }

  ButtonStyle _noBorderButtonStyle() {
    return ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor:
          isEnabled ? backgroundColor : backgroundColor.withOpacity(0.5),
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal ?? Span.s20,
      ),
      visualDensity: VisualDensity.standard,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Span.s8),
      ),
    );
  }

  ButtonStyle _withBorderButtonStyle() {
    return ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor:
          isEnabled ? backgroundColor : backgroundColor.withOpacity(0.5),
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal ?? Span.s20,
      ),
      side: BorderSide(
        color: isEnabled ? borderColor : borderColor.withOpacity(0.01),
        width: Span.s1,
      ),
      visualDensity: VisualDensity.standard,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Span.s8),
      ),
    );
  }
}
