import 'package:flutter/material.dart';
import 'package:{{PROJECT_NAME}}/theme/theme.dart';

const TextStyle textStyle = TextStyle(
  fontFamily: 'SFPro',
);

TextStyle _baseTextStyle({
  Color? textColor,
  FontStyle? fontStyle,
  FontWeight? fontWeight,
  double? height,
  double? fontSize,
  Color? backgroundColor,
}) =>
    textStyle.copyWith(
      color: textColor ?? AppColors.black,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w400,
      height: height ?? 1,
      fontSize: fontSize ?? Span.s14,
      //14px
      backgroundColor: backgroundColor ?? Colors.transparent,
    );

TextStyle heading1TextStyle({
  Color? textColor,
  FontStyle? fontStyle,
  FontWeight? fontWeight,
  double? height,
  double? fontSize,
  Color? backgroundColor,
}) =>
    _baseTextStyle().copyWith(
      fontSize: fontSize ?? Span.s20,
      //20px
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w400,
      height: height ?? 1,
      color: textColor ?? AppColors.gray800,
    );

TextStyle heading2TextStyle({
  Color? textColor,
  FontStyle? fontStyle,
  FontWeight? fontWeight,
  double? height,
  double? fontSize,
  Color? backgroundColor,
}) =>
    _baseTextStyle().copyWith(
      fontSize: fontSize ?? Span.s18,
      //23px
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w500,
      height: height ?? 1,
      color: textColor ?? AppColors.gray800,
    );

TextStyle heading3TextStyle({
  Color? textColor,
  FontStyle? fontStyle,
  FontWeight? fontWeight,
  double? height,
  double? fontSize,
  Color? backgroundColor,
}) =>
    _baseTextStyle().copyWith(
      fontSize: fontSize ?? Span.s16,
      //23px
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w500,
      height: height ?? 1,
      color: textColor ?? AppColors.gray800,
    );

TextStyle fieldTextStyle({
  Color? textColor,
  FontStyle? fontStyle,
  FontWeight? fontWeight,
  double? height,
  double? fontSize,
  Color? backgroundColor,
}) =>
    _baseTextStyle().copyWith(
      fontSize: fontSize ?? Span.s12,
      //12px
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w500,
      height: height ?? 1,
      color: textColor ?? AppColors.black,
    );

TextStyle bodyTextStyle({
  Color? textColor,
  FontStyle? fontStyle,
  FontWeight? fontWeight,
  double? height,
  double? fontSize,
  Color? backgroundColor,
  String? fontFamily,
}) =>
    _baseTextStyle().copyWith(
      fontSize: fontSize ?? Span.s16,
      //13px
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w400,
      height: height ?? 1,
      color: textColor ?? AppColors.gray500,
      fontFamily: fontFamily,
    );

TextStyle bodySmallTextStyle({
  Color? textColor,
  FontStyle? fontStyle,
  FontWeight? fontWeight,
  double? height,
  double? fontSize,
  Color? backgroundColor,
}) =>
    _baseTextStyle().copyWith(
      fontSize: fontSize ?? Span.s12,
      //13px
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w400,
      height: height ?? 1,
      color: textColor ?? AppColors.gray400,
    );

TextStyle bodyThinTextStyle({
  Color? textColor,
  FontStyle? fontStyle,
  FontWeight? fontWeight,
  double? height,
  double? fontSize,
  Color? backgroundColor,
}) =>
    _baseTextStyle().copyWith(
      fontSize: fontSize ?? Span.s14,
      //13px
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w400,
      height: height ?? 1,
      color: textColor ?? AppColors.gray400,
    );

TextStyle footerTextStyle({
  Color? textColor,
  FontStyle? fontStyle,
  FontWeight? fontWeight,
  double? height,
  double? fontSize,
  Color? backgroundColor,
}) =>
    _baseTextStyle().copyWith(
      fontSize: fontSize ?? Span.s14,
      //13px
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w500,
      height: height ?? 1,
      color: textColor ?? AppColors.black,
    );

TextStyle buttonTextStyle({
  Color? textColor,
  FontStyle? fontStyle,
  FontWeight? fontWeight,
  double? height,
  double? fontSize,
  Color? backgroundColor,
}) =>
    _baseTextStyle().copyWith(
      fontSize: fontSize ?? Span.s16,
      //13px
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.w700,
      height: height ?? 1,
      color: textColor ?? AppColors.black,
    );
