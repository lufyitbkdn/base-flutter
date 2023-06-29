import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:{{PROJECT_NAME}}/extensions/widget_extensions.dart';
import 'package:{{PROJECT_NAME}}/theme/color/app_colors.dart';

Widget svgWidget(
  String? imagePath, {
  double? size,
  double? width,
  double? height,
  VoidCallback? onTap,
  Color? color,
  BoxFit fit = BoxFit.contain,
}) {
  if (imagePath == null || imagePath.isEmpty) {
    return Container();
  }
  return SvgPicture.asset(
    imagePath,
    width: width ?? size,
    height: height ?? size,
    fit: fit,
    colorFilter:
        color == null ? null : ColorFilter.mode(color, BlendMode.srcIn),
  ).onTap(onTap);
}

Widget assetImageWidget(
  String? imagePath, {
  double? size,
  double? width,
  double? height,
  Color? color,
  BoxFit? fit,
}) {
  if (imagePath == null || imagePath.isEmpty) {
    return Container();
  }
  return Image.asset(
    imagePath,
    color: color,
    width: width ?? size,
    height: height ?? size,
    fit: fit,
  );
}

Widget cacheNetworkImageWidget(
  String? imagePath, {
  double? size,
  double? width,
  double? height,
  Color? color,
  BoxFit? fit,
}) {
  if (imagePath == null || imagePath.isEmpty) {
    return Container();
  }
  return CachedNetworkImage(
    imageUrl: imagePath,
    width: width ?? size,
    height: height ?? size,
    fit: fit,
    placeholder: (context, url) =>
         ColoredBox(color: AppColors.gray400.withOpacity(0.5)),
    errorWidget: (context, url, error) => const ColoredBox(
      color: AppColors.gray400,
    ),
  );
}
