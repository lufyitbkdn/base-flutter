import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mywo/theme/theme.dart';

class CommonTextField extends StatefulWidget {
  CommonTextField({
    super.key,
    this.hint = 'Please specify',
    this.controller,
    this.maxLength,
    this.inputFormatters,
    this.maxLines = 1,
    double? height,
    this.onChange,
    this.enabled = true,
    TextInputType? keyboardType,
    TextCapitalization? textCapitalization,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.obscureText = false,
    this.onTap,
    this.label,
    this.errorText,
    this.borderColor = AppColors.black,
    this.focussedBorderColor= AppColors.black,
    this.errorBorderColor= AppColors.red,
    this.textColor = AppColors.black,
    this.hintColor = AppColors.gray400,
  })  : height = height ?? Span.s50,
        keyboardType = keyboardType ?? TextInputType.text,
        textCapitalization = textCapitalization ?? TextCapitalization.sentences;

  final String? hint;
  final int? maxLength;
  final TextEditingController? controller;
  final void Function(String text)? onChange;
  final double height;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final bool enabled;
  final bool readOnly;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final String? label;
  final String? errorText;
  final Color focussedBorderColor;
  final Color errorBorderColor;
  final Color borderColor;
  final Color textColor;
  final Color hintColor;

  @override
  State<StatefulWidget> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool _obscureText = true;
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller  = widget.controller?? TextEditingController();
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label?.isNotEmpty ?? false) ...[
            Text(
              widget.label ?? '',
              style: bodyTextStyle(),
            ),
            SizedBox(
              height: Span.s12,
            )
          ],
          TextFormField(
            controller: widget.controller,
            cursorColor: AppColors.blue50,
            inputFormatters: widget.inputFormatters ?? [],
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            onTap: widget.onTap,
            onChanged: widget.onChange,
            magnifierConfiguration: TextMagnifierConfiguration.disabled,
            style: bodyTextStyle().copyWith(
              color: widget.enabled
                  ? widget.textColor
                  : widget.textColor.withOpacity(0.5),
            ),
            textAlign: TextAlign.left,
            readOnly: widget.readOnly,
            obscureText: _obscureText,
            keyboardType: widget.keyboardType,
            textCapitalization: widget.obscureText
                ? TextCapitalization.none
                : widget.textCapitalization,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: Span.s16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Span.s8),
                borderSide: BorderSide(
                  width: Span.s1,
                  color: widget.borderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Span.s8),
                borderSide: BorderSide(
                  width: Span.s1,
                  color: widget.focussedBorderColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Span.s8),
                borderSide: BorderSide(
                  width: Span.s1,
                  color: widget.borderColor,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Span.s8),
                borderSide: BorderSide(
                  width: Span.s1,
                  color: widget.borderColor.withOpacity(0.2),
                ),
              ),
              hintText: widget.hint,
              hintStyle: bodyTextStyle().copyWith(
                color: widget.hintColor,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Span.s8),
                borderSide: BorderSide(
                  width: Span.s1,
                  color: widget.errorBorderColor,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Span.s8),
                borderSide: BorderSide(
                  width: Span.s1,
                  color: widget.focussedBorderColor,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: widget.obscureText
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      color: AppColors.black.withOpacity(0.4),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
            ),
            enabled: widget.enabled,
          ),
          Visibility(
            visible: widget.errorText != null && widget.errorText!.isNotEmpty,
            child: Padding(
              padding: EdgeInsets.only(top: Span.s12),
              child: Text(
                widget.errorText ?? '',
                style: bodyTextStyle(),
              ),
            ),
          )
        ],
      );
}

class TransparentTextField extends StatelessWidget {
  TransparentTextField({
    super.key,
    this.hint = '',
    TextEditingController? controller,
    this.maxLength,
    this.inputFormatters,
    this.maxLines,
    this.height,
    this.onChange,
    this.enabled = true,
    TextInputType? keyboardType,
    TextCapitalization? textCapitalization,
    this.textInputAction,
  })  : controller = controller ?? TextEditingController(),
        keyboardType = keyboardType ?? TextInputType.text,
        textCapitalization = textCapitalization ?? TextCapitalization.sentences;

  final String? hint;
  final int? maxLength;
  final TextEditingController controller;
  final void Function(String? text)? onChange;
  final double? height;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final bool enabled;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.white,
      inputFormatters: inputFormatters ?? [],
      maxLines: maxLines,
      maxLength: maxLength,
      onChanged: onChange,
      magnifierConfiguration: TextMagnifierConfiguration.disabled,
      style: bodyTextStyle().copyWith(
        color: enabled ? AppColors.white : AppColors.white.withOpacity(0.5),
      ),
      textAlign: TextAlign.left,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: hint,
        hintStyle: bodyTextStyle().copyWith(
          color: AppColors.white.withOpacity(0.4),
        ),
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      enabled: enabled,
    );
  }
}
