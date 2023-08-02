import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_wo/app/app.dart';

class WoListTile extends StatelessWidget {
  const WoListTile({
    required this.leading,
    required this.title,
    super.key,
    this.subtitle,
  });

  WoListTile.icon({
    required IconData icon,
    required Color color,
    required this.title,
    super.key,
    this.subtitle,
  }) : leading = Icon(
          icon,
          size: iconSize,
          color: color,
        );

  WoListTile.svg({
    required String svgPath,
    required Color color,
    required this.title,
    super.key,
    this.subtitle,
  }) : leading = SvgPicture.asset(
          svgPath,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          width: iconSize,
          height: iconSize,
        );

  static const iconSize = 24.0;

  final Widget leading;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final subtitle = this.subtitle;

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: leading,
        title: WoText.titleMedium(title),
        subtitle: subtitle != null ? WoText.labelMedium(subtitle) : null,
      ),
    );
  }
}
