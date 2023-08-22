import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:{{PROJECT_NAME}}/assets.dart';
import 'package:{{PROJECT_NAME}}/core/core.dart';
import 'package:{{PROJECT_NAME}}/theme/theme.dart';

class HeaderBackground extends StatelessWidget {
  const HeaderBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).padding.top + Span.s182,
      width: 100.0.w,
      decoration: BoxDecoration(
        color: AppColors.appColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(Span.s32),
        ),
      ),
      alignment: Alignment.topRight,
      child: svgWidget(
        Assets.assets_svg_oval_header_svg,
        fit: BoxFit.none,
      ),
    );
  }
}
